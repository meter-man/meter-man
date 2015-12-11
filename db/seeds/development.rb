# Seed data for development environment

# Create one user
user_1 = User.create(
  username: 'dev',
  zip: 10573,
  email: 'dev@meter-man.com',
  password: '12345678',
  password_confirmation: '12345678'
)

# Create 10 reading for the one and only user
reading = 1000
(5..64).each do |i|
  month = format("%02d", i/5)
  day = format("%02d", (i%5+1)*3)
  Reading.create(
    reading: reading += 250 + Random.rand(200),
    reading_date: "2015-#{month}-#{day}",
    created_at: "2015-#{month}-#{day} [12:00:00]",
    updated_at: "2015-#{month}-#{day} [12:00:00]",
    user_id: user_1.id
  )
end
