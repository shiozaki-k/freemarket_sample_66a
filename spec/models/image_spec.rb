require 'rails_helper'

RSpec.describe Product, type: :model do
# describe Image do
  describe '#create' do
    it "画像がない場合は登録できないこと" do
      image = build(:image, src: nil)
      image.valid?
      expect(image.errors[:src]).to include("を入力してください")
    end
  end
end

# RSpec.describe Image, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
# end
