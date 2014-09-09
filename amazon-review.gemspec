Gem::Specification.new do |s|
  s.name        = 'amazon-review'
  s.version     = '0.0.1'
  s.date        = '2014-09-09'
  s.summary     = "A simple gem to parse Amazon product reviews"
  s.description = "A simple gem to parse Amazon product reviews"
  s.authors     = ["Jeff Mekler"]
  s.email       = 'contact@jeffmekler.com'
  s.files       = ["lib/amazon-review.rb", "lib/amazon-review/review.rb"]
  s.homepage    =
    'http://rubygems.org/gems/amazon-review'
  s.license       = 'MIT'
  
  s.add_runtime_dependency "nokogiri", ["> 1.5.6"]
end