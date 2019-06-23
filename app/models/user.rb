class User < ApplicationRecord
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /([\w+\-.]+)@[a-z\d]+\.[a-z]{2,3}/i
	validates :name, presence: true,length: {maximum: 50}
	validates :email,presence: true,length: {maximum: 255},format: {with: VALID_EMAIL_REGEX},uniqueness: true
	validates :password,presence: true,length: {minimum: 6}

	has_secure_password
	#セキュアなパスワードを作成
	#password_digestカラム
	#gem bcrypt
	
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string,cost: cost)
	end
end
