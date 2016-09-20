require 'spec_helper'

describe Tod::Result do

  let(:output) { 'Hello World' }
  let(:code) { 0 }

  subject { Tod::Result.new(code, output) }

  describe '.code' do
    it 'returns exit code' do
      expect(subject.code).to eq(0)
    end
  end

  describe '.output' do
    it 'returns output' do
      expect(subject.output).to eq('Hello World')
    end
  end

  describe '.ok?' do
    context 'exit code is equal zero' do

      let(:code) { 0 }

      it 'returns true' do
        expect(subject.ok?).to be_truthy
      end

    end

    context 'exit code is greater than zero' do

      let(:code) { 255 }

      it 'returns true' do
        expect(subject.ok?).to be_falsey
      end

    end
  end

  describe '.error?' do
    context 'exit code is equal zero' do

      let(:code) { 0 }

      it 'returns true' do
        expect(subject.error?).to be_falsey
      end

    end

    context 'exit code is greater than zero' do

      let(:code) { 255 }

      it 'returns true' do
        expect(subject.error?).to be_truthy
      end

    end
  end

end
