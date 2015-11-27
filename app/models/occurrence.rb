class Occurrence < ActiveRecord::Base
  validates :description , presence: true

  mount_uploader :pic , PicUploader

  belongs_to :user
end
