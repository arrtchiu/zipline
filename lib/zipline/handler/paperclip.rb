module Zipline
  module Handler
    module Paperclip
      module_function

      def handles?(attachment)
        defined?(::Paperclip::Attachment) && attachment.is_a?(::Paperclip::Attachment)
      end

      def handle!(attachment)
        if attachment.options[:storage] == :filesystem
          File.open(attachment.path)
        else
          attachment.copy_to_local_file attachment.default_style, Tempfile.new
        end
      end

    end
  end
end
