puts 'Destroy previous Users'
User.destroy_all
puts 'Creating User ...'
user = User.new(
  email: 'admin@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  user_password: '12345678',
  username: 'test'
)
user.save!

puts 'User created'
# Use the same technic for your seeds. Create a file in db/seeds and put your lines into.
