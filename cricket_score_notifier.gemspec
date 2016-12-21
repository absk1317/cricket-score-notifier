# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cricket_score_notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "cricket_score_notifier"
  spec.version       = CricketScoreNotifier::VERSION
  spec.authors       = ["abhishek verma", "rohit patel"]
  spec.email         = ["absk1317@gmail.com", "rohit.patel061@gmail.com"]

  spec.summary       = "Provides a realtime notification of ongoing cricket matches."
  spec.homepage      = "https://github.com/absk1317/cricket-score-notifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  #spec.bindir        = "exe"
  spec.executables   = ['cricket_score_notifier']#spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-notifier", "~> 1.7"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
