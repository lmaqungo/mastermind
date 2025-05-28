# Mastermind
This is a console app implementation of the popular board game, Mastermind, made in Ruby with love

## Installation
1. Make a local copy of the repo
```bash
git clone git@github.com:lmaqungo/mastermind.git
```
2. Navigate to the root of the project and install dependencies
```bash
bundle install
```
## Usage
1. Run the main program
```bash
bundle exec ruby main.rb
```
2. You will be presented with the option to play as the code breaker or the code maker. As code breaker, you are given 8 rounds to try figure out the randomly generated color sequence. As code maker, you can make a 4 color sequence that the computer will algorithmically solve. 

## FYI
- There are 6 possible colors a marker can be: red, green, blue, yellow, magenta, and cyan
- Each time you make an input for a sequence, provide a single space separated list using the full color names, for example: 
```
Enter a guess: red red cyan blue
```