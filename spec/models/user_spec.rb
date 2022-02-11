require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nameを入力してください")
    end

    it 'nameが7文字以上では登録できない' do
      @user.name = 'asdfghj'
      @user.valid?
      expect(@user.errors.full_messages).to include("Nameは6文字以内で入力してください")
    end
    
    it '重複したnameが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.name = @user.name
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Nameはすでに存在します")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailを入力してください")
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailは不正な値です")
    end

    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordを入力してください")
    end
    
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
    end

    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは128文字以内で入力してください")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      
    end
  end
end
