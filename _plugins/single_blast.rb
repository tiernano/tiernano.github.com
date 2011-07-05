module Jekyll

  require 'mongo'

  module SingleBlast

    def should_blast?(post)
      unless record_exists?(post)
        if block_given?
          yield post
          write_record(post)
        end
        true
      else
        false
      end
    end

    def connection(post)
      @@db ||= post.site.config.has_key?('single_blast') ? Mongo::Connection.new(post.site.config['single_blast']['hostname'], post.site.config['single_blast']['port']).db(post.site.config['single_blast']['db_name']) : nil
      unless @@db.nil?
        @@db.authenticate(post.site.config['single_blast']['username'], post.site.config['single_blast']['password'])
      end
      @@db
    end

    def documents(post)
      @@docs ||= connection(post)['posts'].find().collect{ |row| row['post_id'] }
      @@docs
    end

    def record_exists?(post)
      !post.site.config.has_key?('single_blast') or documents(post).include?(post.id)
    end

    def write_record(post)
      db = connection(post)
      if db
        db['posts'].insert({'post_id' => post.id})
      end
    end

  end

end
