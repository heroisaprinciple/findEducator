# class UsersController < ApplicationController
#   # before_action :authenticate_user!
#   # before_action :is_admin?
#
#   # GET /users
#   def index
#     @users = User.all
#
#     render json: @users
#   end
#
#   # GET /users/1
#   def show
#     render json: @user
#   end
#
#   # POST /users
#   def create
#     @user = User.new(user_params)
#
#     if @user.save
#       render json: @user, status: :created
#     else
#       render json: @user.errors, status: :unprocessable_entity
#     end
#   end
#
#   # PATCH/PUT /users/1
#   def update
#     if @user.update(user_params)
#       render json: @user
#     else
#       render json: @user.errors, status: :unprocessable_entity
#     end
#   end
#
#   # DELETE /users/1
#   def destroy
#     @user.destroy
#   end
#
#   private
#   def is_admin?
#     return if current_user&.admin?
#
#     respond_to do |format|
#       format.json { render json: { error: 'You are not authorized to access this page.' }, status: :unauthorized }
#     end
#   end
#
# end
