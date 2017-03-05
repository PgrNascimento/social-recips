class Recipe < ApplicationRecord
	mount_uploader :picture, PictureUploader
	belongs_to :cuisine
	belongs_to :food_type	
end
