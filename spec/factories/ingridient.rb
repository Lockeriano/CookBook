FactoryBot.define do
  factory :recipe do
    trait  :egg do
      name "egg"
      unit_type "gram"
    end
    trait :butter do
      name "butter"
      unit_type "gram"
    end
    trait :salt do
      name "salt"
      unit_type "pinch"
    end
    trait :pepper do
      name "pepper"
      unit_type "pinch"
    end
    trait :chicken do
      name "chicken"
      unit_type "gram"
    end
    trait :tikka do
      name "tikka"
      unit_type "mililiter"
    end
  end
