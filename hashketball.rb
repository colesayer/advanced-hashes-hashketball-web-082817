# Write your code here!
require "pry"

def game_hash
  bask_hash = {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:{
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:{
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(name)
game_hash.each do |location, all_team_data|
  all_team_data[:players].each do |player_name, player_stats|
    return player_stats[:points] if name == player_name
  end
end
end

def shoe_size(name)
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player_name, player_stats|
      return player_stats[:shoe] if name == player_name
    end
  end
end

def team_colors(team)
  game_hash.each do |location, all_team_data|
    return all_team_data[:colors] if all_team_data[:team_name] == team
  end
end

def team_names
  team_name_array = []
  game_hash.each do |location, all_team_data|
    team_name_array << all_team_data[:team_name]
  end
  team_name_array
end

def player_numbers(team)
  player_numbers_array = []
  game_hash.each do |location, all_team_data|
    if all_team_data[:team_name] == team
      all_team_data[:players].each do |player, player_stats|
        player_numbers_array << player_stats[:number]
      end
    end
  end
  player_numbers_array
end

def player_stats(name)
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      return player_stats if player == name
    end
  end
end

def big_shoe_rebounds
  max_shoe_size = []
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      max_shoe_size << player_stats[:shoe] if max_shoe_size.length == 0
      max_shoe_size << player_stats[:shoe] if max_shoe_size[-1] <= player_stats[:shoe]
    end
  end
  shoe_value = max_shoe_size[-1]
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      return player_stats[:rebounds] if player_stats[:shoe] == shoe_value
    end
  end
end

def most_points_scored
  max_points_array = []
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      max_points_array << player_stats[:points] if max_points_array.length == 0
      max_points_array << player_stats[:points] if max_points_array[-1] <= player_stats[:points]
    end
  end
  most_points = max_points_array[-1]
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      return player if player_stats[:points] == most_points
    end
  end
end

def winning_team
  point_total1 = game_hash[:home][:players].collect {|k, v| v[:points]}
  point_total2 = game_hash[:away][:players].collect {|k, v| v[:points]}
  point_total1_sum = point_total1.inject(0){|sum,x| sum + x}
  point_total2_sum = point_total2.inject(0){|sum,x| sum + x}
  return game_hash[:home][:team_name] if point_total1_sum > point_total2_sum
  return game_hash[:away][:team_name] if point_total1_sum < point_total2_sum
end

def player_with_longest_name
  names = []
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_data|
      names << player
  end
  end
  names.max_by(&:length)
end

def player_with_most_steals
  max_steals_array = []
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      max_steals_array << player_stats[:steals] if max_steals_array.length == 0
      max_steals_array << player_stats[:steals] if max_steals_array[-1] <= player_stats[:steals]
    end
  end
  most_steals = max_steals_array[-1]
  game_hash.each do |location, all_team_data|
    all_team_data[:players].each do |player, player_stats|
      return player if player_stats[:steals] == most_steals
    end
  end
end

def long_name_steals_a_ton?
  player_with_longest_name == player_with_most_steals
end
