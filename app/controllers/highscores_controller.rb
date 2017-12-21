class HighscoresController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @highscore = Highscore.new
  end

  def json
    @dict = []
    @highscore = Highscore.all
    @highscore.each do |f|
      @dict.push({username: f.username, game: f.game, mode: f.mode, action: f.action, aps: f.aps, date: f.created_at})
    end

    render json: @dict
  end

  def create
    @highscore = Highscore.new(highscore_params)

    if @highscore.save
      redirect_to highscores_path
    else render 'new'
    end
  end

  private
  def highscore_params
    puts params.inspect
    params.require(:highscore).permit(:username, :game, :mode, :action, :aps)
  end
end
