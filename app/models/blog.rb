class Blog < ApplicationRecord
  mount_uploader :movie, MovieUploader
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  def self.search(search)
    if search != ""
      Blog.where('text LIKE(?)', "%#{search}%")
    else
      Blog.all
    end
  end

  def index
  end
end
