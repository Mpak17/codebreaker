FactoryBot.define do
  factory :player, class: Codebreaker::Player do
    name { 'Andrey' }
    difficulty { 'easy' }
  end
end
