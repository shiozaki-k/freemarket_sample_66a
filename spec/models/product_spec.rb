require 'rails_helper'

RSpec.describe Product, type: :model do
# describe Product do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "nameが41文字以上であれば登録できないこと" do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end
    it "nameが40文字以下では登録できること" do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      # expect(product).to be_valid
    end

    it "priceがない場合は登録できないこと" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      product = build(:product, condition: "")
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "categoryがない場合は登録できないこと" do
      product = build(:product, category: "")
      product.valid?
      expect(product.errors[:category]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end
    it "descriptionが1001文字以上であれば登録できないこと" do
      product = build(:product, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:description]).to include("は1000文字以内で入力してください")
    end
    it "descriptionが1000文字以下では登録できること" do
      product = build(:product, description: "aaaaaaaaaa")
      # expect(product).to be_valid
    end

    it "shipping_feeがない場合は登録できないこと" do
      product = build(:product, shipping_fee: "")
      product.valid?
      expect(product.errors[:shipping_fee]).to include("を入力してください")
    end
    
    it "shipping_originがない場合は登録できないこと" do
      product = build(:product, shipping_origin: "")
      product.valid?
      expect(product.errors[:shipping_origin]).to include("を入力してください")
    end

    it "shipping_durationがない場合は登録できないこと" do
      product = build(:product, shipping_duration: "")
      product.valid?
      expect(product.errors[:shipping_duration]).to include("を入力してください")
    end
    
  end
end


# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
# end
