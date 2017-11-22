class SubscribersController < ApplicationController

  #before_action :authenticate_user!

  def new

  end

  def create
    # Amount in cents
    @amount = 599


    # Create the customer in Stripe
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    # Create the charge using the customer data returned by Stripe API
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    # place more code upon successfully creating the charge
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to subscribers_path
      flash[:notice] = "Please try again"
    end
  end
  #def update
  #  token = params[:stripeToken]

  #  customer = Stripe::Customer.create(
  #    card: token,
  #    plan: 1101,
  #    email: current_user.email,
  #  )

  #  current_user.subscribed = true
  #  current_user.stripeid = customer.id
  #  current_user.save

  #  redirect_to wikis_path
  #end
