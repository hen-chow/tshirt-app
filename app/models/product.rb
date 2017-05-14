class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :colour, :size, :img_src, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :img_src, allow_blank: true, format: {
    with: %r{.(eps|gif|jpg|png)\Z}i,
    message: 'must be an eps, gif, jpg or png image'
  }

  SIZES = ["S", "M", "L"]

  QTY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, "line Items present")
        return false
      end
    end
end
