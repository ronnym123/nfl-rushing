class PlayersController < ApplicationController
    def index
        search_players if params[:search]
        respond_to do |format|
            format.html do
                retrieve_players
            end 
            format.csv do
                csv = generate_csv
                send_data(csv, filename: "players.csv")
            end    
        end    
   
    end   

    def show
        @player = Player.find(params[:id])
    end

    private

    def generate_csv
        CSV.generate do |csv|
            csv << ["Name", "Team", "Pos", "Att", "Att/G", "Yds", "Avg", "Yds/G", "TD", "Lng", "1st", "1st%", "20+", "40+", "FUM"] 
            retrieve_players
            @players.each do |player|
                csv << [
                    player.name,
                    player.team,
                    player.position,
                    player.attempts,
                    player.attempts_per_game,
                    player.yards,
                    player.yards_per_attempt,
                    player.yards_per_game,
                    player.touchdowns,
                    player.longest_rush,
                    player.first_downs,
                    player.first_down_percentage,
                    player.twenty_yards,
                    player.forty_yards,
                    player.fumbles
                ]
            end    
        end    
    end

    def search_players
        if @player = Player.all.find{|player| player.name.include?(params[:search])}
          redirect_to player_path(@player)
        end
    end

    def retrieve_players
        if params[:sort] == "yards"
            @players = Player.all.sort_by{|player| player.yards}
        elsif params[:sort] == "touchdowns"
            @players = Player.all.sort_by{|player| player.touchdowns}
        elsif params[:sort] == "lng"
            @players = Player.all.sort_by{|player| player.longest_rush}    
        else
            @players = Player.all
        end
    end 
end
