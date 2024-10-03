# frozen_string_literal: true

class Quizzes::QuizShowComponent < ViewComponent::Base

  def initialize(quiz:)
    @quiz = quiz
  end

  private

  attr_reader :quiz

  
end
