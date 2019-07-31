class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def search
  end
end
