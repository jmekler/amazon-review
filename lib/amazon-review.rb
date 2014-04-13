require 'nokogiri'
require 'open-uri'

module AmazonReview

  def self.find_reviews(asin)
    reviews = []
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
      
      page += 1
    end until new_reviews == 0
    
    reviews  
  end

end

require_relative "amazon-review/review"