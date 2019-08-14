require_relative 'chapter'

class Course
  attr_reader :title, :slug, :url, :chapters

  def initialize(hash)
    @title = hash.fetch('title')
    @slug = hash.fetch('slug')
    @url = hash.fetch('url')
    @chapters = hash.fetch('chapters').map.with_index(1) do |h, index|
      h['slug'] = "#{slug}-#{index}"
      Chapter.new(h)
    end
  end

  def duration
    chapters.map(&:duration).sum
  end
end
