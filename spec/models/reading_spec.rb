require 'rails_helper'

RSpec.describe Reading, type: :model do
  before :all do

	user_1 = User.create(
	  email: 'dev@meter-man.com',
	  password: '12345678',
	  password_confirmation: '12345678'
	)

	# Create 10 reading for the one and only user
	(1..10).each do |i|
	  month = format("%02d", i)
	  Reading.create(
	    reading: 1000 * i,
	    reading_date: "2015-#{month}-01",
	    created_at: "2015-#{month}-01 [12:00:00]",
	    updated_at: "2015-#{month}-01 [12:00:00]",
	    user_id: user_1.id
	  )
	end

  end



  it "should show error if reading is smaller than previous reading" do
	reading = Reading.create(
	    reading: 50,
	    reading_date: "2015-4-19",
	    user_id: 1
	  )
	reading.valid?
	expect(reading.errors[:reading]).to include('is not within allowable range')
  end
  
  it "should show error if reading is larger than next reading" do
	reading = Reading.create(
	    reading: 11000,
	    reading_date: "2015-5-19",
	    user_id: 1
	  )
	reading.valid?
	expect(reading.errors[:reading]).to include('is not within allowable range')
 end

 it "should show error if reading is negative number" do
 	reading = Reading.create(
 		reading: -15,
 		reading_date: "2014-12-01",
 		user_id: 1
 		)
 	reading.valid?
 	expect(reading.errors[:reading]).to include('is not within allowable range')
 end
end