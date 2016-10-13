require 'spec_helper'

describe Tod::Travis do
  subject { Tod::Travis.new yaml } # yaml represents .travis.yml

  describe '.env' do
    let(:yaml) { Hash('env' => { 'DOCKER_COMPOSE_VERSION' => 1.8 }) }

    it { expect(subject.env).to eq('DOCKER_COMPOSE_VERSION' => 1.8) }
  end

  describe '.setup' do
    let(:yaml) { Hash('before_install' => ['apt update', 'apt install git']) }

    it { expect(subject.setup).to eq(['apt update', 'apt install git']) }
  end

  describe '.before' do
    let(:yaml) { Hash('before_script' => ['rails db:migrate', 'rails serve']) }

    it { expect(subject.before).to eq(['rails db:migrate', 'rails serve']) }
  end

  describe '.script' do
    let(:yaml) { Hash('script' => 'rspec') }

    it { expect(subject.script).to eq(['rspec']) }
  end

  describe '.section' do
    let(:yaml) { Hash('script' => 'test-command') }

    it { expect(subject.section(:script)).to eq(['test-command']) }
  end
end
