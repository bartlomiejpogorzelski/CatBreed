# frozen_string_literal: true

class Kittens::KittenDetailsComponent < ViewComponent::Base

  attr_reader :cat

  def initialize(cat:)
    @cat = cat
  end
  
  private

  def row_style
    "mb-3 font-normal text-gray-700 dark:text-gray-400"
  end
end
