class Video
  attr_reader :title, :path, :ftype, :server, :url, :duration

  def initialize(hash)
    @title = hash.fetch('title')
    @path = hash.fetch('path')
    @ftype = hash.fetch('ftype')
    @server = hash.fetch('server')
    @url = hash.fetch('url')
    @duration = hash.fetch('duration')
  end

  def vlc_url
    url.sub(/\Ahttp:/, 'vlc:')
  end
end
