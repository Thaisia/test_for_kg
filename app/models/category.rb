class Category < ApplicationRecord
  validates :id,    uniqueness: true
end
