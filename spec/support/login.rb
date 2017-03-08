def login
  user = create(:user, mail: "alan@ddwb.com.br", password: "123321")

  visit root_path

  click_on "Log in"

  fill_in 'E-mail', with: user.mail
  fill_in 'Senha', with: user.password

  click_on 'Entrar'

  user
end
