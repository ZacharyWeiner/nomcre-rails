class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def proposal_deposit
    @proposal = Proposal.find(params[:proposal_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @proposal.price,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge['paid'] == true
      @proposal.deposit_paid = true
      @proposal.deposit_id = charge['id']
      @proposal.deposit_paid_on = Date.today
      @proposal.save
      byebug
      respond_to do |format|
        format.html { redirect_to @proposal, notice: 'Proposal Deposit Successfully Paid.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to proposal_deposit_path(@proposal), notice: 'There was an Error Paying the Deposit' }
        format.json { head :no_content }
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def proposal_balance
    @proposal = Proposal.find(params[:proposal_id])
    @amount = ((@proposal.price - (@proposal.price * 0.01)) * 100).to_int
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge['paid'] == true
      @proposal.paid = true
      @proposal.charge_id = charge['id']
      @proposal.save
      byebug
      respond_to do |format|
        format.html { redirect_to @proposal, notice: 'Proposal Deposit Successfully Paid.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to proposal_deposit_path(@proposal), notice: 'There was an Error Paying the Deposit' }
        format.json { head :no_content }
      end
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
