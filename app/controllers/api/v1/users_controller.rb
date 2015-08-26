class Api::V1::UsersController < ApplicationController
  before_action :set_user , only: [:show,:update,:destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
  end

  def create
    @user = User.new(set_params)

    if @user.save
      render json: '' , status: :created
    else
      render json: @user.errors , status: :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(:name,:email,:cpf,:birth,:password,:checked)
  end
end
