class Api::V1::UsersController < ApplicationController
  before_action :mentor_or_admin_access, except: [:destroy]
  before_action :admin_access, only: [:destroy]

  def index
    @users = collection

    render json: @users
  end

  def show
    @user = resource

    render json: @user
  end

  def destroy
    @user.destroy
  end

  private

  def collection
    User.all
  end

  def resource
    collection.find(params[:id])
  end
end
