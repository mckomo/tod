require 'spec_helper'

describe Tod::Executor do
  subject(:executor) { Tod::Executor.new }

  describe '.execute' do
    it 'returns a Result' do
      expect(executor.execute('whoami')).to be_a(Tod::Result)
    end

    it 'captures command exit code' do
      result = executor.execute('exit 124')
      expect(result.code).to eq(124)
    end

    it 'yields lines to passed block' do
      command = 'echo -n tod'
      expect { |b| executor.execute(command, &b) }.to yield_with_args('tod')
    end
  end
end
