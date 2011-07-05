module Jekyll

  class PostMetaweblog < PostFilter

    require_relative 'single_blast'

    include SingleBlast

    require 'xmlrpc/client'

    def post_write(post)
      should_blast?(post) do
        c = post.site.config
        if c.has_key?('metaweblog') and c['metaweblog'].has_key?('domain') and c['metaweblog'].has_key?('endpoint') and c['metaweblog'].has_key?('blog_id') and c['metaweblog'].has_key?('username')
          begin
            #Setup the content hash
            content = {}
            content[:title] = post.data['title']
            content[:description] = post.content

            server = XMLRPC::Client.new(c['metaweblog']['domain'], c['metaweblog']['endpoint'])
            result = server.call('metaWeblog.newPost', c['metaweblog']['blog_id'].to_s, c['metaweblog']['username'], c['metaweblog']['password'], content, true)
          rescue XMLRPC::FaultException => e
            puts "Error posting with metaweblog"
            p e
          end
        end
      end
    end
  end

end
