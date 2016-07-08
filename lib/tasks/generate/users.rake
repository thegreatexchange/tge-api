require 'faker'
namespace :generate do

  desc "Generate users"
  task :users, [:count] => [:environment] do |t, args|
    count = args[:count].to_i || 1

    count.times do
      User.create email:    Faker::Internet.email,
                  password: 'password'
    end
  end

end
