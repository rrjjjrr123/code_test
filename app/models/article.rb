class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  default_scope { order("updated_at desc") }
  scope :published, -> { where("published_at IS NOT NULL AND published_at < ?", Time.now)}
  scope :draft, -> { where("published_at IS NULL OR published_at >= ?", Time.now)}
end
