Gem::Specification.new do |s|
  s.name        = 'amazon-review'
  s.version     = '0.0.0'
  s.date        = '2014-04-12'
  s.summary     = "A simple gem to parse Amazon product reviews"
  s.description = "A simple gem to parse Amazon product reviews"
  s.authors     = ["Jeff Mekler"]
  s.email       = 'me@jeffmekler.com'
  s.files       = ["lib/amazon-review.rb"]
  s.homepage    =
    'http://rubygems.org/gems/amazon-review'
  s.license       = 'MIT'
  
  s.add_runtime_dependency "nokogiri", ["> 1.5.6"]
end