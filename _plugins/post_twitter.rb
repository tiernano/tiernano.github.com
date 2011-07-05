module Jekyll

  class PostTwitter < PostFilter

    require_relative 'post_bitly'
    require_relative 'single_blast'

    include PostBitly
    include SingleBlast

    require 'twitter'

    def post_write(post)
      should_blast?(post) do
        c = post.site.config
        if c.has_key?('twitter') and c['twitter'].has_key?('consumer_key') and c['twitter'].has_key?('consumer_secret') and c['twitter'].has_key?('oauth_token') and c['twitter'].has_key?('oauth_token_secret')
          begin
            Twitter.configure do |config|
              config.consumer_key = c['twitter']['consumer_key']
              config.consumer_secret = c['twitter']['consumer_secret']
              config.oauth_token = c['twitter']['oauth_token']
              config.oauth_token_secret = c['twitter']['oauth_token_secret']
            end

            #Grab the bitly URL
            url = self.shortened_url(post)

            #Make a title string
            title = 'Post: ' + post.data['title']

            #Shrink it so it's twitter friendly
            msg = truncate(title, 140 - url.size - 3) + " - " + url

            #Blast it to the world
            client = Twitter::Client.new
            client.update(msg)
          rescue Twitter::Forbidden
            puts "Twitter updated failed: continuing..."
          end
        end
      end
    end

    #Thanks rails!
    def truncate(text, length, options = {})
      options[:omission] ||= "..."

      length_with_room_for_omission = length - options[:omission].length
      chars = text
      stop = options[:separator] ?
        (chars.rindex(options[:separator], length_with_room_for_omission) || length_with_room_for_omission) : length_with_room_for_omission

      (chars.length > length ? chars[0...stop] + options[:omission] : text).to_s
    end
    

  end

end
