require 'spec_helper'

describe Zipline::Handler do
  describe '::handler_for' do
    subject { described_class.handler_for(obj) }

    # TODO: replace this with more generic testing, this is basically test duplication

    context 'paperclip attachment' do
      let(:obj) { Paperclip::Attachment.new(:name, :instance) }
      it { should be Zipline::Handler::Paperclip }
    end

    context 'StringIO' do
      let(:obj) { StringIO.new('blah') }
      it { should be Zipline::Handler::BasicIO }
    end

    context 'carrierwave' do
      let(:obj) { CarrierWave::SanitizedFile.new(Tempfile.new('t')) }
      it { should be Zipline::Handler::CarrierWave }
    end
  end

  describe '::handle!' do
    let!(:attachment) { StringIO.new('attachment') }

    before { expect(described_class).to receive(:handler_for).with(attachment).and_return(handler) }

    subject { described_class.handle!(attachment) }

    context 'matching handler' do
      let(:handler) { double(:handler) }

      it 'calls handle! on the matching handler' do
        mock_result = double(:result)
        expect(handler).to receive(:handle!).with(attachment).and_return(mock_result)
        expect(subject).to be mock_result
      end
    end

    context 'no matching handler' do
      let(:handler) { nil }

      it 'raises an error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
