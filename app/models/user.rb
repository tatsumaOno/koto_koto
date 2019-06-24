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
	attr_accessor :remember_token # 仮想の属性

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string,cost: cost)
	end

	#トークンを作成
	def self.new_token
		SecureRandom.urlsafe_base64
	end

	#
	def remember
		self.remember_token = User.new_token #新しいトークンを作る
		update_attribute(:remember_digest,User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest,nil)
	end
end
