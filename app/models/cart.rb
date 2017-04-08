class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :user
  has_many :line_items
end
