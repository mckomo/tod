module Tod
  class Result
    attr_reader :code

    OK = 0

    def initialize(code)
      @code = code.to_i
    end

    def ok?
      code.eql?(OK)
    end

    def error?
      !ok?
    end
  end
end
