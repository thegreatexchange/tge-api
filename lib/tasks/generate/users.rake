require 'faker'
namespace :generate do

  namespace :users do

    desc "Seed users"
    task :seed, [:count] => [:environment, :super] do |t, args|
      count = args[:count].to_i || 1
      count.times do
        User.create email:    Faker::Internet.email,
                    name:     Faker::Name.name,
                    password: 'password'
      end
    end

    desc "Generate super user"
    task :super, [:name, :email, :password] => [:environment] do |t, args|
      name     = args[:name]     || 'Super Admin'
      email    = args[:email]    || 'super@test.com'
      password = args[:password] || 'password'

      User.create email:    email,
                  name:     name,
                  password: password,
                  super:    true
    end

  end

end
