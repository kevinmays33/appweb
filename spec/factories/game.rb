FactoryBot.define do
  factory :game do
    name { "Joe" }
    round_time { 10 }
    quiz { create(:quiz) }
  end
end
