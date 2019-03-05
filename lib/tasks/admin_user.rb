namespace :admin_user do
  desc 'Admin management'

  task :create, [ :email, :password, :options ] do | task, args |
    email = args[:email]
    password = args[:password]

    Admin.create!([
      {
        email: email,
        password: password,
        password_confirmation: password,
      },
    ])
  end

  task :add_role, [ :email, :role ] do | task, args |
    email = args[:email]
    role =  args[:role]
    Admin.find_by( email: email ).update( role => true )
  end

  task :remove_role, [ :email, :role ] do | task, args |
    email = args[:email]
    role =  args[:role]
    Admin.find_by( email: email ).update( role => false )
  end

  task :set_password, [ :email, :password ] do | task, args |
    email = args[:email]
    password =  args[:password]
    Admin.find_by( email: email ).update( password: password )
  end

end
