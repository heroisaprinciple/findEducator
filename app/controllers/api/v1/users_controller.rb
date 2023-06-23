class Api::V1::UsersController < ApplicationController
  before_action :set_user
  before_action :access

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
