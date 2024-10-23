class QuizzesController < ApplicationController
  
  def index
    @quizzes = Quiz.order("RANDOM()").limit(10)
    render(Quizzes::QuizListComponent.new(quizzes: @quizzes))
  end

  def new
  end

  def create
    service = ChatGptService.new
    prompt = "Create a quiz about cat breeds."
    response = service.generate_quiz(prompt)

    question_text, answer_text = response.split("\n", 2)
    @quiz = Quiz.create(question: question_text.strip, answer: answer_text.strip)

    redirect_to quiz_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
end
