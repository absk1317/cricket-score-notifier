require "cricket_score_notifier/version"
require 'terminal-notifier'

module CricketScoreNotifier

  def self.all_matches
    TerminalNotifier.notify('hello brother')
  end
end
