class RecipesController < ApplicationController
	def index
		@recipes = Recipe.order(created_at: :desc).limit(20)
		@cuisines = Cuisine.all
		@food_types = FoodType.all
	end
	def show
		@recipe = Recipe.find params[:id]
	end
	
	def new
		@recipe = Recipe.new
	end

	def search
		@food_types = FoodType.all
		@cuisines = Cuisine.all
		@recipes = Recipe.where("name like ?", "%#{params[:recipe_search]}%")
		render :index
	end

	def create		
		@recipe = Recipe.new recipe_params
		if @recipe.save
			redirect_to @recipe
		else
			flash[:error] = "Não foi possível criar a receita"
			render :new
		end
	end

	private 
	def recipe_params
		params.require(:recipe).permit(:name, :cuisine_id, :food_type_id, 
			:serves, :cook_time, :difficult_level, :ingredients, :instructions, :picture)
	end
end