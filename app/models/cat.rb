class Cat < ApplicationRecord
  include ImageUploader::Attachment(:images)
end
