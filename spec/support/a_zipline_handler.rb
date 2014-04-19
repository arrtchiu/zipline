shared_examples_for 'a zipline handler' do
  describe '::handles?' do
    subject { described_class.handles?(attachment) }

    context 'with matching class' do
      it { should be true }
    end

    context 'with mismatching class' do
      let(:attachment) { Thread.new {} }
      it { should be false }
    end
  end
end

def expect_ziplinable(file)
  expect(file).to respond_to :each
  expect(file).to respond_to :read
  expect(file).to respond_to :size
end
