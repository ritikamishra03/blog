class UsersController < ApplicationController
  before_action :set_users, only: [:show,:edit,:update, :destroy]
  def index
    # debugger
    @users=User.all

  end

  def new
    @user=User.new
  end

  def create 
    # debugger
    @user=User.new(user_params)
    if @user.save
      flash[:notice] = 'User has created successfully'
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    # debugger
    @user=User.find(params[:id])
  end

  def edit
    # debugger
    @user=User.find(params[:id])
  end

  def update
    # debugger
    @user=User.find(params[:id])
    if @user.update(user_edit_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    # debugger
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
    
  end

  def search
    key="%#{params[:key]}%"
    @users=User.where("name LIKE ?", key)
    redirect_to search_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:gender,:dob,:city)
  end
  def user_edit_params
    params.require(:user).permit(:email,:password,:dob,:city)
  end

  def set_users
    # @user=User.find(params[:id])
    # unless @user
    #   render json: {error:'user not found'}, status: 404
    end

end
