module CricketScoreNotifier
  class Notification

    attr_accessor :title, :message

    def initialize(title, message)
      self.title = title
      self.message= message
    end

  end
end
