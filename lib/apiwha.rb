require "apiwha/version"
require "apiwha/api"
require "apiwha/error"

module Apiwha
  extend self

  def new(api_key)
    Api.new(api_key)
  end
end
