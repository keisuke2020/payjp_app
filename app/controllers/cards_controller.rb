class CardsController < ApplicationController
  
  def new
  end

  def create
    Payjp.api_key = ENV["sk_test_96dbe48cc3a53f6dd17bc11d"] 
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:card_token] 
    )
 
  card = Card.new( 
    card_token: params[:card_token], 
    customer_token: customer.id, 
    user_id: current_user.id 
  )
    if card.save
      redirect_to root_path
    else
      redirect_to "new" # カード登録画面
    end
  end  

end
