require 'rails_helper'

RSpec.describe User, type: :model do
	it "is valid with a username, email, password" do
		user = User.new(
			username: 'Spiderman',
			email: 'Test@test.com',
			password: '12345678')
		expect(user).to be_valid
	end


	it "is invaild without username" do
		user = User.new(username: nil,
			email: 'Test@test.com',
			password: '12345678')
		user.valid?
		expect(user.errors[:username]).to include("can't be blank")
	end	
end