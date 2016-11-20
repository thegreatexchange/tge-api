namespace :generate do
  namespace :authorizations do

    desc "Seed authorizations"
    task :seed => [ :environment ] do |t, args|
      [
        { name: Authorization::VALID_NAMES[:super],     description: 'Super user access.' },
        { name: Authorization::VALID_NAMES[:app_admin], description: 'Admin App Access' },
        { name: Authorization::VALID_NAMES[:app_event], description: 'Event App Access' }
      ].each do |params|
        Authorization.create params
      end
    end

  end
end
