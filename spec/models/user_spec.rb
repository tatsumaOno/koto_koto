require 'rails_helper' 
describe User do
	describe '#create' do
		before do
			@user = User.new(
					name: "test10",
					nickname: "test10nick",
					email: "test10@gmail.com",
					password: "1234567",
					password_confirmation: "1234567",
					activated: "1")
		end
		context "名前" do
			it "名前なし" do
				@user.name = ""
				@user.valid?
				expect(@user.errors[:name]).to include("を入力してください")
			end 
			it "名前が50文字以上" do
				@user.name = 'a'*51
				@user.valid?
				expect(@user.errors[:name]).to include("は50文字以内で入力してください")
			end
			it "名前が50文字以下" do
				@user.name = 'a'*50
				expect(@user).to be_valid
			end
		end

		context "メールアドレス" do
			it "アドレスなし" do
				@user.email = ""
				@user.valid?
				expect(@user.errors[:email]).to include("を入力してください")
			end
			it "アドレス100文字以上" do
				@user.email = "a"*100+"@gmail.com"
				@user.valid?
				expect(@user.errors[:email]).to include("は100文字以内で入力してください")
			end
			it "アドレス100文字以下" do
				@user.email = "a"*90+"@gmail.com"
				expect(@user).to be_valid
			end
			it "アドレス被り" do
				user = create(:user)
				another_user = build(:user,password: "9876543",password_confirmation: "9876543")
				another_user.valid?
				expect(another_user.errors[:email]).to include("はすでに存在します")
			end
		end
		context "パスワード" do
			it "パスワードなし" do
				@user.password = " "
				@user.valid?
				expect(@user.errors[:password]).to include("を入力してください")
			end
			it "パスワード6文字以下" do
				@user.password = "1234"
				@user.valid?
				expect(@user.errors[:password]).to include("は6文字以上で入力してください")
			end
			it "パスワード6文字以上" do
				expect(@user).to be_valid
			end
		end
	end
end