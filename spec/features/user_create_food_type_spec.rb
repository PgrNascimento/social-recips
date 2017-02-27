require 'rails_helper'

feature 'User creates food type' do
	scenario 'successfully' do
		food_type = FoodType.new(name: "sobremesa")

		visit new_food_type_path

		fill_in 'Nome', with: food_type.name

		click_on 'Criar Tipo de Comida'

		expect(page).to have_content "Tipo de Comida #{food_type.name}"
	end

	scenario 'And should fill all fields' do
		visit new_food_type_path

		click_on 'Criar Tipo de Comida'

		expect(page).to have_content "Não foi possível criar o tipo de comida"
	end
end