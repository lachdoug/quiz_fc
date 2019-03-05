namespace :admin_user do
  desc 'Add role to an admin user ( developer, quizmaster, comptroller, auditor )'

  task :add_role, [ :email, :role ] => :environment do | task, args |
    email = args[:email]
    role =  args[:role]
    Admin.find_by( email: email ).update( role => true )
  end

end
