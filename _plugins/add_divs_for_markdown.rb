module Jekyll

  class AddDivsForMarkdown < PostFilter

    def pre_render(post)
      reg = /{% highlight(.+?)%}(.*?){% endhighlight %}/m
      post.content.gsub!(reg, "<!-- code here --><div>{% highlight\\1%}\n\\2\n{% endhighlight %}</div><!-- code here -->")
    end

    def post_conversion(post)
      post.content.gsub!(/<p>\n?&lt;!-- code here --&gt;/m, '')
      post.content.gsub!(/&lt;!-- code here --&gt;\n?<\/p>/m, '')
      post.content.gsub!(/<\/p>\n+?<p>/, '<br /><br />')
    end

  end

end
