class User < ApplicationRecord
	before_save { self.mail = mail.downcase }
	validates :name, :city, :mail, :password, presence: true
end
