# # app/services/api_chat_gpt_connection_service.rb

# class ApiChatGptConnectionService
#   include HTTParty
#   base_uri 'https://api.openai.com/v1'

#   def initialize(api_key)
#     @headers = {
#       "Content-Type" => "application/json",
#       "Authorization" => "Bearer #{api_key}"
#     }
#   end

#   def post(path, body)
#     self.class.post(path, headers: @headers, body: body)
#   end
# end
