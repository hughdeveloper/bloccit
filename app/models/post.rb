class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  after_create :create_vote

  #order posts in descending order by the created time
  default_scope { order('rank DESC') }
  #we title how we are going to call the aciton and then tell it what to do
  # title in descending order
  scope :ordered_by_title, -> { order('title DESC') }
  #this is the same as the default scope except we are going in ascending order
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true


    def up_votes
     votes.where(value: 1).count
    end

    def down_votes
     votes.where(value: -1).count
    end

    def points
     votes.sum(:value)
    end

    def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end

   private

   def create_vote
     user.votes.create(value: 1, post: self)
   end


end
