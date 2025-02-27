# The Openai class is responsible for interacting with the OpenAI API.
class Openai
  attr_reader :request, :uri, :body

  OPENAI_COMPLETION_URL = "https://api.openai.com/v1/chat/completions"

  def initialize(prompt: "", model: "gpt-4o-mini", role: :user)
    @body = {
      model: model,
      messages: [ { role: role, content: prompt } ]
    }
    @uri = URI.parse(OPENAI_COMPLETION_URL)
    @request = build_request
  end

  def chat
    begin
      response = Net::HTTP.start(uri.hostname, uri.port, { use_ssl: true }) do |http|
        http.request(request)
      end
      hash = JSON.parse(response.body).to_h
      ServiceResponse.new(success: true, content: hash["choices"][0]["message"]["content"])
    rescue => error
      ServiceResponse.new(success: false, error: error.full_message, code: response.code)
    end
  end

  # The OpenaiException class is a simple class that extends the StandardError class.
  class OpenaiException < StandardError
    def initialize(error)
      super(error)
    end
  end

  private

  def build_request
    request = Net::HTTP::Post.new(
      uri,
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{Rails.application.credentials.openai[:api_key]}"
    )

    request.body = body.to_json
    request
  end
end
