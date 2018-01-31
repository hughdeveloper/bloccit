require 'random_data'


50.times do
  # the ! symbol instructs the method to raise an error if theres a problem with the data we are seeding
  Post.create!(
    #
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  end

posts = Post.all


100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


Post.find_or_create_by!(title: "Not Random Post", body: "Not Random. There should also be no duplications of this post")


Comment.find_or_create_by!(post: posts.last , body: "Not Random. There should also be no duplications of this Comment")


puts "Seed Finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
