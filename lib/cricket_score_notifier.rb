require 'cricket_score_notifier/version'
require 'terminal-notifier'
require 'httparty'

module CricketScoreNotifier
  def self.notify
    @live_matches = show_live_matches_tally
    match_choice = user_choice
    frequency    = user_match_update_frequency
    puts 'Cool. Now sit back and relax. Hit ctrl+c whenever you want to exit.'
    show_notifications(match_choice, frequency)
  end

  def self.show_live_matches_tally
    LiveMatchesFeedParser.live_matches
  end

  def self.user_choice
    puts 'No matches are going on currently' and return if @live_matches.empty?
    puts 'To get live notifications, please select a match from following list:'
    @live_matches.each_with_index do |match, index|
      puts "Press #{index} for:" + match['title']
    end
    gets.chomp.to_i
  end

  def self.user_match_update_frequency
    puts 'At what interval would like the score updates? (enter in seconds)'
    gets.chomp.to_i
  end

  def self.show_notifications(choice, frequency)
    loop do
      current_status, live_scores = fetch_live_scores(choice)
      unless current_status
        TerminalNotifier.notify('Match not started yet.', title: 'Current Status')
        break
      end
      Notification.display(current_status, live_scores)
      sleep frequency
    end
  end

  def self.fetch_live_scores(choice)
    match_url = @live_matches[choice]['guid'].gsub("html", "json")
    LiveScoresParser.live_score(match_url)
  end
end
