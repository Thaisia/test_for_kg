module ItemsHelper

  def picture_pulling(item_id)
    item = Item.find_by(id: item_id)
    return item.picture.split(',')
  end

end
