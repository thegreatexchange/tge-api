require 'faker'

namespace :generate do
  namespace :events do

    desc "Seed events"
    task :seed, [:count ] => [:environment] do |t, args|
      count         = args[:count] ? args[:count].to_i : 10
      organizations = Organization.all

      count.times do
        organization  = organizations.sample
        days_from_now = Faker::Number.between(0, 90).days.from_now
        Event.create organization:    organization,
                     location:        organization.location,
                     starts_at:       Faker::Time.between(days_from_now, days_from_now, :morning),
                     ends_at:         Faker::Time.between(days_from_now, days_from_now, :afternoon),
                     description:     Faker::Lorem.sentence,
                     name:            Faker::Lorem.sentence(3)
      end


    end
  end
end
