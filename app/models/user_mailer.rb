class UserMailer < Devise::Mailer

  def default_url_options
    {
      :host => "quizfc.com",
    }
  end

end
