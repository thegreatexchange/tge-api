namespace :generate do
  namespace :locations do

    desc "Seed locations"
    task :seed => [ :environment ] do |t, args|
      [
        { region: 'Southeast US', country: 'United States', state: 'Georgia', city: 'Athens' },
        { region: 'Southeast US', country: 'United States', state: 'Georgia', city: 'Atlanta' }
      ].each do |params|
        Location.create params
      end
    end

  end
end
