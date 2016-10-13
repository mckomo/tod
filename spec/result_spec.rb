require 'spec_helper'

describe Tod::Result do
  let(:code) { 0 }

  subject { Tod::Result.new(code) }

  describe '.code' do
    it { expect(subject.code).to eq(0) }
  end

  describe '.ok?' do
    it { expect(subject.ok?).to be_truthy }
  end

  describe '.error?' do
    it { expect(subject.error?).to be_falsey }
  end

  context 'when exit code is greater than zero' do
    let(:code) { 255 }

    describe '.ok?' do
      it { expect(subject.ok?).to be_falsey }
    end

    describe '.error?' do
      it { expect(subject.error?).to be_truthy }
    end
  end
end
