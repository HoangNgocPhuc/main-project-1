class Health < ActiveRecord::Base
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :weight, presence: true, numericality: true, length: {maximum: 3}
  validates :height, presence: true, numericality: true, length: {maximum: 3}
end
