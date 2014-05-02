class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def new
        if current_user
            redirect_to articles_path
            else
            @user = User.new
        end
    end
    
    
    def update
        respond_to do |format|
            @user = User.find params[:id]
            if @user.update(user_params)
                format.html { redirect_to articles_path, notice: 'Password was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: 'edit' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    def create
        
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to articles_path
            else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    def logout
        session[:user_id] = nil
        redirect_to :action => 'login'
    end
    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end