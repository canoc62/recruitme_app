class GameStatsController < ApplicationController
  before_action :set_game_stat_user
  before_action :set_game_stat, only: [:edit, :update]
  before_action :require_user
  before_action :same_user

  def new
    @game_stat = GameStat.new
  end

  def create
    @game_stat = GameStat.new(game_stat_params)
    @game_stat.user = current_user
   
    if @game_stat.save
      flash[:notice] = "Your statistics have been saved."
      redirect_to user_path(@game_stat.user)
    else
      flash[:error] = "Opponent, date, and year must be filled or selected."
      render :new
    end
  end

  def edit
    
  end

  def update

    if @game_stat.update(game_stat_params)
      flash[:notice] = "Your statistics have been updated."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Opponent, date, and year must be filled or selected."
      render :edit
    end   
  end

  private

  def game_stat_params
    params.require(:game_stat).permit(:game_stat_year, :date, :opponent, :pass_attempts, :pass_completions, :pass_yards, :pass_tds, :pass_int, :rush_attempts, :rush_yards, :rush_tds,
      :receptions, :receiving_yards, :receiving_tds, :fumbles, :fumbles_lost, :tackles, :sacks, :interceptions, :field_goal_attempts, :field_goals_made,
      :pat_attempts, :pat_made)
  end

  def set_game_stat
    @game_stat = GameStat.find(params[:id])
  end

  def set_game_stat_user
    @user = User.find(params[:user_id])
  end
end