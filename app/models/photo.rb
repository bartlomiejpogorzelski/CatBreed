class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :cat, optional: true
  belongs_to :post, optional: true
end
