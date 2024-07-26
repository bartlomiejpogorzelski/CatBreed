class ChatGptService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize
    @headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}"
    }
  end

  def ping
    self.class.get('/engines', headers: @headers)
  end
end
