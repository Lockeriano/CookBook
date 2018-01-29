FactoryBot.define do
  factory :recipe do
    trait :scrambled_eggs do
      name 'scrambled eggs'
      instructions 'scramble eggs'

      after(:build) do |recipe|
        egg = Ingredient.find_by_name('egg') || FactoryBot.build(:ingredient, :egg)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 180, ingredient: egg)
        butter = Ingredient.find_by_name('butter') || FactoryBot.build(:ingredient, :butter)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 5, ingredient: butter)
        salt = Ingredient.find_by_name('salt') || FactoryBot.build(:ingredient, :salt)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 1, ingredient: salt)
        pepper = Ingredient.find_by_name('pepper') || FactoryBot.build(:ingredient, :pepper)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 5, ingredient: pepper)
      end
    end

    trait :boiled_eggs do
      name 'boiled eggs'
      instructions 'boil eggs'

      after(:build) do |recipe|
        egg = Ingredient.find_by_name('egg') || FactoryBot.build(:ingredient, :egg)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 180, ingredient: egg)
        salt = Ingredient.find_by_name('salt') || FactoryBot.build(:ingredient, :salt)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 1, ingredient: salt)
      end
    end

    trait :tikka_masala do
      name 'tikka masala'
      instructions 'tikka a masal'

      after(:build) do |recipe|
        tikka = Ingredient.find_by_name('tikka') || FactoryBot.build(:ingredient, :tikka)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 100, ingredient: tikka)
        masala = Ingredient.find_by_name('masala') || FactoryBot.build(:ingredient, :masala)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 10, ingredient: masala)
      end
    end

    trait :butter_chicken do
      name 'butter chicken'
      instructions 'go and make some butter chicken'

      after(:build) do |recipe|
        chicken = Ingredient.find_by_name('chicken') || FactoryBot.build(:ingredient, :chicken)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 400, ingredient: chicken)
        butter = Ingredient.find_by_name('butter') || FactoryBot.build(:ingredient, :butter)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 50, ingredient: butter)
        salt = Ingredient.find_by_name('salt') || FactoryBot.build(:ingredient, :salt)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 1, ingredient: salt)
      end
    end

    trait :green_curry do
      name 'green curry'
      instructions 'go and make some green curry'

      after(:build) do |recipe|
        curry_paste = Ingredient.find_by_name('curry paste') || FactoryBot.build(:ingredient, :curry_paste)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 60, ingredient: curry_paste)
        chicken = Ingredient.find_by_name('chicken') || FactoryBot.build(:ingredient, :chicken)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 500, ingredient: chicken)
        soy_sauce = Ingredient.find_by_name('soy sauce') || FactoryBot.build(:ingredient, :soy_sauce)
        recipe.recipe_ingredients << FactoryBot.build(:recipe_ingredient, unit_amount: 50, ingredient: soy_sauce)
      end
    end
  end
end
