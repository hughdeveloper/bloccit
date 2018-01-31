require 'random_data'


50.times do
  # the ! symbol instructs the method to raise an error if theres a problem with the data we are seeding
  # if no ! mark and the call failed it would return false
  Post.create!(
    #
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  end

posts = Post.all


100.times do
  Comment.create!(
    # sample is a method for an array that returns a random object in the array
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


@post = Post.find_or_create_by!(title: "Not Random Post", body: "Not Random. There should also be no duplications of this post")


Comment.find_or_create_by!(post: @post , body: "Not Random. There should also be no duplications of this Comment")


puts "Seed Finished"
# Counting the number of post objects
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
