# This will guess the User class
FactoryGirl.define do
  factory :recipe do
  	association :cuisine
  	association :food_type
    
    name "Brigadeirão"				
		serves 4
		cook_time "40 minutos"
		difficult_level 'Fácil'
		ingredients '1 lata de leite condensado; 1 lata de creme de leite; 1 xícara de chocolate'
		instructions 'Coloque tudo no liquidificador, bata, coloque numa forma untada e leve a geladeira por 3 horas'
  end	
end