class KakinsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  before_action :set_kakin, only: [:show, :edit, :update, :destroy]
  before_action :correct_kakin, only: [:show, :edit, :update, :destroy]
  
  def new
    redirect_to root_url if !current_user.games.any?
    @kakin = Kakin.new
  end
  
  def create
    @kakin = current_user.kakins.build(kakin_params)
    if @kakin.save
      flash[:success] = "課金しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "課金に失敗しました。"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @kakin.update(kakin_params)
      flash[:success] = "課金を更新しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "課金の更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @kakin.destroy
    flash[:success] = "課金を削除しました。"
    redirect_to root_url
  end
    
  private
  
  def kakin_params
    params.require(:kakin).permit(:date, :amount, :game_id, :comment)
  end
  
  def set_kakin
    @kakin = Kakin.find(params[:id])
  end
  
  def correct_kakin
    redirect_to root_url if @kakin.user != current_user
  end
end
