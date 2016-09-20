module Tod
  class Executor

    def execute(command)
      f = IO.popen(command)

      output = f.readlines
      f.close
      code = $?.exitstatus

      Result.new(code, output)
    end

  end
end
