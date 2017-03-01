require 'rails_helper'

feature 'user view recipes' do
	scenario 'successfully' do
		
		recipe = create(:recipe)

		visit recipes_path

		expect(page).to have_css("h2", text: recipe.name)
		expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
		expect(page).to have_content("Serve #{recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")
	end

	scenario 'and view a list of recipes' do
		another_recipe = create(:recipe, name: "Bolo de Cenoura", difficult_level: "Médio", serves: 10, cook_time: 60)
		recipe = create(:recipe)
		
		visit recipes_path

		expect(page).to have_css("h2", text: recipe.name)
		expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
		expect(page).to have_content("Serve #{recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")

		expect(page).to have_css("h2", text: another_recipe.name)
		expect(page).to have_content("Dificuldade: #{another_recipe.difficult_level}")
		expect(page).to have_content("Serve #{another_recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{another_recipe.cook_time}")
	end

	scenario 'and view last 20 recipes' do		
		first_recipe = create(:recipe, name: "Bolo de Cenoura", difficult_level: "Médio", serves: 10, cook_time: 60)

		recipes = create_list(:recipe, 21)

		visit recipes_path

		recipes.each do |recipe|
			expect(page).to have_css("h2", text: recipe.name)
			expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
			expect(page).to have_content("Serve #{recipe.serves} pessoas")
			expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")
		end		

		expect(page).not_to have_content(first_recipe.name)
		expect(page).not_to have_content("Dificuldade: #{first_recipe.difficult_level}")
		expect(page).not_to have_content("Serve #{first_recipe.serves} pessoas")
		expect(page).not_to have_content("Tempo de preparo: #{first_recipe.cook_time}")
	end
end