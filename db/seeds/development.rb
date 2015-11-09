# Seed data for development environment

# Create one user
user_1 = User.create(
  email: 'dev@meter-man.com',
  password: '12345678',
  password_confirmation: '12345678'
)

# Create one reading for the one and only user
reading_1 = Reading.create(
  reading: 1000,
  reading_date: '2015-01-01',
  created_at: '2015-01-01 [12:00:00]',
  updated_at: '2015-01-01 [12:00:00]',
  user_id: user_1.id
)
