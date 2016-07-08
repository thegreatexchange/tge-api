require 'faker'
namespace :generate do
  desc "Generate users"
  task :users => [:environment] do
    inserts = []
    100.times { inserts << "('#{Time.current}', '#{Time.current}', '#{Faker::Internet.email}', 'password')" }
    User.connection.execute %Q{ INSERT INTO users (created_at, updated_at, email, password) values #{inserts.join(', ')} }
  end
end
