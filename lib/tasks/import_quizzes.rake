
namespace :import do
  desc "Import quizzes from quizzes.csv"
  task quizzes: :environment do
    require 'csv'
    
    file_path = Rails.root.join("quizzes.csv")
    
    CSV.foreach(file_path, headers: true, col_sep: ';') do |row|
      Quiz.create!(
        question: row["question"],
        choice_a: row["choice_a"],
        choice_b: row["choice_b"],
        choice_c: row["choice_c"],
        choice_d: row["choice_d"],
        correct_choice: row["correct_choice"]
      )
    end
    
    puts "Quizzes imported correctly."
  end
end
