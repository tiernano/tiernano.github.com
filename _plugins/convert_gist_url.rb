module Jekyll

  class ConvertGistUrl < PostFilter

    def post_render(post)
      link_regex = Regexp.new '[^\'"](https?\://gist.github.com/)([0-9]+)[^\.]'
      matches = post.content.scan(link_regex)
      if !matches.empty?
        post.content.sub!(matches[0].join, '<script src="https://gist.github.com/' + matches[0][1] + '.js"> </script>')
      end
    end

  end

end
