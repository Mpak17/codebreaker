module Codebreaker
  module Errors
    NAME_ERROR = 'You entered an invalid name.'
    NUMBER_ERROR = 'You entered an invalid number.'

    class PlayerNameError < StandardError
      def initialize(msg = nil)
        super(NAME_ERROR)
      end
    end

    class PlayerGuessError < StandardError
      def initialize(msg = nil)
        super(NUMBER_ERROR)
      end
    end
  end
end

