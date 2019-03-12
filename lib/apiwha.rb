require "apiwha/version"
require "apiwha/api"

module Apiwha
  extend self

  class Error < StandardError; end

  def new(api_key)
    Api.new(api_key)
  end
end
