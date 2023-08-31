class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
#before_action :redirect, only: [:edit, :update]
def index
     @user=current_user
     @users=User.all
     @book=Book.new
     
end

def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
    
    
end



  def edit
     @user=User.find(params[:id])
    if@user=current_user
        render"edit"
    else
        redirect_to user_path(current_user)
    end
     
  end

 def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
           redirect_to book_path
    end
        
  if@user.update(user_params)
      flash[:notice] = "successfully"
    redirect_to user_path(current_user.id)
  else
       render :edit
  end
 end
  
private

def user_params
    params.require(:user).permit( :profile_image, :name, :introduction)
end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end