class UrlParser

# with all parts do
    def initialize(new_url)
        @url = new_url
        # @path = path
    end

    def scheme
      @url.split(":").first

    end

    def domain
      @url.split("//")[1].split(":").first
    end

    def port
      port = @url.split(":")[2]
      if port == nil && scheme == "https"
        "443"
      elsif port== nil && scheme == "http"
        "80"
      else
        port.split("/").first
      end
    end
# first this goes to the blank spot if blank and scheme http it gives 80 if
# its https it gives 443
    def path
      # if @url.split("/")[3].split("?")[0]
        path = @url.split("/")[3].split("?")[0]
        if path == ""
          nil
        else
          path
        end
      # else no_path = @url.split("/")[3].split("?")[0]
    end

# Here you keep splitting but the charcter thats different then choose the
# new array you want by selecting its position [0,1] in the array. Then have to
# do a map do in order to split last two nested arrays to a hash
    def query_string
      new_query = @url.split("?")[1].split("#")[0].split("&").map do |i|
         i.split("=")
       end
      new_query.to_h
      # hash={"key" => "cat", "name" => "Tim"}
#.to_h  only takes one key and overites
 # the other
    end

    def fragment_id
      @url.split("#")[1]
    end

  end
