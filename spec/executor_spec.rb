require 'spec_helper'

describe Tod::Runner do

  subject(:executor) { Tod::Executor.new }

  describe '.execute' do

    it 'returns a Result' do
      expect(executor.execute 'whoami > /dev/null').to be_a(Tod::Result)
    end

    it 'captures command exit code' do
      result = executor.execute 'exit 124'
      expect(result.code).to eq(124)
    end

    it 'captures command standard output' do
      result = executor.execute 'echo -n tod'
      expect(result.output).to eq(['tod'])
    end

  end

end
