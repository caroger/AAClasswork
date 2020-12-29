class UsersController < ApplicationController
  def index 
    # render plain: "I'm in the index action!"
    render json: User.all
  end

  def create
    # render json: params

    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    # user.save!
    # render json: user
    debugger
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      # redirect_to "/users/#{user.id}"
      # redirect_to user_url(user.id)
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    render json: user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end