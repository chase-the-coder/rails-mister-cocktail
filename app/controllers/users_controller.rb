# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: :update

  def show
    @cocktail = Cocktail.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :photo)
  end
end
