class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :author, presence: true
  validates :content, presence: true
  validates :title, length: { minimum: 10, message: "too short title" }
end
