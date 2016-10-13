require 'spec_helper'

describe Tod do
  it 'has a version number' do
    expect(Tod::VERSION).not_to be nil
  end

  describe '.build' do
    it 'returns Runner' do
      expect(Tod.build).to be_a(Tod::Runner)
    end

    it 'accepts custom path to yml file ' do
      Tod.build(from_yml: '.travis.yml')
    end
  end
end
