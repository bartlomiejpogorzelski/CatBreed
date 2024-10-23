# class QuizGenerationService
#   def initialize(chat_gpt_question_service)
#     @chat_gpt_question_service = chat_gpt_question_service
#   end

#   def create_quiz(topic)
#     prompt = <<~PROMPT
#       Create a quiz about #{topic}. Only one. Please provide the following:
#       1. Question: <Your question>
#       2. Choices: 
#          a) <Choice A>
#          b) <Choice B>
#          c) <Choice C>
#          d) <Choice D>
#       3. Correct answer: <a, b, c, or d>
#     PROMPT
  
#     response = @chat_gpt_question_service.ask_question(prompt)
#     puts "API Response: #{response.inspect}"
#     question_blocks = split_blocks(response)
#     question_blocks.each do |block|
#       next if block.empty?
  
#       if valid_block?(block)
#         question_text, choices, correct_choice = parse_block(block)
  
#         # Check is question exist
#         existing_quiz = Quiz.find_by(question: question_text)
  
#         if existing_quiz
#           puts "Duplicate question found: #{question_text}"
#           # 
#         else
#           Quiz.create(
#             question: question_text,
#             choice_a: choices[0],
#             choice_b: choices[1],
#             choice_c: choices[2],
#             choice_d: choices[3],
#             correct_choice: correct_choice
#           )
#         end
#       else
#         raise "Incomplete or invalid response data"
#       end
#     end
#   end
  
#   private

#   def split_blocks(response)
#     # Divide blocks
#     response.split(/(?=1\. Question:)/).map(&:strip)
#   end

#   def valid_block?(block)
#     block.include?("Question:") && block.include?("Choices:") && block.include?("Correct answer:")
#   end

#   def parse_block(block)
#     lines = block.split("\n").map(&:strip)
  
#     # Line need to start by a) b) c) d)
#     choice_lines = lines.select { |line| line.match?(/^[a-d]\)/) }
  
#     question_text = extract_text(lines[0])
#     choices = choice_lines.map { |line| extract_choice_text(line) }
    
#     # 
#     correct_choice_letter = extract_text(lines.last)&.split(")")&.first&.strip.downcase
#     correct_choice = extract_correct_choice(correct_choice_letter, choices)
    
#     [question_text, choices, correct_choice]
#   end
  
#   def extract_text(text)
#     text&.split(": ", 2)&.last&.strip
#   end

#   def extract_choice_text(choice)
#     return nil if choice.nil? || choice.strip.empty?
#     choice.split(") ", 2)[1]&.strip
#   end

#   def extract_correct_choice(correct_choice_letter, choices)
#     index = %w[a b c d].index(correct_choice_letter)
#     index ? choices[index] : nil
#   end
# end
