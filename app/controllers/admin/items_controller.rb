class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin_user!
  # before_action :item_params, except: [:index, :new, :create]
  before_action :find_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Saved"
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      flash[:notice] = "Updated"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path
  end

  #
  def item_params
    params.require(:item).permit(:image, :name, :quantity, :minimum_bets, :status, :start_at, :online_at, :offline_at, :state, :batch_count)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  
end
