class Pin < ApplicationRecord
	belongs_to :user, optional: true
	acts_as_votable

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :image, presence: true
  	validates :description, presence: true
end
