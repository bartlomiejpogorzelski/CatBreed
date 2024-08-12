class QuizGenerationService
  def initialize(chat_gpt_question_service)
    @chat_gpt_question_service = chat_gpt_question_service
  end

  def create_quiz(topic)
    prompt = <<~PROMPT
      Create a single quiz question about #{topic}. Please provide the following:
      1. Question: <Your question>
      2. Choices: 
        a) <Choice A>
        b) <Choice B>
        c) <Choice C>
        d) <Choice D>
      3. Correct answer: <a, b, c, or d>
    PROMPT

    response = @chat_gpt_question_service.ask_question(prompt)
    puts "API Response: #{response.inspect}"

    begin
      # Rozdziel odpowiedź na bloki pytań
      question_blocks = split_blocks(response)
      question_blocks.each do |block|
        next if block.empty?

        # Sprawdź, czy blok zawiera pełne dane
        if valid_block?(block)
          question_text, choices, correct_choice = parse_block(block)
          
          Quiz.create(
            question: question_text,
            choice_a: choices[0],
            choice_b: choices[1],
            choice_c: choices[2],
            choice_d: choices[3],
            correct_choice: correct_choice
          )
        else
          raise "Incomplete or invalid response data"
        end
      end
    rescue => e
      puts "Error creating quiz: #{e.message}"
      nil
    end
  end

  private

  def split_blocks(response)
    # Podziel odpowiedź na bloki pytań na podstawie podziału
    response.split(/(?=1\. Question:)/).map(&:strip)
  end

  def valid_block?(block)
    # Sprawdź, czy blok zawiera wszystkie wymagane elementy
    block.include?("Question:") && block.include?("Choices:") && block.include?("Correct answer:")
  end

  def parse_block(block)
    lines = block.split("\n").map(&:strip)
  
    # Wybieramy linie, które zawierają rzeczywiste wybory odpowiedzi (linia musi zaczynać się od a), b), c) lub d))
    choice_lines = lines.select { |line| line.match?(/^[a-d]\)/) }
  
    question_text = extract_text(lines[0])
    choices = choice_lines.map { |line| extract_choice_text(line) }
    
    # Poprawka: ekstrakcja samej litery z ostatniej linii
    correct_choice_letter = extract_text(lines.last)&.split(")")&.first&.strip.downcase
    correct_choice = extract_correct_choice(correct_choice_letter, choices)
    
    [question_text, choices, correct_choice]
  end
  
  

  def extract_text(text)
    text&.split(": ", 2)&.last&.strip
  end

  def extract_choice_text(choice)
    return nil if choice.nil? || choice.strip.empty?
    choice.split(") ", 2)[1]&.strip
  end

  def extract_correct_choice(correct_choice_letter, choices)
    index = %w[a b c d].index(correct_choice_letter)
    index ? choices[index] : nil
  end
end
