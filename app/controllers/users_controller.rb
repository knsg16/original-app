class UsersController < ApplicationController
    def index 
        @users = User.all
        @auths = ["メンバー", "全権限", "配送", "CS", "事業開発"]
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        #authorize!
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "ユーザー情報を変更しました"
            redirect_to action: :index
            return 
        end
        render :edit
    end
    
    private
    def user_params
        params.require(:user).permit(:username,:email, :authority)
    end
end
