class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :product
  belongs_to :user
end
