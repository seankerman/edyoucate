class UsersController < ApplicationController
  before_action :confirm_logged_in
  before_action :admin_only, :except => :show

  def index
    @users = User.sorted
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user_count = User.count + 1
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User Created"
      redirect_to(:action => 'index')
    else
      @user_count = User.count + 1
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
    @user_count = User.count

  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User Updated"
      redirect_to(:action => 'index')
    else
      @user_count = User.count
      render('edit')
    end

  end


  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.username}' destoryed successfully"
    redirect_to(:action => 'index')
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

    def user_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:user).permit(:first_name, :last_name, :image, :email, :username, :password, :created_at, :role)
    end
end
