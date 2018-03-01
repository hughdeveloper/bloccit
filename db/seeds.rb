require 'random_data'


15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

moderator = User.create!(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)

member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)

users = User.all




50.times do
  # the ! symbol instructs the method to raise an error if theres a problem with the data we are seeding
  # if no ! mark and the call failed it would return false
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  end

  50.times do
    Sponsoredpost.create!(
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: RandomData.random_number
    )
    end

posts = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


@post = Post.find_or_create_by!(title: "Not Random Post", body: "Not Random. There should also be no duplications of this post", topic: topics.sample, user: users.sample)


Comment.find_or_create_by!(post: @post , body: "Not Random. There should also be no duplications of this Comment", user: users.sample)


20.times do
  Advertisement.create!(
    title: RandomData.random_word,
    body: RandomData.random_sentence,
    price: RandomData.random_number
  )
end

100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end


puts "Seed Finished"
# Counting the number of post objects
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Sponsoredpost.count} sponsoredposts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
