namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    clinics = Clinic.all 
	  50.times do |n|
	  cost = 400+n*10
      name = Faker::Lorem.sentence(2)
      clinics.each { |clinic| clinic.procedures.create!(name: name, cost: cost) }
    end
  end
end