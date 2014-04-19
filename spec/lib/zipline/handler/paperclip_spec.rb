require 'spec_helper'

describe Zipline::Handler::Paperclip do
  let!(:attachment) { Paperclip::Attachment.new(:name, :instance) }
  it_behaves_like 'a zipline handler'

  describe '::handle!' do
    subject { described_class.handle!(attachment) }

    context 'when using local storage' do
      let(:mock_path) { '/path/to/attachment.ext' }
      let(:mock_file) { StringIO.new('') }

      before do
        allow(attachment).to receive(:path).and_return(mock_path)
        expect(File).to receive(:open).with(mock_path).and_return(mock_file)
      end

      it { should be mock_file }
    end

    context 'when using s3 or cloud storage' do
      let(:mock_tempfile) { Tempfile.new('test') }

      before do
        attachment.options[:storage] = :s3
        allow(Tempfile).to receive(:new).and_return(mock_tempfile)
        expect(attachment).to receive(:copy_to_local_file).with(:original, mock_tempfile).and_return(mock_tempfile)
      end

      it { should be mock_tempfile }
    end
  end
end
