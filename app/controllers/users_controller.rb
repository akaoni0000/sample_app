class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            NoticeMailMailer.register_user_complete(@user).deliver_now
            flash[:notice] = "ユーザー登録完了です"
            redirect_to users_path
        else

        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:destroy] = "ユーザーを削除しました"
        redirect_to users_path
    end

    def index
        session[:id] = 1
        @users = User.all
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :avator)
    end
end
