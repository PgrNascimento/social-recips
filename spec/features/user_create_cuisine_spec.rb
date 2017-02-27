require 'rails_helper'

feature 'User creates cuisine' do
	scenario 'successfully' do
		cuisine = Cuisine.new(name: "Italiana")

		visit new_cuisine_path

		fill_in 'Nome', with: cuisine.name

		click_on 'Criar Cozinha'

		expect(page).to have_content "Cozinha #{cuisine.name}"
	end
end