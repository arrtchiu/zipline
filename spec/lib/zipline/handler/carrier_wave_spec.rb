require 'spec_helper'

describe Zipline::Handler::CarrierWave do
  context 'fog' do
    let(:attachment) { CarrierWave::Storage::Fog::File.new(nil, nil, nil) }
    it_behaves_like 'a zipline handler'
  end

  context 'local' do
    let(:attachment) { CarrierWave::SanitizedFile.new(Tempfile.new('t')) }
    it_behaves_like 'a zipline handler'
  end
end
