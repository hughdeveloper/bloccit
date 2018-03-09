class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  before_save :format_name
  before_save {self.email = email.downcase if email.present?}
  # ||= is a Ruby trick. The code self.role ||= :member, then, is shorthand for  self.role = :member if self.role.nil?
  before_save { self.role ||= :member }

  validates :name, length: {minimum: 1, maximum: 100}, presence: true
  # the nil allows the user to reset other portions of there account without having to update the password as well
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  validates :password, length: {minimum: 6}, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }


  has_secure_password

  enum role: [:member, :admin, :moderator]

  def format_name
    if name
      name_array = []
      name.split.each do |name_part|
        name_array << name_part.capitalize
      end
      self.name = name_array.join(" ")
    end
  end
end
