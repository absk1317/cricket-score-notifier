require 'pry'
module CricketScoreNotifier
  class Notification
    attr_accessor :title, :message

    def initialize(title , message)
      self.title = title
      self.message = message
    end

    def score_message
      message.values.transpose.map do |innings_score|
        innings_score.join("           ")
      end.join("\n")
    end

    def score_title
      message.keys.join("   v/s   ")
    end
  end
end
