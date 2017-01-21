namespace :generate do
  namespace :organization_memberships do

    desc "Seed organization memberships"
    task :seed, [:count] => [:environment] do |t, args|
      count = args[:count] ? args[:count].to_i : 20

      Organization.all.each do |organization|
        Person.all.sample(count).each do |person|
          organization.organization_memberships.create person: person
        end
        organization.organization_memberships.last.update_attribute(:is_primary, true)
      end
    end

  end
end
