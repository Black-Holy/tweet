class Calendar < ApplicationRecord
  
  validates :description, presence: true
  validates :title, presence: true
  mount_uploader :image, ImageUploader

  validate :validate_end_date

  def validate_end_date
    if end_date < start_date
      errors.add(:end_date, "投稿に失敗しました")
    end
  end

end
