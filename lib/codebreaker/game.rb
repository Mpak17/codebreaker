require 'pry'
require_relative 'modules/errors'
require_relative 'modules/validation'

module Codebreaker
  class Game
    CODE_SIZE = 4
    CODE_DIGITS = (1..6)
    DIFFICULTIES = {
      easy: { attempts: 15, hints: 2 },
      medium: { attempts: 10, hints: 1 },
      hell: { attempts: 5, hints: 1 }
    }

    include Errors
    include Validation

    attr_reader :attempts

    def start(player_name, difficulty)
      player_name_valid!(player_name)
      @secret_code = (Array.new(CODE_SIZE) { rand(CODE_DIGITS) }).join
      @player_name = player_name
      @difficulty = DIFFICULTIES[difficulty]
      @attempts = @difficulty[:attempts]
      @hints = @secret_code.chars.sample(@difficulty[:hints])
    end

    def check_guess(guess)
      player_guess_valid?(guess)
      update_attempts
      compare_to_secret_code(guess)
    end

    def hint_return
      @hints.pop
    end

    def compare_to_secret_code(guess)
      answer = []
      array_code = []
      array_secret_code = []

      (0..3).each do |i|
        if guess[i] == @secret_code[i]
          answer.unshift('+')
        else guess.include?(@secret_code[i])
        array_code << guess[i]
        array_secret_code << @secret_code[i]
        end
      end

      array_code.each do |digit|
        if array_secret_code.include? digit
          answer.push('-')
          array_code[array_code.index(digit)] = nil
          array_secret_code[array_secret_code.index(digit)] = nil
        end
      end

      answer.join
    end

    def to_h
      {
        name: @player,
        difficulty: @difficulty,
        attempts: @difficulty[:attempts],
        attempts_used: @difficulty[:attempts] - @attempts,
        hints: @difficulty[:hints],
        hints_used: @difficulty[:hints] - @hints.size
      }
    end

    private

    def update_attempts
      @attempts -= 1
    end

  end
end
