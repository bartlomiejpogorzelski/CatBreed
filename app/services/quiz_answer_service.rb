# class QuizAnswerService
#   def initialize(quiz, user_choice)
#     @quiz = quiz
#     @user_choice = user_choice
#   end

#   def call
#     selected_choice = case @user_choice
#                       when "A" then @quiz.choice_a
#                       when "B" then @quiz.choice_b
#                       when "C" then @quiz.choice_c
#                       when "D" then @quiz.choice_d
#                       end

#     correct = selected_choice == @quiz.correct_choice

#     {
#       correct: correct,
#       correct_choice: @quiz.correct_choice
#     }
#   end
# end
