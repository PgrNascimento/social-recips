class FoodTypesController < ApplicationController
	def show
		@food_type = FoodType.find params[:id]
	end
	def new
		@food_type = FoodType.new
	end 

	def create
		@food_type = FoodType.new food_type_params
		if @food_type.save
			redirect_to @food_type
		else
			flash[:error] = "Não foi possível criar o tipo de comida"
			render :new
		end
	end	

	private
	def food_type_params
		params.require(:food_type).permit(:name)
	end
end