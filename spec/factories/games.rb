FactoryBot.define do
  factory :game, class: Codebreaker::Game do
    player { FactoryBot.build(:player) }
  end
end
