require 'nokogiri'
require 'open-uri'

module AmazonReview

  def self.find_reviews(asin)
    reviews = []
    delay = 0.5
    page = 1
    
    # iterate through the pages of reviews

    begin
      url = "http://www.amazon.com/product-reviews/#{asin}/?ie=UTF8&showViewpoints=0&pageNumber=#{page}&sortBy=bySubmissionDateAscending"
      doc = Nokogiri::HTML(open(url))
      
      # parse each review
      new_reviews = 0
      doc.css("#productReviews td > a[name]").each do |review_html|
        reviews << Review.new(review_html)
        new_reviews += 1
      end       
      # go to next page
      page += 1
      
      # delay to prevent 503 errors
      delay = [0, delay - 0.1].max # decrease delay
      sleep delay
      
    rescue Exception => e # error while parsing (likely a 503)      
      delay += 0.5 # increase delay
    
    end until new_reviews == 0
    
    reviews  
  end

end

require_relative "amazon-review/review"