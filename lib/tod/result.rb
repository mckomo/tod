module Tod
  class Result

    attr_reader :code

    def initialize(code)
      @code = code.to_i
    end

    def ok?
      code.zero?
    end

    def error?
      !ok?
    end

  end
end
