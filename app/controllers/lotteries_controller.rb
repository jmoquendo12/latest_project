class LotteriesController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.active.starting
    @categories = Category.all
  end

end
