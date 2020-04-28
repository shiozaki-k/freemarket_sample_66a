class CardsController < ApplicationController
  def new
  end
  
  def pay #クレジットカード登録
    Payjp.api_key = "sk_test_4f801eba0fdf2b8b981edda5"
    # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
    if params['payjpToken'].blank?
    # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
      )
     # ↑ここでjay.jpに保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
     # ここでdbに保存
      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
 end

 def show
  card = current_user.credit_card
  if card.blank?
    redirect_to action: "new" 
  else
    Payjp.api_key = "sk_test_4f801eba0fdf2b8b981edda5"
    customer = Payjp::Customer.retrieve(card.customer_id)
    @customer_card = customer.cards.retrieve(card.card_id)
  end
end

def buy #クレジット購入

  if card.blank?
    redirect_to action: "new"
    flash[:alert] = '購入にはクレジットカード登録が必要です'
  else
    @product = Product.find(params[:product_id])
   # 購入した際の情報を元に引っ張ってくる
    card = current_user.credit_card
   # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
    Payjp.api_key = "sk_test_4f801eba0fdf2b8b981edda5"
   # キーをセットする(環境変数においても良い)
    Payjp::Charge.create(
    amount: @product.price, #支払金額
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
   # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
    if @product.update(status: 1, buyer_id: current_user.id)
      flash[:notice] = '購入しました。'
      redirect_to controller: "products", action: 'show'
    else
      flash[:alert] = '購入に失敗しました。'
      redirect_to controller: "products", action: 'show'
    end
   #↑この辺はこちら側のテーブル設計どうりに色々しています
  end
end

def delete
  card = current_user.credit_card
  if card.blank?
    redirect_to action: "new"
  else
    Payjp.api_key = 'sk_test_4f801eba0fdf2b8b981edda5'
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
   #ここでpay.jpの方を消している
    card.delete
   #ここでテーブルにあるcardデータを消している
  end  
end
end
