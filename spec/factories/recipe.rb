FactoryBot.define do
  factory :recipe do
    trait :scrambled_eggs do
      name 'scrambled eggs'
      instructions 'Scramble eggs'

      after(:build) do |recipe|
        recipe.ingridients << FactoryBot.build(:ingridient, :egg, unit_amount: 180)
        recipe.ingridients << FactoryBot.build(:ingridient, :butter, unit_amount: 5)
        recipe.ingridients << FactoryBot.build(:ingridient, :salt, unit_amount: 1)
        recipe.ingridients << FactoryBot.build(:ingridient, :pepper, unit_amount: 1)
      end
    end

    trait :boiled_eggs do
      name 'boiled eggs'
      instructions 'boil eggs'

      after(:build) do |recipe|
        recipe.ingridients << FactoryBot.build(:ingridient, :egg, unit_amount: 180)
        recipe.ingridients << FactoryBot.build(:ingridient, :salt, unit_amount: 1)
      end
    end

    trait :tikka_masala do
      name 'tikka masala'
      instructions 'tikka a masal'

      after(:build) do |recipe|
        recipe.ingridients << FactoryBot.build(:ingridient, :tikka, unit_amount: 100)
        recipe.ingridients << FactoryBot.build(:ingridient, :masala, unit_amount: 10)
      end
    end

    trait :butter_chicken do
      name 'butter chicken'
      instructions 'go and make some butter chicken'

      after(:build) do |recipe|
        recipe.ingridients << FactoryBot.build(:ingridient, :chicken, unit_amount: 250)
        recipe.ingridients << FactoryBot.build(:ingridient, :butter, unit_amount: 30)
        recipe.ingridients << FactoryBot.build(:ingridient, :salt, unit_amount: 1)
      end
    end

    trait :green_curry do
      name 'green curry'
      instructions 'go and make some green curry'

      after(:build) do |recipe|
        recipe.ingridients << FactoryBot.build(:ingridient, :curry_paste, unit_amount: 20)
        recipe.ingridients << FactoryBot.build(:ingridient, :chicken, unit_amount: 300)
        recipe.ingridients << FactoryBot.build(:ingridient, :soy_sauce, unit_amount: 25)
      end
    end
  end
end
