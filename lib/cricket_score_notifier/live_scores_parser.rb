module CricketScoreNotifier
  class LiveScoresParser
    class << self
      def live_score(match_url)
        match_details    = HTTParty.get(match_url)
        scores           = {}
        if match_details['live']['innings'].empty?
          return false, scores
        end
        current_innings  = match_details['live']['innings']
        current_status   = match_details['live']['status']
        team1_id         = match_details['innings'][0]['batting_team_id']
        team2_id         = match_details['innings'][0]['bowling_team_id']
        team1            = find_team_name(match_details['team'], team1_id)
        team2            = find_team_name(match_details['team'], team2_id)
        scores[team1]    = fetch_team_score(match_details['innings'], team1_id)
        scores[team2]    = fetch_team_score(match_details['innings'], team2_id)
        return current_status, scores
      end

      private

      def find_team_name(both_teams, team_id)
        both_teams.select do |teams|
          teams['team_id'] == team_id
        end.first['team_abbreviation']
      end

      def fetch_team_score(all_innings, team_id)
        result = []
        all_innings.select do |innings|
          innings['batting_team_id'] == team_id
        end.map do |hash|
          hash.select do |key, value|
            ['runs', 'wickets', 'live_current'].include? key
          end
        end.each do |innings|
          string = innings['runs'] + '/' + innings['wickets']
          string << '*' if innings['live_current'] == '1'
          result.push(string)
        end
        result
      end
    end
  end
end
