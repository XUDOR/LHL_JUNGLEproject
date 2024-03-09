class Order < ApplicationRecord
  has_many :line_items
  
  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
