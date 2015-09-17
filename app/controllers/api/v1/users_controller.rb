class Api::V1::UsersController < ApplicationController
  before_action :set_user , only: [:confirm_user,:show,:update,:destroy]

  def index
    @users= User.all
    render json: @users , status: :ok
  end

  def show
    render json: @user , status: :ok
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
    @user.update(set_params)
    render json: @user , status: :ok
  end

  def destroy
    @user.destroy
    render json: '' , status: :no_content
  end

  def not_checked_users
    @users = User.where(checked: false)
    render json: @users , status: :ok
  end

  def confirm_user
      if @user.update(checked: true)
        redirect_to api_v1_not_checked_users_path
        return
      else
        render json: @user.errors , status: :bad_request
        return
      end
      render json: 'Usuário não encontrado.' , status: :forbidden
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(:name,:email,:cpf,:birth,:password,:checked)
  end
end
