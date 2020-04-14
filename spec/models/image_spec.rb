require 'rails_helper'
describe Image do
  describe '#create' do

    it "画像がない場合は登録できないこと" do
      image = build(:image, src: nil)
      image.valid?
      expect(image.errors[:src]).to include("can't be blank")
    end
  end
end

# RSpec.describe Image, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
