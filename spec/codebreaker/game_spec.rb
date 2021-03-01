require 'spec_helper'

module Codebreaker
  RSpec.describe Game do
    # context '#start' do
    #   let(:game) { Game.new }
    #
    #   before do
    #     game.start
    #   end
    #
    #   it 'saves secret code' do
    #     expect(game.instance_variable_get(:@secret_code)).not_to be_empty
    #   end
    #
    #   it 'saves 4 numbers secret code' do
    #     expect(game.instance_variable_get(:@secret_code).size).to eq 4
    #   end
    #
    #   it 'saves secret code with numbers from 1 to 6' do
    #     expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
    #   end
    # end

    describe '#comparison' do
      context 'player guessed secret code' do
        let(:game) { FactoryBot.build(:game) }

        it do
          game.secret_code = '6543'
          expect{ game.comparison('6543') }.to raise_error(Game::GAME_OVER_WIN)
        end
      end

      context 'player not guessed secret code' do

        before do
        end

        it do
          game.secret_code = '6543'
          expect(game.comparison('2666')).to eq '-'
        end
      end

      # context 'player guessed 4 number and 2 index secret code' do
      #
      #   before do
      #
      #   end
      #
      #   it do
      #     player = double('player')
      #     allow(player).to receive(:name).and_return('Andrii')
      #     allow(player).to receive(:difficulty).and_return('easy')
      #     game = Game.new(player)
      #     game.secret_code = '6666'
      #     expect(game.comparison('1661')).to eq '++'
      #   end
      # end
    end

    describe '#return_hint' do
      context 'player still has hints' do

        before do
        end

        it do
          player = double('player')
          allow(player).to receive(:name).and_return('Andrey')
          allow(player).to receive(:difficulty).and_return('easy')
          game = Game.new(player)
          game.secret_code = '6543'
          expect(game.return_hint).to eq('5')
        end
      end

      context 'player not still has hints' do

        before do
        end

        it do
          player = double('player')
          allow(player).to receive(:name).and_return('Andrey')
          allow(player).to receive(:difficulty).and_return('easy')
          game = Game.new(player)
          game.secret_code = '6543'
          game.hint_used_quantity = 2
          expect(game.return_hint).to eq('0')
        end
      end

    end
  end
end
