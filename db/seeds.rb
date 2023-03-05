puts 'Let me clear old data'

Project.destroy_all
User.destroy_all
Link.destroy_all

puts 'Seeding that thing'

15.times do
  Project.create(
    title: Faker::Job.title,
    description: Faker::Lorem.sentence,
    status: rand(0..3),
  )

  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    passwordHash: Faker::Alphanumeric.alphanumeric(number: 10),
    avatar_url:
      Faker::Avatar.image(slug: 'my-own-slug', size: '50x50', format: 'bmp'),
  )

  rand(3..6).times do
    Link.create(user_id: rand(1..15), project_id: rand(1..15))
  end
end

puts 'Sawa, twende kazi...'
