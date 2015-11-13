class GameStatsController < ApplicationController
  before_action :set_game_stat, only: [:edit, :update]

  def new
    
    @user = User.find(params[:user_id])
    @game_stat = GameStat.new
    #@user = current_user#, putting @user in _user_game_stats.html.erb still breaks, just put current_user directly in form.
  end

  def create
    @game_stat = GameStat.new(game_stat_params)
    @game_stat.user = current_user 
    #@game_stat.user = User.find(params[:user_id])
    if @game_stat.save
      flash[:notice] = "Your statistics have been saved."
      redirect_to user_path(@game_stat.user)
    else
      flash[:error] = "There was an error in the submission."
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update

    if @game_stat.update(game_stat_params)
      flash[:notice] = "Your statistics have been updated."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error in the submission."
    end   
  end

  private

  def game_stat_params
    #params.require(:game_stat).permit!
    params.require(:game_stat).permit(:game_stat_year, :date, :opponent, :pass_attempts, :pass_completions, :pass_yards, :pass_tds, :pass_int, :rush_attempts, :rush_yards, :rush_tds,
      :receptions, :receiving_yards, :receiving_tds, :fumbles, :fumbles_lost, :tackles, :sacks, :interceptions, :field_goal_attempts, :field_goals_made,
      :pat_attempts, :pat_made)
  end

  def set_game_stat
    @game_stat = GameStat.find(params[:id])
  end
end