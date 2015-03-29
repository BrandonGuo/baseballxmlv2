json.array!(@players) do |player|
  json.extract! player, :id, :year, :surname, :given_name, :avg, :hr, :rbi, :runs, :sb, :ops
  json.url player_url(player, format: :json)
end
