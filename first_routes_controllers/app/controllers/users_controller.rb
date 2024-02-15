class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    # http://localhost:3000/users?user[name]=tim&user[email]=tim@tim.com
    def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        incoming_id = params[:id]
        user = User.find(incoming_id)
        render json: user
    end
    
    def update
        incoming_id = params[:id]
        user = User.find(incoming_id)

        if user && user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id = params[:id]
        user = User.find(incoming_id)
        user.destroy
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end