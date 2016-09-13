require 'spec_helper'

describe Tod do

  it 'has a version number' do
    expect(Tod::VERSION).not_to be nil
  end

  it 'can be initilize with a file path' do
    tod = Tod.build(path: 'spec/support/.travis.yml')
    expect(tod).to be_a(Tod::Runner)
  end

end
