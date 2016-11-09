namespace :generate do
  namespace :ministries do

    desc "Seed ministries"
    task :seed => [ :environment ] do |t, args|
      [
        { name: 'Baptist Collegiate Ministries', school_id: school_id_for('University of Georgia'), location_id: location_id_for('Athens', 'Georgia') },
        { name: 'Athletes in Action', school_id: school_id_for('Georgia Institute of Technology'), location_id: location_id_for('Atlanta', 'Georgia') },
        { name: 'Watkinsville First Baptist College Ministry', location_id: location_id_for('Athens', 'Georgia') }
      ].each do |params|
        Ministry.create params
      end
    end

  end
end

def location_id_for(city, state)
  Location.where(city: city, state: state).first.id
end

def school_id_for(name)
  School.find_by_name(name).id
end
