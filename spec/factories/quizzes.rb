FactoryBot.define do
  factory :quiz do
    name { "Joe" }
    topic { "Joe's quiz" }
    factory :quiz_with_questions do
      transient do
        questions_count { 5 }
      end
      after(:create) do |quiz, evaluator|
        create_list(:question, evaluator.questions_count, quiz: quiz)
      end
    end
  end
end
