module CricketScoreNotifier
  class LiveMatchesFeedParser
    class << self
      def live_matches
        matches_from_feed = fetch_matches
      end

      private

      def fetch_matches
        feed_response = HTTParty.get('http://static.cricinfo.com/rss/livescores.xml')
        matches = feed_response.parsed_response['rss']['channel']['item']
      end
    end
  end
end
