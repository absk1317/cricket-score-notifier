require "cricket_score_notifier/version"
require 'terminal-notifier'
require "httparty"

module CricketScoreNotifier

  def self.notify
    @live_matches = show_live_matches_tally
    choice = user_choice
    live_scores = fetch_live_scores(choice)
    show_notifications
  end

  def self.show_live_matches_tally
    LiveMatchesFeedParser.live_matches
  end

  def self.show_notifications
  end

  def  self.user_choice
    puts 'No matches are going on currently' and return if @live_matches.empty?
    puts 'To get live notifications, please select a match from following list:'
    @live_matches.each_with_index do |match, index|
      puts "Press #{index} for:" + match['title']
    end
    gets.chomp
  end

  def self.fetch_live_scores(choice)
    match_url = @live_matches[choice.to_i]['guid'].gsub("html", "json")
    LiveScoresParser.live_score(match_url)
  end
end
