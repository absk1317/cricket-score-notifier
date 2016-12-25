module CricketScoreNotifier
  class LiveScoresParser

    def self.live_score(match_url)
      match_details = HTTParty.get(match_url)
      teams = match_details
    end

  end
end
