require 'rails_helper'

feature 'Visitor search recipes' do
	scenario 'sucessfully' do
		recipe = create(:recipe, name: "Bife a rolê")
		another_recipe = create(:recipe, name: "Bolo de Cenoura")

		visit recipes_path

		fill_in :recipe_search, with: "Bife"

		click_on "Buscar"

		expect(page).not_to have_content(another_recipe.name)
		expect(page).to have_css("h2", text: recipe.name)
		expect(page).to have_content("Dificuldade: #{recipe.difficult_level}")
		expect(page).to have_content("Serve #{recipe.serves} pessoas")
		expect(page).to have_content("Tempo de preparo: #{recipe.cook_time}")
		expect(page).to have_xpath("//img[contains(@src, 'brigadeirao')]")
	end

	scenario 'view a friendly message' do
		visit new_recipe_path

		fill_in "Buscar por receitas", with: "Bife"

		click_on "Buscar"

		expect(page).to have_content("Nenhuma receita encontrada")
	end
end
