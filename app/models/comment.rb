class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, presence: true
  validates :name, presence: true

  scope :order_by_time, -> { order('created_at DESC') }
end
