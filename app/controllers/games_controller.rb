class GamesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :new, :create]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :correct_game, only: [:show, :edit, :update, :destroy]
  
  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end
  
  def create
    @game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = "ゲームを登録しました。"
      redirect_to games_url
    else
      flash.now[:danger] = "ゲームの登録に失敗しました。"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @game.update(game_params)
      flash[:success] = "ゲームを更新しました。"
      redirect_to games_url
    else
      flash.now[:danger] = "ゲームの更新に失敗しました。"
      render :edit
    end
  end
    
  private
  
  def game_params
    params.require(:game).permit(:name)
  end
  
  def set_game
    @game = Game.find(params[:id])
  end
  
  def correct_game
    redirect_to root_url if @game.user != current_user
  end
end
