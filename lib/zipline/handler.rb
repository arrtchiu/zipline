require 'zipline/handler/paperclip'
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
      [
        Paperclip,
        BasicIO
      ]
    end
  end
end
