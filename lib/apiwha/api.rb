require 'uri'
require 'json'
require 'hashie'
require 'rest-client'

module Apiwha
  class Api
    API_URL = 'http://panel.apiwha.com'

    attr_reader :api_key

    class Response < Hashie::Mash
      disable_warnings
    end

  	def initialize(api_key)
  		@api_key = api_key
  	end

    # Pull messages
    def messages(number: nil, type: nil, markaspulled: false, getnotpulledonly: false, limit: 100, orderdesc: true)
      params = {}
      params.merge!({ number: number }) if number
      params.merge!({ type: type }) if type
      params.merge!({ markaspulled: "1" }) if markaspulled
      params.merge!({ getnotpulledonly: "1" }) if getnotpulledonly
      params.merge!({ limit: limit }) if limit
      params.merge!({ orderdesc: "1" }) if orderdesc
  
      response = RestClient.get("#{API_URL}/get_messages.php?apikey=#{@api_key}", { params: params })
      
      JSON.parse(response.body).map do |res|
        Response.new(res)
      end
    end
  end
end
