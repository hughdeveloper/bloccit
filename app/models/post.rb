class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  #order posts in descending order by the created time
  default_scope { order('created_at DESC') }
  #we title how we are going to call the aciton and then tell it what to do
  # title in descending order
  scope :ordered_by_title, -> { order('title DESC') }
  #this is the same as the default scope except we are going in ascending order
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

end
