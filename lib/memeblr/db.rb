require 'pry'

module Memeblr

  class DB

    attr_reader :memes, :next_meme_id, :admins, :next_admin_id
    def initialize
      @memes = {}
      @next_meme_id = 0
      @admins = {}
      @next_admin_id = 0
    end

    #MEME-create meme
    def create_meme(data)
      @next_meme_id += 1
      data[:id] = @next_meme_id
      @memes[@next_meme_id] = data
      build_meme(data)
    end

    #MEME - retrieve meme
    def get_meme(id)
      data = @memes[id]
      build_meme(data)
    end

    #MEME - update meme
    def update_meme(id, data)
      @memes[id].merge!(data)
      build_meme(@memes[id])
    end

    #MEME -delete meme
    def delete_meme(id)
      @memes.delete(id)
    end

    #Admin-create admin
    def create_admin(data)
      @next_admin_id += 1
      data[:id] = @next_admin_id
      @admins[@next_admin_id] = data
      build_admin(data)
    end

    #MEME - retrieve meme
    def get_meme(id)
      data = @admins[id]
      build_admin(data)
    end

    #MEME - update meme
    def update_meme(id, data)
      @admins[id].merge!(data)
      build_admin(@admins[id])
    end

    #MEME -delete meme
    def delete_meme(id)
      @admins.delete(id)
    end

  end
end
