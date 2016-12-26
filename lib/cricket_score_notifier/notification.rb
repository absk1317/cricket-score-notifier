module CricketScoreNotifier
  class Notification
    class << self
      def display(status, message)
        TerminalNotifier.notify(status, title: 'Current Status')
        sleep 2
        TerminalNotifier.notify(message, title: 'Current Scores')
      end
    end
  end
end
