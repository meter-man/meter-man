# Seed data for development environment

# Create one user
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
