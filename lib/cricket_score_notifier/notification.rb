module CricketScoreNotifier
  class Notification
    attr_accessor :title, :message

    def initialize(title , message)
      self.title = title
      self.message = message
    end

    def score_message
      innings_score = message.values
      innings_score[0].zip(*innings_score[1..-1]).map do |innings_score|
        innings_score.join("           ")
      end.join("\n")
    end

    def score_title
      message.keys.join("   v/s   ")
    end
  end
end
