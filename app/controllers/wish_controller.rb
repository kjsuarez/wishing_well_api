class WishController < ActionController::API

  require "stripe"

  def makeWish

    render json: {json: "Made a wish for #{params[:_json]}"}
  end

  def makePayment
    wish_amount = params[:wish][:amount].to_int
    wish_amount = wish_amount.to_i
    if Rails.env.production?
      Stripe.api_key = Rails.application.credentials[:stripe][:live_secret_key]
    else
      Stripe.api_key = Rails.application.credentials[:stripe][:test_secret_key]
    end


    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:token][:id]

    charge = Stripe::Charge.create({
        amount: wish_amount,
        currency: 'usd',
        description: 'Example charge',
        source: token,
    })
    saveWish
    render json: {outcome: charge["outcome"]}
    # render json: {error: "errororrororror"}
  end

  def publicWishes
    render json: Wish.all
  end

  def saveWish
    puts("saving wish")
    Wish.create(wish_maker_name: params[:wish][:name], wish_text: params[:wish][:content], wish_amount: params[:wish][:amount])
  end
end
