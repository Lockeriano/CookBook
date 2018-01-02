FactoryBot.define do
  factory :recipe do
    trait :scrambled_eggs do
      name 'scrambled eggs'
      instructions 'scramble eggs'

      after(:build) do |recipe|
        egg = Ingridient.find_by_name('egg') || FactoryBot.build(:ingridient, :egg)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 180, ingridient: egg)
        butter = Ingridient.find_by_name('butter') || FactoryBot.build(:ingridient, :butter)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 5, ingridient: butter)
        salt = Ingridient.find_by_name('salt') || FactoryBot.build(:ingridient, :salt)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 1, ingridient: salt)
        pepper = Ingridient.find_by_name('pepper') || FactoryBot.build(:ingridient, :pepper)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 5, ingridient: pepper)
      end
    end

    trait :boiled_eggs do
      name 'boiled eggs'
      instructions 'boil eggs'

      after(:build) do |recipe|
        egg = Ingridient.find_by_name('egg') || FactoryBot.build(:ingridient, :egg)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 180, ingridient: egg)
        salt = Ingridient.find_by_name('salt') || FactoryBot.build(:ingridient, :salt)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 1, ingridient: salt)
      end
    end

    trait :tikka_masala do
      name 'tikka masala'
      instructions 'tikka a masal'

      after(:build) do |recipe|
        tikka = Ingridient.find_by_name('tikka') || FactoryBot.build(:ingridient, :tikka)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 100, ingridient: tikka)
        masala = Ingridient.find_by_name('masala') || FactoryBot.build(:ingridient, :masala)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 10, ingridient: masala)
      end
    end

    trait :butter_chicken do
      name 'butter chicken'
      instructions 'go and make some butter chicken'

      after(:build) do |recipe|
        chicken = Ingridient.find_by_name('chicken') || FactoryBot.build(:ingridient, :chicken)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 400, ingridient: chicken)
        butter = Ingridient.find_by_name('butter') || FactoryBot.build(:ingridient, :butter)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 50, ingridient: butter)
        salt = Ingridient.find_by_name('salt') || FactoryBot.build(:ingridient, :salt)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 1, ingridient: salt)
      end
    end

    trait :green_curry do
      name 'green curry'
      instructions 'go and make some green curry'

      after(:build) do |recipe|
        curry_paste = Ingridient.find_by_name('curry paste') || FactoryBot.build(:ingridient, :curry_paste)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 60, ingridient: curry_paste)
        chicken = Ingridient.find_by_name('chicken') || FactoryBot.build(:ingridient, :chicken)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 500, ingridient: chicken)
        soy_sauce = Ingridient.find_by_name('soy sauce') || FactoryBot.build(:ingridient, :soy_sauce)
        recipe.recipe_ingridients << FactoryBot.build(:recipe_ingridient, unit_amount: 50, ingridient: soy_sauce)
      end
    end
  end
end
