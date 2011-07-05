module Jekyll

  module PostBitly

    require 'bitly'

    def shortened_url(post)
      c = post.site.config
      if c.has_key?('bitly') and c['bitly'].has_key?('username') and c['bitly'].has_key?('api_key')
        begin
          Bitly.use_api_version_3
          bitly = Bitly.new(post.site.config['bitly']['username'], post.site.config['bitly']['api_key'])
          if bitly
            return bitly.shorten(post.full_url).short_url
          end
        end
      end
      post.full_url
    end

  end

end
