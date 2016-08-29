require 'faker'
namespace :generate do

  namespace :messages do

    desc "Seed Messages"
    task :seed, [:count] => [:environment] do |t, args|
      count = args[:count] ? args[:count].to_i : 25
      count.times do
        sender =  Person.order('random()').first
        sent_at = Faker::Time.between(90.days.ago, Date.today, :all)
        data = {
          subject: Faker::Lorem.sentence,
          body:    Faker::Lorem.paragraph
        }

        message = Message.create person_id: sender.id,
                       sent_at:   sent_at,
                       data:      data

        rand(25).times do
          Recipient.create message: message,
                           person:  Person.order('random()').first
        end
      end
    end

  end

end
