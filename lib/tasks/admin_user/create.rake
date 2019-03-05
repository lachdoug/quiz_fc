namespace :admin_user do
  desc 'Create an admin user'

  task :create, [ :email, :password ] => :environment do | task, args |
    email = args[:email]
    password = args[:password]

    Admin.create!([
      {
        email: email,
        password: password,
        password_confirmation: password,
      },
    ])

    puts "Created admin user"

  rescue ActiveRecord::RecordInvalid => e
    puts e
  end

end
