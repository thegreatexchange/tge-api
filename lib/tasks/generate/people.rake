require 'faker'
namespace :generate do
  namespace :people do

    desc 'Seed people'
    task :seed, [ :count ] => [ :environment ] do |t, args|
      count = args[:count] ? args[:count].to_i : 250
      count.times do
        name = Faker::Name.name
        Person.create name:         name,
                      email:        Faker::Internet.email(name),
                      phone_number: Faker::PhoneNumber.phone_number
      end
    end

  end
end
