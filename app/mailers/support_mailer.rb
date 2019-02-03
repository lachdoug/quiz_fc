class SupportMailer < ApplicationMailer
  layout false

  def email( current_user, message )
      mail(
        from: current_user.email,
        to: "support@quizfc.com",
        subject: 'User message'
      )
  end

end
