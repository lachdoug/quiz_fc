class SupportMailer < ApplicationMailer
  layout false

  def email( current_user, message )
    @message = message
    mail(
      from: current_user.email,
      to: "support@quizfc.com",
      subject: 'QuizFC user message'
    )
  end

end
