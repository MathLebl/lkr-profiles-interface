    puts 'Creating User ...'
    user = User.new(
      email: 'admin@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user.save!

    puts 'User created'
# Use the same technic for your seeds. Create a file in db/seeds and put your lines into.
