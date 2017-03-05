class User < ApplicationRecord
	validates :name, :city, :mail, :password, presence: true
end
