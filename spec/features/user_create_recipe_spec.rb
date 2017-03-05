require 'rails_helper'

feature 'User creates recipes' do
	scenario 'successfully' do
		cuisine = Cuisine.create(name: "Paulista")		
		food_type = FoodType.create(name: "Sobremesa")
		
		recipe = Recipe.create(cuisine: cuisine, food_type: food_type)
		
		visit new_recipe_path

		fill_in 'Nome', with: recipe.name
		select cuisine.name, from: 'Cozinha'
		select food_type.name, from: 'Tipo de Comida'
		fill_in 'Quantas pessoas serve', with: recipe.serves
		fill_in 'Tempo de preparo', with: recipe.cook_time
		fill_in 'Nível de dificuldade', with: recipe.difficult_level
		fill_in 'Ingredientes', with: recipe.ingredients
		fill_in 'Passo a passo', with: recipe.instructions
		attach_file('Foto', "spec/fixtures/brigadeirao.png")

		click_on 'Criar Receita'

		expect(page).to have_xpath("//img[contains(@src, 'brigadeirao')]")
		expect(page).to have_content "Nome da receita #{recipe.name}"
		expect(page).to have_content "Cozinha #{cuisine.name}"
		expect(page).to have_content "Tipo de Comida #{food_type.name}"
		expect(page).to have_content "Quantas pessoas serve #{recipe.serves}"
		expect(page).to have_content "Tempo de preparo #{recipe.cook_time}"
		expect(page).to have_content "Nível de Dificuldade #{recipe.difficult_level}"
		expect(page).to have_content "Ingredientes #{recipe.ingredients}"
		expect(page).to have_content "Passo a Passo #{recipe.instructions}"
	end

	scenario 'And should fill all fields' do
		visit new_recipe_path

		click_on 'Criar Receita'

		expect(page).to have_content "Não foi possível criar a receita"
	end
end