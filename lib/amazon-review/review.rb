module AmazonReview
  class Review
                
    def initialize(html)
      @html = html
    end
    
    def inspect
      "<Review: id=#{id}>"
    end
    
    def id
      @id ||= @html['id']
    end
    
    def url   
      @url ||= "http://www.amazon.com/review/#{id}"
    end
    
    def user_id
      regex = /[A-Z0-9]+/
      @user_id ||= @html.css('a[href^="/gp/pdp/profile"]').first["href"][regex]
    end

    def user_name
      @user_name ||= @html.css(".author").text
    end
    
    def title
      @text ||= @html.css(".review-title").text
    end
    
    def date
      @date ||= Date.parse(@html.css(".review-date").text)
    end
    
    def text
      @text ||= @html.css(".review-text").text
    end

    def rating
      @rating ||= Float(@html.css(".review-rating").first["class"][/[0-9]/])
    end
    
    def helpful_count
      if helpful_match
        @helpful_count ||= Float(helpful_match.captures[0])
      else
        @helpful_count = nil
      end
      
      @helpful_count
    end
    
    def helpful_ratio
      if helpful_match
        @helpful_ratio ||= Float(helpful_match.captures[0]) / Float(helpful_match.captures[1])
      else
        @helpful_ratio = nil
      end
      
      @helpful_ratio
    end
    
    def to_hash
      attrs = [:id, :url, :user_id, :title, :date, :text, :rating, :helpful_count, :helpful_ratio]
      attrs.inject({}) do |r,attr|
        r[attr] = self.send(attr)
        r
      end
    end
    
    private
    
    def helpful_match
      @helpful_match ||= @html.css(".review-votes").text.match(/(\d+) of (\d+) people/)
    end
  end

end