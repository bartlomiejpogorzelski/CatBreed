# app/services/bulk_quiz_generation_service.rb

class BulkQuizGenerationService
  def initialize(quiz_generation_service)
    @quiz_generation_service = quiz_generation_service
  end

  def create_multiple_quizzes(topic, count)
    count.times do |i|
      begin
        puts "Creating quiz #{i + 1} of #{count}"
        @quiz_generation_service.create_quiz(topic)
        sleep(1) # Opcjonalnie, aby uniknąć przekroczenia limitu API
      rescue StandardError => e
        puts "Error creating quiz #{i + 1}: #{e.message}"
      end
    end
  end
end
