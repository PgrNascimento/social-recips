require 'rails_helper'

feature 'user view recipes' do
	scenario 'successfully' do
		food_type = FoodType.create(name: "Sobremesa")
		cuisine = Cuisine.create(name: "Brasileira")
		recipe = Recipe.create(name: "Brigadeirão",
			cuisine: cuisine,
			food_type: food_type,
			serves: 4,
			cook_time: "40 minutos",
			difficult_level: 'Fácil',
			ingredients: '1 lata de leite condensado; 1 lata de creme de leite; 1 xícara de chocolate',
			instructions: 'Coloque tudo no liquidificador, bata, coloque numa forma untada e leve a geladeira por 3 horas')

		visit recipes_path

		expect(page).to have_css("h2", recipe.name)
		expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
		expect(page).to have_content("Serve #{recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")
	end

	scenario 'and view a list of recipes' do
		food_type = FoodType.create(name: "Sobremesa")
		cuisine = Cuisine.create(name: "Brasileira")
		recipe = Recipe.create(name: "Brigadeirão",
			cuisine: cuisine,
			food_type: food_type,
			serves: 4,
			cook_time: "40 minutos",
			difficult_level: 'Fácil',
			ingredients: '1 lata de leite condensado; 1 lata de creme de leite; 1 xícara de chocolate',
			instructions: 'Coloque tudo no liquidificador, bata, coloque numa forma untada e leve a geladeira por 3 horas')

		another_recipe = Recipe.create(name: "Pudim de maria mole",
			cuisine: cuisine,
			food_type: food_type,
			serves: 4,
			cook_time: "40 minutos",
			difficult_level: 'Fácil',
			ingredients: '1 lata de leite condensado; 1 lata de creme de leite; 1 xícara de chocolate',
			instructions: 'Coloque tudo no liquidificador, bata, coloque numa forma untada e leve a geladeira por 3 horas')

		visit recipes_path

		expect(page).to have_css("h2", recipe.name)
		expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
		expect(page).to have_content("Serve #{recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")

		expect(page).to have_css("h2", another_recipe.name)
		expect(page).to have_content("Dificuldade: #{another_recipe.difficult_level}")
		expect(page).to have_content("Serve #{another_recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{another_recipe.cook_time}")
	end
end