class Calendar < ApplicationRecord
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  mount_uploader :image, ImageUploader

  validate :validate_end_date
  belongs_to :user

  def validate_end_date
    if end_date < start_date
      errors.add(:end_date, "投稿に失敗しました")
    end
  end

end
