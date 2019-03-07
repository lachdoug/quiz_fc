namespace :admin_user do
  desc 'Remove role from an admin user ( developer, quizmaster, comptroller, auditor )'

  task :remove_role, [ :email, :role ] => :environment do | task, args |
    email = args[:email]
    role =  args[:role]
    Admin.find_by( email: email ).update( role => false )
  end

end
