require 'spec_helper'

describe Tod::Travis do

  subject { Tod::Travis.new yml } # yml represents .travis.yml

  describe '.env' do

    let(:yml) { Hash('env' => { 'DOCKER_COMPOSE_VERSION' => 1.8 }) }

    it 'returns dictionary of environmental variables' do
      expect(subject.env).to eq({ 'DOCKER_COMPOSE_VERSION' => 1.8 })
    end

  end

  describe '.setup' do

    let(:yml) { Hash('before_install' => ['apt-get update', 'apt-get install git']) }

    it 'returns array of before install scripts' do
      expect(subject.setup).to eq(['apt-get update', 'apt-get install git'])
    end

  end

  describe '.before' do

    let(:yml) { Hash('before_script' => ['rails db:migrate', 'rails serve'],  ) }

    it 'returns array of before test scripts' do
      expect(subject.before).to eq(['rails db:migrate', 'rails serve'])
    end

  end

  describe '.script' do

    let(:yml) { Hash('script' => 'rspec') }

    it 'returns array of test scripts' do
      expect(subject.script).to eq(['rspec'])
    end

  end

  describe '.section' do

    let(:yml) { Hash('before_install' => 'setup-command', 'script' => 'test-command' ) }

    it 'returns given section from the travis file' do
      setup_section = subject.section('setup')
      script_section = subject.section(:script)

      expect(setup_section).to eq(['setup-command'])
      expect(script_section).to eq(['test-command'])
    end

  end

end
