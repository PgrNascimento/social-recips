class Recipe < ApplicationRecord
	belongs_to :cuisine
	belongs_to :food_type
	mount_uploader :picture, PictureUploader
end
