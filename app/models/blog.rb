class Blog < ApplicationRecord
  mount_uploader :movie, MovieUploader
  belongs_to :user
  has_many :comments

  def index
  end
end
