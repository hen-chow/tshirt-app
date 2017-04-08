class LineItem < ApplicationRecord
  belongs_to :design
  belongs_to :product
  belongs_to :cart
end
