require 'spec_helper'

describe Tod::Travis do

  subject { Tod::Travis.new yml } # yml represents .travis.yml

  describe '.env' do

    let(:yml) { Hash('env' => { 'DOCKER_COMPOSE_VERSION' => 1.8 }) }

    it { expect(subject.env).to eq({ 'DOCKER_COMPOSE_VERSION' => 1.8 }) }

  end

  describe '.setup' do

    let(:yml) { Hash('before_install' => ['apt-get update', 'apt-get install git']) }

    it { expect(subject.setup).to eq(['apt-get update', 'apt-get install git']) }

  end

  describe '.before' do

    let(:yml) { Hash('before_script' => ['rails db:migrate', 'rails serve'],  ) }

    it { expect(subject.before).to eq(['rails db:migrate', 'rails serve']) }

  end

  describe '.script' do

    let(:yml) { Hash('script' => 'rspec') }

    it { expect(subject.script).to eq(['rspec']) }

  end

  describe '.section' do

    let(:yml) { Hash('script' => 'test-command') }

    it { expect(subject.section(:script)).to eq(['test-command']) }

  end

end
