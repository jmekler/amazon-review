module AmazonReview
  class Review
                
    def initialize(html)
      @html = html
      @div = html.next_element.next_element
    end
    
    def inspect
      "<Review: id=#{id}>"
    end
    
    def id
      @id ||= @html['name']
    end
    
    def url   
      @url ||= "http://www.amazon.com/review/#{id}"
    end
    
    def user_id
      regex = /[A-Z0-9]+/
      @user_id ||= @div.css('a[href^="/gp/pdp/profile"]').first["href"][regex]
    end
    
    def title
      @title ||= @div.css("b").first.text.strip
    end
    
    def date
      @date ||= Date.parse(@div.css("nobr").first.text)
    end
    
    def text
      # remove leading and trailing line returns, tabs, and spaces
      @text ||= @div.css(".reviewText").first.content.strip #sub(/\A[\n\t\s]+/,"").sub(/[\n\t\s]+\Z/,"")
    end
    
    def rating
      regex = /[0-9\.]+/
      @rating ||= Float( @div.css("span.swSprite").first['title'][regex] )
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
      @helpful_match ||= @div.text.match(/(\d+) of (\d+) people/)
    end
  end

end