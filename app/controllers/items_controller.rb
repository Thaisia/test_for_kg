class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").paginate(page: params[:page])
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    puts @item.methods.sort   
  end

end
