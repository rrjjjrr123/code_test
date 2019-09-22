class User < ApplicationRecord
  has_many :articles
  validates_uniqueness_of :email
end
