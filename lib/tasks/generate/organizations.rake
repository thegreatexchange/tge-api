namespace :generate do
  namespace :organizations do

    desc "Seed organizations"
    task :seed => [ :environment ] do |t, args|
      [
        { name: 'Baptist Collegiate Ministries', location_id: location_id_for('Athens', 'Georgia') },
        { name: 'Athletes in Action', location_id: location_id_for('Atlanta', 'Georgia') },
        { name: 'Watkinsville First Baptist College Ministry', location_id: location_id_for('Athens', 'Georgia') }
      ].each do |params|
        Organization.create params
      end
    end

  end
end

def location_id_for(city, state)
  Location.where(city: city, state: state).first.id
end
