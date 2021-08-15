class Post < ApplicationRecord
    acts_as_votable

    belongs_to :user

    has_one_attached :image
    validate :image_attachement
    validates :user_id, presence: true

    has_many :comments, dependent: :destroy

    def image_attachement
        errors.add(:image, "Post cannot be created without an image!") unless image.attached?
    end
end
