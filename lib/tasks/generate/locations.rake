namespace :generate do
  namespace :locations do

    desc "Seed locations"
    task :seed => [ :environment ] do |t, args|
      [
        {
          name:     'Athens, GA',
          region:   'Southeast US',
          country:  'United States',
          state:    'Georgia',
          city:     'Athens',
          address:  nil,
          timezone: 'Eastern Time (US & Canada)'
        },
        {
          name:     'Atlanta, GA',
          region:   'Southeast US',
          country:  'United States',
          state:    'Georgia',
          city:     'Atlanta',
          address:  nil,
          timezone: 'Eastern Time (US & Canada)'
        }
      ].each do |params|
        Location.create params
      end
    end

  end
end
