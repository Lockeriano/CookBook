FactoryBot.define do
  factory :scrambled_eggs, class: Recipe do
    name "scrambled eggs"
    instructions "Scramble eggs"

    after_build do |recipe|
      recipe.ingridients << FactoryBot.create(:ingridient, :egg)
      recipe.ingridients << FactoryBot.create(:ingridient, :butter)
      recipe.ingridients << FactoryBot.create(:ingridient, :salt)
      recipe.ingridients << FactoryBot.create(:ingridient, :pepper)
    end
  end

  factory :boiled_eggs, class: Recipe do
    name "boiled eggs"
    instructions "boil eggs"

    after_build do |recipe|
      recipe.ingridients << FactoryBot.create(:ingridient, :egg)
      recipe.ingridients << FactoryBot.create(:ingridient, :salt)
    end
  end

  factory :tikka_masala, class: Recipe do
    name "tikka masala"
    instructions "tikka a masal"

    after_build do |recipe|
      recipe.ingridients << FactoryBot.create(:ingridient, :tikka)
      recipe.ingridients << FactoryBot.create(:ingridient, :masala)
    end
  end

  factory :butter_chicken, class: Recipe do
    name "butter chicken"
    instructions "go and make some butter chicken"

    after_build do |recipe|
      recipe.ingridients << FactoryBot.create(:ingridient, :chicken)
      recipe.ingridients << FactoryBot.create(:ingridient, :butter)
      recipe.ingridients << FactoryBot.create(:ingridient, :salt)
    end
  end

  factory :green_curry, class: Recipe do
    name "green curry"
    instructions "go and make some green curry"

    after_build do |recipe|
      recipe.ingridients << FactoryBot.create(:ingridient, :curry_paste)
      recipe.ingridients << FactoryBot.create(:ingridient, :chicken)
      recipe.ingridients << FactoryBot.create(:ingridient, :soy_sauce)
    end
  end
end

FactoryBot.create(:recipe, :scrambled_eggs)
FactoryBot.create(:recipe, :boiled_eggs)
FactoryBot.create(:recipe, :tikka_masala)
FactoryBot.create(:recipe, :butter_chicken)
FactoryBot.create(:recipe, :green_curry)
