require 'rails_helper'

feature 'Visitor login' do
	scenario 'successfully' do
		user = create(:user, mail: "alan@ddwb.com.br", password: "123321")

		visit root_path

		click_on "Log in"

		fill_in 'E-mail', with: user.mail		
		fill_in 'Senha', with: user.password

		click_on 'Entrar'

		expect(page).to have_content "Nome #{user.name}"
		expect(page).to have_content "Cidade #{user.city}"
		expect(page).to have_content "E-mail #{user.mail}"
		expect(page).to have_content "Twitter #{user.facebook}"
		expect(page).to have_content "Facebook #{user.twitter}"
	end

	scenario 'and logout in sequence' do
		user = create(:user, mail: "alan@ddwb.com.br", password: "123321")

		visit root_path

		click_on "Log in"

		fill_in 'E-mail', with: user.mail		
		fill_in 'Senha', with: user.password

		click_on 'Entrar'

		click_on "Log out"

		expect(page).to have_content "Log in"

	end

	scenario 'And fill incorrect password or email' do
		user = create(:user, mail: "alan@ddwb.com.br", password: "123321")

		visit login_path

		fill_in 'E-mail', with: user.mail		
		fill_in 'Senha', with: '321123'
		
		click_on 'Entrar'

		expect(page).to have_content "E-mail/senha inválido(s)"
	end		
end