class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.user_id
            render json: user
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        if current_user
            render json: current_user
        else
            render json: {errors: 'Not authorized'}, status: :unauthorized
        end
        
    private

    def user_params
        params.require(:user).permit(:username, ;password, :password_confirmation)
    end
end