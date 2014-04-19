module Zipline
  module Handler
    module BasicIO
      module_function

      def handles?(attachment)
        attachment.is_a?(IO) ||
          attachment.is_a?(StringIO) ||
          attachment.is_a?(Tempfile)
      end

      def handle!(attachment)
        attachment
      end

    end
  end
end
