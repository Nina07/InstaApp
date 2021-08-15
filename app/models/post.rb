class Post < ApplicationRecord
    belongs_to :user

    has_one_attached :image
    validate :image_attachement

    has_many :comments, dependent: :destroy

    def image_attachement
        errors.add(:image, "Post cannot be created without an image!") unless image.attached?
    end
end
