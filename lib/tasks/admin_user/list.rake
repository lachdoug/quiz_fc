namespace :admin_user do
  desc 'List all admin users'

  task :list => :environment do | task, args |
    puts Admin.all.map do |admin_user|
      {
        email: email,
        developer: developer,
        quizmaster: quizmaster,
        comptroller: comptroller,
        auditor: auditor
      }
    end
  end

end
