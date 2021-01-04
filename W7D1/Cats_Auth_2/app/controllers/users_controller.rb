class UsersController < ApplicationController
  before_action :require_logged_in, only: [:index, :show]

  def new 
    @user = User.new
    render :new
  end


  def index 
    @users = User.all
    # render json: users
    render :index
  end

  def show 
    @user = User.find(params[:id])
    render :show
    # render json: user
  end

  def edit 
    # /users/:id/edit
    @user = User.find(params[:id])
    render :edit
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      #login user if save successful 
      # redirect_to "/users/#{user.id}"
      login(@user) #from applicationcontroller 
      redirect_to cats_url
      # render json: user
    else
      #if unsuccessful, render :new 
      render :new
      # render json: user.errors.full_messages, status: 422
    end
  end

  # def update
  #   @user = User.find(params[:id])

  #   if @user.update(user_params)
  #     # redirect_to "/users/#{user.id}"
  #     # redirect_to user_url(user.id)
  #     redirect_to user_url(@user)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    user = User.find(params[:id])

    user.destroy

    render json: user
  end

  private 


  # t.string "user_name", null: false
  #   t.string "password_digest", null: false
  #   t.string "session_token", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["session_token"], name: "index_users_on_session_token", unique: true
  #   t.index ["user_name"], name: "index_users_on_user_name", unique: true
  def user_params
    params.require(:user).permit(:user_name, :password) 
  end

end
