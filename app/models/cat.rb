class Cat < ApplicationRecord
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? && attributes['id'].blank? }end
