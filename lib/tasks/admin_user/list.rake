namespace :admin_user do
  desc 'List all admin users'

  task :list => :environment do | task, args |
    Admin.all.each do |admin_user|
      puts ( {
        email: admin_user.email,
        developer: admin_user.developer,
        quizmaster: admin_user.quizmaster,
        comptroller: admin_user.comptroller,
        auditor: admin_user.auditor
      }.to_yaml )
    end
  end

end
