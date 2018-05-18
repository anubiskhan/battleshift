class ApiController < ActionController::API
  def current_game
    current_game_id = params[:game_id] || params[:id]
    @current_game ||= Game.find(current_game_id)
  end

  def current_player
    @current_player ||= case request.headers['X-API-KEY']
                        when current_game.player_1.api_key then current_game.player_1
                        when current_game.player_2.api_key then current_game.player_2
                        end
  end
end
