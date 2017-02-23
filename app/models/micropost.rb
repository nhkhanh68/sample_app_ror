class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_lenght_post}

  private

  def picture_size
    if picture.size > Settings.picture_size.megabytes
      errors.add(:picture, t(".less_than_5MB"))
    end
  end
end
