## Description
A simple gem to parse Amazon product reviews.

## Installation
```ruby
gem install amazon-review
```

Or if you're using Bundler,  add this line to your Gemfile:
```ruby
gem 'amazon-review'
```

## Usage
```ruby
require 'amazon-review'

# parse reviews for "The Ruby Programming Language" book by O'Reilly
# http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177
reviews = AmazonReview.find_reviews('0596516177')

# interact with data
r = reviews.first
r.url           #=> "http://www.amazon.com/review/RLJ78T9DWIPBD" 
r.title         #=> "This is the new authoritative Ruby book and the one to buy." 
r.text          #=> "Originally planned as a second edition to Ruby classic, Rub..."
r.rating        #=> 5.0
r.helpful_count #=> 128.0
r.helpful_ratio #=> 0.9624060150375939 
r.date          #=> <Date: 2008-02-26 ((2454523j,0s,0n),+0s,2299161j)> 
r.user_id       #=> "A2P9K69PISA1IO"
```
