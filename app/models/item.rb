class Item < ApplicationRecord
  validates :id,    uniqueness: true
end
