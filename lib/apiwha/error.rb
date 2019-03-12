module Apiwha
  class Error < StandardError

    attr_reader :reason

    def initialize(response)
      @reason = response['reason']
    end

    def message
      "#{@reason}"
    end
    alias :to_s :message
  end
end