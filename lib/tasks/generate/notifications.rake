require 'faker'
namespace :generate do

  namespace :notifications do

    desc "Seed Notifications"
    task :seed, [:count] => [:environment] do |t, args|
      count = args[:count] ? args[:count].to_i : 25
      count.times do
        sent_by = User.order('random()').first
        sent_to = Person.order('random()').first
        sent_at = Faker::Time.between(90.days.ago, Date.today, :all)
        data = {
          subject: Faker::Lorem.sentence,
          body:    Faker::Lorem.paragraph
        }

        Notification.create sent_by: sent_by,
                            sent_to: sent_to,
                            sent_at: sent_at,
                            data:    data
      end
    end

  end

end
