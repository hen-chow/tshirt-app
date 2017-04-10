class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :design
  belongs_to :cart
  belongs_to :order
end
