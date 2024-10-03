# frozen_string_literal: true

class Quizzes::QuizListComponent < ViewComponent::Base
  def initialize(quizzes:)
    @quizzes = quizzes
  end
end
