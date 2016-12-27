require 'cricket_score_notifier/version'
require 'terminal-notifier'
require 'httparty'

module CricketScoreNotifier
  class << self
    def notify
      @live_matches = show_live_matches_tally
      match_choice = user_choice
      frequency    = user_match_update_frequency
      puts 'Cool. Now sit back and relax. Hit ctrl+c whenever you want to exit.'
      show_notifications(match_choice, frequency)
    end

    def show_live_matches_tally
      LiveMatchesFeedParser.live_matches
    end

    def user_choice
      puts 'No matches are going on currently' and return if @live_matches.empty?
      puts 'To get live notifications, please select a match from following list:'
      @live_matches.each_with_index do |match, index|
        puts "Press #{index} for:" + match['title']
      end
      gets.chomp.to_i
    end

    def user_match_update_frequency
      puts 'At what interval would like the score updates? (enter in seconds)'
      gets.chomp.to_i
    end

    def show_notifications(choice, frequency)
      loop do
        @match_status, @live_scores = fetch_live_scores(choice)
        unless @match_status
          TerminalNotifier.notify('Match not started yet.', title: 'Current Status')
          break
        end
        show_score_notification
        sleep 2
        show_status_notification
        sleep frequency
      end
    end

    def fetch_live_scores(choice)
      match_url = @live_matches[choice]['guid'].gsub("html", "json")
      LiveScoresParser.live_score(match_url)
    end

    private

    def show_score_notification
      notification = Notification.new(nil, @live_scores)
      TerminalNotifier.notify(notification.score_message, title: notification.score_title)
    end

    def show_status_notification
      notification = Notification.new('Current Status', @match_status)
      TerminalNotifier.notify(notification.message, title: notification.title)
    end
  end
end
