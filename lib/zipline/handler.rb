require 'zipline/handler/basic_i_o'

module Zipline
  module Handler
    module_function

    def handle!(attachment)
      handler = handler_for(attachment) || raise(ArgumentError, 'bad file')
      handler.handle!(attachment)
    end

    def handler_for(attachment)
      handlers.find { |h| h.handles?(attachment) }
    end

    def handlers
      @handlers ||= [BasicIO]
    end

    private

    def self.load_handler(handler)
      require('zipline/handler/' + handler)
      handlers.unshift handler_class(handler)
    end

    def self.handler_class(handler)
      const_get handler.dup.split(/_/).map { |word| word.capitalize }.join('')
    end

    defined?(::Paperclip) && self.load_handler('paperclip')
    defined?(::CarrierWave) && self.load_handler('carrier_wave')
  end
end
