namespace :generate do
  namespace :schools do
    desc "Seed locations"
    task :seed => [ :environment ] do |t, args|
      [
        { name: 'University of Georgia', location_id: location_id_for('Athens', 'Georgia') },
        { name: 'Georgia Institute of Technology', location_id: location_id_for('Atlanta', 'Georgia') }
      ].each do |params|
        School.create params
      end
    end
  end
end

def location_id_for(city, state)
  Location.where(city: city, state: state).first.id
end
