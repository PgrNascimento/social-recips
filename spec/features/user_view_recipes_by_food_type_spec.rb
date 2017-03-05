require 'rails_helper'

feature 'User view recipes by Food Type' do
	scenario 'successfully' do
		
		food_type = create(:food_type, name: "Sobremesa")
		recipes = create_pair(:recipe, food_type: food_type)

		visit recipes_path

		click_link food_type.name
		
		expect(page).to have_content(food_type.name)
		recipes.each do |recipe| 
			expect(page).to have_content(recipe.name)			
		end
	end

	scenario 'view a friendly message' do
  	food_type = create(:food_type, name: "Sobremesa")
    
    visit recipes_path

    click_on food_type.name

    expect(page).to have_content 'Nenhuma receita disponível'
  end
end