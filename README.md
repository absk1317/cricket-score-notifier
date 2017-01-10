# CricketScoreNotifier
[![Build Status](https://api.travis-ci.org/absk1317/cricket-score-notifier.svg?branch=master)](http://travis-ci.org/absk1317/cricket-score-notifier)

CricketScoreNotifier is a gem which answers the following question:

Wouldn't it be cool to get desktop notifications of live cricket scores?

CricketScoreNotifier answer this questions, by providing live score notifications right on your desktop with an interval and match of your choice.

To get started please follow below steps:


## Installation

    $ gem install cricket_score_notifier

## Usage

    $ cricket_score_notifier
    
CricketScoreNotifier will prompt you with a list of ongoing matches e.g.

    To get live notifications, please select a match from following list:
    Press 0 for:Hyderabad (India) 280/10 &  201/10 * v Mumbai 294/10 &  217/10
    Press 1 for:Gujarat 623/9 &  263/10 * v Odisha 199/10
    Press 2 for:Australia v Pakistan 310/6 *
    Press 3 for:Lankan Cricket Club 428/10  v Kalutara Physical Culture Club 22/2 *
    Press 4 for:South Africa 267/6 * v Sri Lanka
    Press 5 for:Brisbane Heat Women 129/5  v Melbourne Stars Women 124/6 *
    Press 6 for:Sydney Thunder Women 96/2 * v Melbourne Renegades Women 93/6
    Press 7 for:Dhaka Metropolis 155/5 * v Barisal Division
    Press 8 for:Khulna Division v Dhaka Division 113/2 *
    Press 9 for:Rajshahi Division v Chittagong Division 107/4 *
    Press 10 for:Rangpur Division v Sylhet Division 83/4 *
    Press 11 for:Adelaide Strikers Women v Hobart Hurricanes Women
    Press 12 for:Sydney Sixers v Perth Scorchers
    
Input your match choice for which you want live notifications.

After selecting a match CricketScoreNotifier will ask you for an updates frequency input i.e the time interval at which you want CricketScoreNotifier to provide you desktop notifications. Something like this:

    $ At what interval would like the score updates? (enter in seconds)

Input the frequency in seconds format and you're all set, you will start recieving notifications in the below format:

Live Scores:

![alt tag](https://github.com/absk1317/cricket-score-notifier/blob/master/images/live_score.png)

Followed by current match status:

![alt tag](https://github.com/absk1317/cricket-score-notifier/blob/master/images/current_status.png)

Now you don't need to repeatedly go to your browser tab for checking cricket scores anymore as you can have live updates right on the desktop itself.

Any suggestions/features/ideas are most welcome!

## Credits
   Cricinfo for their awesome [APIs](http://www.espncricinfo.com/).

## Contributors
   The current core team consists of:
   * [Abhishek Verma](https://github.com/absk1317)
   * [Rohit Patel](https://github.com/rohitcy)

 
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/absk1317/cricket_score_notifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

