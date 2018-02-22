class ToppagesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @kakins = current_user.kakins
  end
  
  def search
    if params[:search][:game_id].blank?
      @kakins = current_user.kakins
    else
      @kakins = current_user.kakins.where(game_id: params[:search][:game_id])
    end
    render :index
  end
end
