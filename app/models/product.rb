class Product < ApplicationRecord
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
  validates :image, presence: true


  validate :price_must_be_present

  private

  def price_must_be_present
    if price_cents.blank? || price_cents == 0
      errors.add(:price, "can't be blank and must be greater than 0")
    end
  end
end
