require 'rails_helper'
describe User do
  describe '#create' do
    #  必須項目が存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation................." do
      user = build(:user)
      expect(user).to be_valid
    end

    #  nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    #  emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    #  passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    #  last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    #  first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    #  last_furiganaが空では登録できないこと
    it "is invalid without a last_furigana" do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("を入力してください")
    end
    #  first_furiganaが空では登録できないこと
    it "is invalid without a first_furigana" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("を入力してください")
    end
    #  birth_yearが空では登録できないこと
    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end
    #  birth_monthが空では登録できないこと
    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end
    #  birth_dayが空では登録できないこと
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end









    #  passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end




    #  passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    #  passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    #  重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    #  重複したphone_numberが存在する場合登録できないこと
    it "is invalid with a duplicate phone_number " do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("はすでに存在します")
    end

 
    
  end
  describe Address do
    describe '#create' do
      #  必須項目が存在すれば登録できること
      it "is valid with a prefectures,city, address, postal_code........." do
        address = build(:user)
        expect(address).to be_valid
    end

     #  last_name_adが空では登録できないこと
     it "is invalid without a last_name_ad" do
      user = build(:address, last_name_ad: nil)
      user.valid?
      expect(user.errors[:last_name_ad]).to include("を入力してください")
    end
     #  first_name_adが空では登録できないこと
     it "is invalid without a first_name_ad" do
      user = build(:address, first_name_ad: nil)
      user.valid?
      expect(user.errors[:first_name_ad]).to include("を入力してください")
    end
     #  last_furigana_adが空では登録できないこと
     it "is invalid without a last_furigana_ad" do
      user = build(:address, last_furigana_ad: nil)
      user.valid?
      expect(user.errors[:last_furigana_ad]).to include("を入力してください")
    end
     #  first_furigana_adが空では登録できないこと
     it "is invalid without a first_furigana_ad" do
      user = build(:address, first_furigana_ad: nil)
      user.valid?
      expect(user.errors[:first_furigana_ad]).to include("を入力してください")
    end
     #  postal_codeが空では登録できないこと
     it "is invalid without a postal_code" do
      user = build(:address, postal_code: nil)
      user.valid?
      expect(user.errors[:postal_code]).to include("を入力してください")
    end
     #  prefecturesが空では登録できないこと
     it "is invalid without a prefectures" do
      user = build(:address, prefectures: nil)
      user.valid?
      expect(user.errors[:prefectures]).to include("を入力してください")
    end
     #  city_nameが空では登録できないこと
     it "is invalid without a city_name" do
      user = build(:address, city_name: nil)
      user.valid?
      expect(user.errors[:city_name]).to include("を入力してください")
    end
     #  street_numberが空では登録できないこと
     it "is invalid without a street_number" do
      user = build(:address, street_number: nil)
      user.valid?
      expect(user.errors[:street_number]).to include("を入力してください")
    end




    end
  end
  
end