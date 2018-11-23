load 'db/seeds/admins.rb'
if Rails.env == "development"
  load 'db/seeds/users.rb'
  # load 'db/seeds/profiles.rb'
  # load 'db/seeds/quizbooks.rb'
  # load 'db/seeds/questions.rb'
  # load 'db/seeds/accounts.rb'
  # load 'db/seeds/leagues.rb'
  # load 'db/seeds/members.rb'
  # load 'db/seeds/quizzes.rb'
end
