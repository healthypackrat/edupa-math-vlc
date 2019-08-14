require_relative 'video'

class Chapter
  attr_reader :title, :slug, :videos

  def initialize(hash)
    @title = hash.fetch('title')
    @slug = hash.fetch('slug')
    @videos = hash.fetch('videos').map do |h|
      Video.new(h)
    end
  end

  def duration
    videos.map(&:duration).sum
  end
end
