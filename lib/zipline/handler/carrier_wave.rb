module Zipline
  module Handler
    module CarrierWave
      module_function

      def handles?(attachment)
        attachment.is_a?(::CarrierWave::Storage::Fog::File) ||
          attachment.is_a?(::CarrierWave::SanitizedFile)
      end

      def handle!(attachment)
        # TODO: Handle CarrierWave attachment here
      end
    end
  end
end
