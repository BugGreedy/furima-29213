require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do      
      it "入力欄に正しく記入できていれば登録できる" do
        expect(@user).to be_valid
      end

      it "苗字の読みが全角カタカナだと登録できる" do
        @user.family_name_reading = "カタカナ"
        expect(@user).to be_valid
      end

      it "名前の読みが全角カタカナだと登録できる" do
        @user.first_name_reading = "カタカナ"
        expect(@user).to be_valid
      end
  
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end 

      it "emailが他のユーザーと同じものは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていないと登録できない" do
        @user.email = "a.a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが5文字以下だと登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは半角英数でないと登録できない" do
        @user.password = "青は藍より出でて藍より青し"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "ユーザー本名には苗字がないと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "ユーザー本名には名前がないと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "ユーザー本名の苗字に読みがないと登録できない" do
        @user.family_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end

      it "ユーザー本名の名前に読みがないと登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it "ユーザー本名の苗字の読みは全角カタカナでないと登録できない" do
        @user.family_name_reading = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading は全角カタカナで記入してください。")
      end

      it "ユーザー本名の名前の読みは全角カタカナでないと登録できない" do
        @user.first_name_reading = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading は全角カタカナで記入してください。")
      end

      it "成年月日がないと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end





    end
  end

end


# 実装の条件
# ## ユーザー情報
# - ニックネームが必須であること
# - メールアドレスが必須であること
# - メールアドレスが一意性であること
# - メールアドレスは@を含む必要があること
# - パスワードが必須であること
# - パスワードは6文字以上であること
# - パスワードは半角英数字混合であること
# - パスワードは確認用を含めて2回入力すること
# - 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）

# ## 本人情報確認
# - ユーザー本名が、名字と名前がそれぞれ必須であること
# - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - 生年月日が必須であること