namespace :generate do
  namespace :authorizations do

    desc "Seed authorizations"
    task :seed => [ :environment ] do |t, args|
      [
        { name: 'super', description: 'Super user access.' }
      ].each do |params|
        Authorization.create params
      end
    end

  end
end
