require 'rails_helper'

feature 'User edit recipes' do
	scenario 'successfully' do
		cuisine = Cuisine.create(name: "Paulista")
		food_type = FoodType.create(name: "Sobremesa")

		recipe = Recipe.create(cuisine: cuisine, food_type: food_type)

		visit edit_recipe_path(recipe)

		fill_in 'Nome', with: "Tapioca"
		fill_in 'Quantas pessoas serve', with: 1
		fill_in 'Tempo de preparo', with: "10 minutos"
		fill_in 'Nível de dificuldade', with: "Fácil"
		fill_in 'Ingredientes', with: "Farinha de tapioca"
		fill_in 'Passo a passo', with: "Coloque na frigideira e espere pegar goma"
		attach_file('Foto', "spec/support/fixtures/tapioca.jpeg")

		click_on 'Atualizar Receita'

		expect(page).to have_xpath("//img[contains(@src, 'tapioca.jpeg')]")
		expect(page).to have_content "Nome da receita Tapioca"
		expect(page).to have_content "Cozinha #{cuisine.name}"
		expect(page).to have_content "Tipo de Comida #{food_type.name}"
		expect(page).to have_content "Quantas pessoas serve 1"
		expect(page).to have_content "Tempo de preparo 10 minutos"
		expect(page).to have_content "Nível de Dificuldade Fácil"
		expect(page).to have_content "Ingredientes #{recipe.ingredients}"
		expect(page).to have_content "Passo a Passo #{recipe.instructions}"
	end

  scenario 'and change cuisine and food type' do
		cuisine = Cuisine.create(name: "Paulista")
    cuisine2 = Cuisine.create(name: "Brasileira")
		food_type = FoodType.create(name: "Sobremesa")
    food_type2 = FoodType.create(name: "Entrada")

		recipe = Recipe.create(cuisine: cuisine, food_type: food_type)

		visit edit_recipe_path(recipe)

		select cuisine2.name, from: 'Cozinha'
    select food_type2.name, from: 'Tipo de Comida'

		click_on 'Atualizar Receita'

		expect(page).to have_content "Cozinha #{cuisine2.name}"
		expect(page).to have_content "Tipo de Comida #{food_type2.name}"
	end

  scenario 'and back to recipe path' do
    cuisine = Cuisine.create(name: "Paulista")
		food_type = FoodType.create(name: "Sobremesa")

		recipe = Recipe.create(cuisine: cuisine, food_type: food_type)

		visit edit_recipe_path(recipe)

    click_on "Voltar"
  end

  # scenario 'And should fill need fields' do
  #  cuisine = Cuisine.create(name: "Paulista")
	#	food_type = FoodType.create(name: "Sobremesa")
	#	recipe = Recipe.create(cuisine: cuisine, food_type: food_type)

	#	visit edit_recipe_path(recipe)

  #  fill_in 'Nome', with: ""
  #  fill_in 'Ingredientes', with: ""
	#	fill_in 'Passo a passo', with: ""

  #  click_on "Atualizar Receita"

	#	expect(page).to have_content "Não foi possível criar a receita"
	#end
end
