require 'faker'

namespace :generate do
  namespace :events do

    desc "Seed events"
    task :seed, [:count ] => [:environment] do |t, args|
      count      = args[:count] ? args[:count].to_i : 10
      schools    = School.all
      ministries = Ministry.all

      count.times do
        school        = schools.sample
        days_from_now = Faker::Number.between(0, 90).days.from_now
        Event.create school:      school,
                     ministry:    school.ministries.sample,
                     location:    school.location,
                     starts_at:   Faker::Time.between(days_from_now, days_from_now, :morning),
                     ends_at:     Faker::Time.between(days_from_now, days_from_now, :afternoon),
                     description: Faker::Lorem.sentence
      end


    end
  end
end
