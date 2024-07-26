module Api
  class UsersController < ApplicationController
    # before_action :set_users, only: [:show,:edit,:update, :destroy]
    def index
      # debugger
      @users=User.all
      render json:@users, status: :ok
    end
  
    def create 
      # debugger
      @user=User.new(user_params)
      if @user.save
        render json:@user, status: :created
      else
        render json:{error:'Error creating post'}
      end
    end
  
    def show
      @user=User.find(params[:id])
      render json:@user, status: :ok
    end
  
    def edit
      # debugger
      # @user=User.find(params[:id])
    end
  
    def update
      # debugger
      @user=User.find(params[:id])
      if @user.update(user_edit_params)
       render json: @user
      else
        render json:{error:'Error updating post'}
      end
    end
  
    def destroy
      # debugger
      @user = User.find(params[:id])
      if @user.destroy
        render json: @user, status: 200
      else
        render json:{error:'Error deleting post'}
      end
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
  
end