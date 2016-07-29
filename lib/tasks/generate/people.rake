require 'faker'
namespace :generate do

  namespace :people do

    desc 'Seed people'
    task :seed, [ :count ] => [ :environment ] do |t, args|
      count = args[:count] ? args[:count].to_i : 500
      count.times do
        Person.create name:         Faker::Name.name,
                      email:        Faker::Internet.email,
                      phone_number: Faker::PhoneNumber.phone_number,
                      location:     "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
      end
    end

  end

end
