class User < ApplicationRecord
	VALID_EMAIL_REGEX = /([\w+\-.]+)@[a-z\d]+\.[a-z]{2,3}/i
	validates :name,                 presence: true,length: {maximum: 50}
	validates :nickname,             presence: true,length: {maximum: 30}
	validates :email,                presence: true,length: {maximum: 100},format: {with: VALID_EMAIL_REGEX},uniqueness: true
	validates :password,             presence: true,length: {minimum: 6},allow_nil: true
	validates :password_confirmation,presence: true,allow_nil: true
	validates :introduction,         length: {maximum: 200}
	
	has_secure_password #セキュアなパスワードを作成 password_digestカラム gem bcrypt
	has_one_attached :image #activeStorage
	has_many :services, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :cards,    dependent: :destroy
	has_many :room_users
	has_many :rooms,    through: :room_users
	has_many :messages, dependent: :destroy
	
	attr_accessor :remember_token,:activation_token,:reset_token,:support_point,:satisfaction_point

	before_save :downcase_email
	before_create :create_activation_digest

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string,cost: cost)
	end

	#トークンを作成
	def self.new_token
		SecureRandom.urlsafe_base64
	end

	#remember_token&remember_digestを作成
	def remember
		self.remember_token = User.new_token #新しいトークンを作る
		update_attribute(:remember_digest,User.digest(remember_token))
	end

	def authenticated?(attribute,token)
		digest = self.send("#{attribute}_digest") #send(:remember_digest)
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token) #digestとtokenを比較して同じかどうか
	end

	def forget
		update_attribute(:remember_digest,nil)
	end

	#パスワードの再設定の属性を設定する
	def create_reset_digest
		self.reset_token = User.new_token
		update_attribute(:reset_digest, User.digest(reset_token))
		update_attribute(:reset_sent_at,Time.zone.now)
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def password_reset_expired?
		reset_sent_at < 2.hours.ago
	end

	def place_value(support,satisfaction)
		self.support_point = support.to_i
		self.satisfaction_point = satisfaction.to_i
	end

	def create_confidence_score
		self.score += (self.support_point + self.satisfaction_point) * 2
	end

	def create_point
		if 500 < score
			self.point += self.score * 5
		elsif 200 < self.score
			self.point += self.score * 4
		elsif 100 < self.score
			self.point += self.score * 3
		elsif 50 < self.score
			self.point += self.score * 2
		else
			self.point += self.score
		end
		self.save
	end

private
	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end

	def downcase_email
		self.email = email.downcase
	end
end
