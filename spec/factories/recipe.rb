FactoryBot.define do
  factory :recipe do

    trait :scrambled_eggs do
      name 'scrambled eggs'
      instructions 'Scramble eggs'

      after_build do |recipe|
        recipe.ingridients << FactoryBot.create(:ingridient, :egg)
        recipe.ingridients << FactoryBot.create(:ingridient, :butter)
        recipe.ingridients << FactoryBot.create(:ingridient, :salt)
        recipe.ingridients << FactoryBot.create(:ingridient, :pepper)
      end
    end

    trait :boiled_eggs do
      name 'boiled eggs'
      instructions 'boil eggs'

      after_build do |recipe|
        recipe.ingridients << FactoryBot.create(:ingridient, :egg)
        recipe.ingridients << FactoryBot.create(:ingridient, :salt)
      end
    end

    trait :tikka_masala do
      name 'tikka masala'
      instructions 'tikka a masal'

      after_build do |recipe|
        recipe.ingridients << FactoryBot.create(:ingridient, :tikka)
        recipe.ingridients << FactoryBot.create(:ingridient, :masala)
      end
    end

    trait :butter_chicken do
      name 'butter chicken'
      instructions 'go and make some butter chicken'

      after_build do |recipe|
        recipe.ingridients << FactoryBot.create(:ingridient, :chicken)
        recipe.ingridients << FactoryBot.create(:ingridient, :butter)
        recipe.ingridients << FactoryBot.create(:ingridient, :salt)
      end
    end

    trait :green_curry do
      name 'green curry'
      instructions 'go and make some green curry'

      after_build do |recipe|
        recipe.ingridients << FactoryBot.create(:ingridient, :curry_paste)
        recipe.ingridients << FactoryBot.create(:ingridient, :chicken)
        recipe.ingridients << FactoryBot.create(:ingridient, :soy_sauce)
      end
    end
  end
end
