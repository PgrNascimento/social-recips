require 'rails_helper'

feature 'User view recipes by Cuisine' do
	scenario 'successfully' do
		
		cuisine = create(:cuisine, name: "Brasileira")
		recipes = create_pair(:recipe, cuisine: cuisine)

		visit recipes_path

		click_link cuisine.name
		
		expect(page).to have_content(cuisine.name)
		recipes.each do |recipe| 
			expect(page).to have_content(recipe.name)			
		end
	end

	scenario 'view a friendly message' do
  	cuisine = create(:cuisine, name: "Brasileira")
    
    visit recipes_path

    click_on cuisine.name

    expect(page).to have_content 'Nenhuma receita disponível'
  end
end