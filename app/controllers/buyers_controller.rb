class BuyersController < ApplicationController
require 'payjp'#Payjpの読み込み
before_action :set_card, :set_item


def index
  if @product.status == "sold"
    redirect_to root_path,notice: 'すでに売り切れです' and return
  else
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_card_path
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end

def pay
  Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
  Payjp::Charge.create(
    amount: @product.price, #支払金額を引っ張ってくる
    customer: @card.customer_id,  #顧客ID
    currency: "jpy",              #日本円
  )
  
  redirect_to done_product_buyers_path #完了画面に移動
end

def done
  @product_purchaser= Product.find(params[:product_id])
  redirect_to root_path unless @product_purchaser.update( status: 2)
end

private

def set_card
  @card = Card.find_by(user_id: current_user.id)
end

def set_item
  @product = Product.find(params[:product_id])
end

def set_status
  params.require(:product).permit(:name, :price, :condition, :category_id, :brand, :description, :shipping_fee, :prefecture_id, :shipping_duration, :user_id, images_attributes:  [:src, :_destroy, :id]).merge(status: 1, user_id: current_user.id)
end

  
end
