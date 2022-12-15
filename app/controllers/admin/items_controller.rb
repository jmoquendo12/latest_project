class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin_user!
  # before_action :item_params, except: [:index, :new, :create]
  before_action :set_item, only: [:edit, :update, :destroy, :start, :pause, :end, :cancel]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.pending
      redirect_to admin_items_path
    else
      @item.start
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

  def start
    @items.start!
    redirect_to admin_items_path

  end

  def pause
    @items.pause!
    redirect_to admin_items_path

  end

  def end
    @items.end!
    redirect_to admin_items_path
  end

  def cancel
    @items.cancel!
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :quantity, :minimum_bets, :status, :start_at, :online_at, :offline_at, :state, :batch_count)
  end

  def set_item
    @items = Item.find(params[:id] || params[:item_id])
  end

end
