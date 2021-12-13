require "json"

json_string = File.read(File.join(__dir__, "rushing.json"))
players = JSON.parse(json_string)
Player.transaction do
    players.each do |player|
        Player.create!(
            name: player["Player"],
            team: player["Team"],
            position: player["Pos"],
            attempts: player["Att"],
            attempts_per_game: player["Att/G"],
            yards: player["Yds"],
            yards_per_attempt: player["Avg"],
            yards_per_game: player["Yds/G"],
            touchdowns: player["TD"],
            longest_rush: player["Lng"],
            first_downs: player["1st"],
            first_down_percentage: player["1st%"],
            twenty_yards: player["20+"],
            forty_yards: player["40+"],
            fumbles: player["FUM"] 
        )
    end    
end   
