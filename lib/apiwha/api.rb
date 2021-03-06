require 'json'
require 'rest-client'

module Apiwha
  class Api
    API_URL = 'https://panel.apiwha.com'

    DEFAULT_OPTIONS = {
      number: nil,
      type: nil, 
      markaspulled: "0", 
      getnotpulledonly: "0", 
      limit: 100, 
      orderdesc: "1"
    }.freeze

    attr_reader :api_key

  	def initialize(api_key)
  		@api_key = api_key
  	end

    def pull_messages(params: DEFAULT_OPTIONS)
      response = RestClient.get("#{API_URL}/get_messages.php?apikey=#{@api_key}", { params: params })
      response(response: response)
    end

    def send_message(text: , number: , custom_data: {})
      payload = { 
        text:  text, 
        number: number, 
        apikey: @api_key,
        custom_data: custom_data.to_json
      }
  
      response = RestClient.post "#{API_URL}/send_message.php?", payload

      response(response: response)
    end

    def get_credit
      response = RestClient.get("#{API_URL}/get_credit.php?apikey=#{@api_key}")
      
      response(response: response)
    end

    private

    def response(response: )
      return JSON.parse(response.body) if response.code.to_i == 200
      
      raise Error.new(response)
    end
  end
end
