module Codebreaker
  module Validation
    def player_name_valid!(player_name)
      raise Codebreaker::Errors::PlayerNameError if player_name.size < 3 || player_name.size > 20
    end

    def player_guess_valid?(guess)
      raise Codebreaker::Errors::PlayerGuessError if guess !~ /^[1-6]{4}$/
    end
  end
end
