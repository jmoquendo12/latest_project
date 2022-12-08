class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_address, only: [:edit, :update, :show]

  def index
    @addresses = current_user.addresses.includes(:user, :region, :province, :city_municipality, :barangay)
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params_address)
    @address.user = current_user
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @address.user = current_user
    if @address.update(params_address)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def show; end
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  def params_address
    params.require(:address).permit(:name, :phone_number, :remarks, :genre, :street_address, :address_region_id, :address_province_id, :address_city_municipality_id, :address_barangay_id)
  end

  def find_address
    @address = Address.find(params[:id])
  end

end


