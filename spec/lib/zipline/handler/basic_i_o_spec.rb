require 'spec_helper'

describe Zipline::Handler::BasicIO do
  def expect_handle_to_return_attachment
    result = described_class.handle!(attachment)
    expect(result).to be attachment
  end

  context 'StringIO' do
    let!(:attachment) { StringIO.new('blah') }
    it_behaves_like 'a zipline handler'
    specify { expect_handle_to_return_attachment }
  end

  context 'File' do
    let!(:attachment) { File.new('/dev/null', 'r') }
    it_behaves_like 'a zipline handler'
    specify { expect_handle_to_return_attachment }
  end

  context 'Tempfile' do
    let!(:attachment) { Tempfile.new('abc') }
    it_behaves_like 'a zipline handler'
    specify { expect_handle_to_return_attachment }
  end
end
