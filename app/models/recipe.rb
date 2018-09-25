# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :instructions, length: {minimum: 10}
  validates :user_id, presence: {message: 'You must be logged in'}
  has_attached_file :image, styles: {thumbnail: '250x250#'}, default_url: 'https://s3.eu-central-1.amazonaws.com/cotton-cookbook/missing.jpg'

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
  validates_attachment_size :image, less_than: 5.megabytes
  validate :check_dimensions

  belongs_to :user, inverse_of: :recipes
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients,
    reject_if: proc { |attribute| attribute['unit_amount'].blank? }, allow_destroy: true
  validates_associated :recipe_ingredients

  private

  def check_dimensions
    temp_file = image.queued_for_write[:original]
    if temp_file
      dimensions = Paperclip::Geometry.from_file(temp_file)
      width = dimensions.width
      height = dimensions.height

      errors.add(:image, 'minimum width: 250px, minimum height: 250px') if width < 250 || height < 250
    end
  end
end
