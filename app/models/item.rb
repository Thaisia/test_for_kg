class Item < ApplicationRecord
  validates :id,    uniqueness: true


  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end

end
