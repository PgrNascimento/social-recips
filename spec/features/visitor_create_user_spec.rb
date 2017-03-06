require 'rails_helper'

feature 'User creates user' do
	scenario 'successfully' do
		user = build(:user)

		visit new_user_path

		fill_in 'Nome', with: user.name
		fill_in 'Cidade', with: user.city
		fill_in 'E-mail', with: user.mail		
		fill_in 'Facebook', with: user.facebook
		fill_in 'Twitter', with: user.twitter
		fill_in 'Senha', with: user.password
		fill_in 'Confirme sua senha', with: user.password


		click_on 'Criar Cadastro'

		expect(page).to have_content "Nome #{user.name}"
		expect(page).to have_content "Cidade #{user.city}"
		expect(page).to have_content "E-mail #{user.mail}"
		expect(page).to have_content "Twitter #{user.facebook}"
		expect(page).to have_content "Facebook #{user.twitter}"
	end

	scenario 'And fill incorrect password' do
		user = create(:user)

		visit new_user_path

		fill_in 'Nome', with: user.name
		fill_in 'Cidade', with: user.city
		fill_in 'E-mail', with: user.mail		
		fill_in 'Facebook', with: user.facebook
		fill_in 'Twitter', with: user.twitter
		fill_in 'Senha', with: user.password
		fill_in 'Confirme sua senha', with: "meunomeejulia"

		click_on 'Criar Cadastro'

		expect(page).to have_content "As senhas não coincidem"
	end		
	
	scenario 'And should fill all fields' do
		visit new_user_path

		click_on 'Criar Cadastro'

		expect(page).to have_content "Não foi possível efetuar cadastro"
	end
end