class AddChoicesToQuizzes < ActiveRecord::Migration[7.0]
  def change
    change_table :quizzes do |t|
      t.string :choice_a
      t.string :choice_b
      t.string :choice_c
      t.string :choice_d
      t.string :correct_choice
    end
  end
end
