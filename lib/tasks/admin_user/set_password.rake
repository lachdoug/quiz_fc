namespace :admin_user do
  desc 'Set password for an admin user'

  task :set_password, [ :email, :password ] => :environment do | task, args |
    email = args[:email]
    password =  args[:password]
    puts Admin.find_by( email: email ).update( password: password )
  end

end
