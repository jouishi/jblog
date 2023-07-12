class Blog < ApplicationRecord
  mount_uploader :movie, MovieUploader
  belongs_to :user


  def index
    
  end



end
