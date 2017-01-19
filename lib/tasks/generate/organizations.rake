namespace :generate do
  namespace :organizations do

    desc "Seed organizations"
    task :seed, [:count ] => [:environment] do |t, args|
      count = args[:count] ? args[:count].to_i : 5

      count.times do
        Organization.create name: Faker::University.name
      end
    end

  end
end
