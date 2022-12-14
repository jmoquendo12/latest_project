class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_member, except: [:index, :new, :create]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    if @member.save
      flash[:notice] = "This info was saved."
      redirect_to edit_members_path
    else
      render :new
    end
  end

  def edit; end

  def edit_profile; end

  def update
    if @member.update(member_params)
      redirect_to members_path
    else
      render :edit
    end
  end

  def update_profile
    @member = User.find(current_user.id)
  end

  def show; end

  def member_params
    params.require(:user).permit(:username, :image, :phone)
  end

  def find_member
    @member = User.find(current_user.id)
  end
end
