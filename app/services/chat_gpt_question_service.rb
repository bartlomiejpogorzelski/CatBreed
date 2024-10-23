# # app/services/chat_gpt_question_service.rb

# class ChatGptQuestionService
#   def initialize(api_connection_service)
#     @api_connection_service = api_connection_service
#   end

#   def ask_question(prompt)
#     body = {
#       model: "gpt-3.5-turbo",
#       messages: [{ role: "user", content: prompt }],
#       max_tokens: 150
#     }
    
#     # Convert body to json
#     body_json = body.to_json
#     response = @api_connection_service.post('/chat/completions', body_json)
#     puts "API Response: #{response.parsed_response.inspect}"

#     choices = response.parsed_response['choices']
    
#     if choices.nil? || choices.empty?
#       raise "Invalid API response: #{response.parsed_response.inspect}"
#     end
    
#     choices.first['message']['content'].strip
#   end
# end
