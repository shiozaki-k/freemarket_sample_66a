require 'rails_helper'

RSpec.describe Card, type: :model do
  describe '#new' do

    it "user_idがない場合は登録できないこと" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  
end

end
