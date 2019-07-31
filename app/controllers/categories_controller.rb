class CategoriesController < ApplicationController
  def index
    @all_cats = Category.all
  end
end
