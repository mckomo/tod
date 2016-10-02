require 'spec_helper'

describe Tod::Runner do

  let(:travis) { Tod::Travis.new }
  let(:executor) { Tod::Executor.new }
  let(:environment) { ENV }
  let(:result) { Tod::Result.new }

  subject(:runner) { Tod::Runner.new(travis, executor: executor, environment: environment) }

  describe '.run' do

    it 'executes commands from the travis script section' do
      travis.expects(:script).returns(['command'])
      executor.expects(:execute).with('command').returns(result_with_code(0));

      runner.run(:script)
    end

    it 'stop running when one command fails' do
      travis.expects(:script).returns(['1st-command', '2ed-command', '3rd-command'])
      executor.expects(:execute).with('1st-command').returns(result_with_code(0));
      executor.expects(:execute).with('2ed-command').returns(result_with_code(255));
      # No '3rd-command' execution

      runner.run(:script)
    end

    it 'returns result code of the last executed command' do
      travis.expects(:script).returns(['1st-command', '2ed-command'])
      executor.expects(:execute).with('1st-command').returns(result_with_code(0));
      executor.expects(:execute).with('2ed-command').returns(result_with_code(127));

      code = runner.run(:script)

      expect(code).to eq(127)
    end

    it 'sets environment variables' do
      travis.expects(:env).returns({ NAME: 'mckomo' })
      environment.expects(:store).with('NAME', 'mckomo')

      runner.run(:script)
    end

  end

end

def result_with_code(code)
  Tod::Result.new(code)
end
