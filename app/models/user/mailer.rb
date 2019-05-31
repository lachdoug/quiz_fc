class User
  class Mailer < Devise::Mailer

    def default_url_options
    {
      :host => "quizfc.com",
      # :port => port
    }
  end

  end
end
