class StripeSession

  def initialize( account, amount, succeeded_path, failed_path )
    @account = account
    @amount = amount
    @succeeded_path = succeeded_path
    @failed_path = failed_path
    @session = create_session
  end

  def id
    @session.id
  end

  def profile
    member.profile
  end

  def member
    @account.accountable
  end

  def currency
    member.league.currency
  end

  def publishable_key
    Rails.configuration.stripe[:publishable_key]
  end

  def root
    Rails.env.production? ?
    "https://quizfc.com" :
    "http://203.63.226.96:3000"
  end

  def charge_amount
    @amount * 100
  end

  def create_session

    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'QuizFC',
        description: "Payment for #{ @amount } Quizbucks",
        images: ["#{ root }/favicon.ico"],
        amount: charge_amount,
        currency: currency,
        quantity: 1,
      }],
      customer_email: profile.user.email,
      client_reference_id: @account.id,
      success_url: "#{ root }#{ @succeeded_path }",
      cancel_url: "#{ root }#{ @failed_path }",
    )

  end

end
