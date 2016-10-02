require 'spec_helper'

describe Tod::Travis do

  subject { Tod::Travis.new yml }

  describe '.env' do

    let(:yml) { Hash('env' => { 'DOCKER_COMPOSE_VERSION' => 1.8 }) }

    it 'returns dictionary of environmental variables' do
      expect(subject.env).to eq({ 'DOCKER_COMPOSE_VERSION' => 1.8 })
    end

  end

  describe '.script' do

    let(:yml) { Hash('script' => 'rspec') }

    it 'returns array of test scripts' do
      expect(subject.script).to eq(['rspec'])
    end

  end

  describe '.before' do

    let(:yml) { Hash('before_script' => ['rails db:migrate', 'rails serve'],  ) }

    it 'returns array of before test scripts' do
      expect(subject.before).to eq(['rails db:migrate', 'rails serve'])
    end

  end

  describe '.install' do

    let(:yml) { Hash('install' => ['apt-get update', 'apt-get install git']) }

    it 'returns array of setup scripts' do
      expect(subject.install).to eq(['apt-get update', 'apt-get install git'])
    end

  end

end
