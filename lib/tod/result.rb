module Tod
  class Result

    attr_reader :code, :output

    def initialize(code, output = '')
      @code, @output = code, output
    end

    def ok?
      code.zero?
    end

    def error?
      !ok?
    end

  end
end
