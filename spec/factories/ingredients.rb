FactoryBot.define do
  factory :ingredient do
    trait :egg do
      name 'egg'
      unit_type 'gram'
    end

    trait :butter do
      name 'butter'
      unit_type 'gram'
    end

    trait :salt do
      name 'salt'
      unit_type 'pinch'
    end

    trait :pepper do
      name 'pepper'
      unit_type 'pinch'
    end

    trait :chicken do
      name 'chicken'
      unit_type 'gram'
    end

    trait :tikka do
      name 'tikka'
      unit_type 'mililiter'
    end

    trait :masala do
      name 'masala'
      unit_type 'gram'
    end

    trait :butter do
      name 'butter'
      unit_type 'gram'
    end

    trait :soy_sauce do
      name 'soy sauce'
      unit_type 'mililiter'
    end

    trait :curry_paste do
      name 'curry paste'
      unit_type 'gram'
    end
  end
end
