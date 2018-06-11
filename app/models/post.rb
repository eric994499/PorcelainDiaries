class Post < ApplicationRecord
	belongs_to :user
	has_many_attached :images
	scope :with_eager_loaded_images, -> {eager_load(image_attachments: :blob)}
    has_many :comments, dependent: :destroy
    validates :content, presence: true
    validates :title, presence: true
    is_impressionable
    acts_as_votable :vote_counter => true
end
