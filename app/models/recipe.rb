class Recipe < ApplicationRecord
	belongs_to :cuisine
	belongs_to :food_type
end
