class LotteriesController < ApplicationController
  def index
    @items = Item.includes(:categories).where
  end
end
