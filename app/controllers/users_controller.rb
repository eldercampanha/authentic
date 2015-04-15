class UsersController < ApplicationController

def index
	@users = User.all
end

def new
	@user = User.new

end

def create
	@user = User.new(user_params)
	@user.last_signed_in_at = Time.now
	if @user.save
		redirect_to root_path, notice: 'Thanks for signing up' 	
    else
		render 'new'
	end
end

def user_params
	params.require(:user).permit(:name, :email, :password, :admin, :last_signed_in_at)
end

def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render :edit
    end
end

def edit
	@user = User.find(params[:id])
end


end
