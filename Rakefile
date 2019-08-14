require 'erb'
require 'json'
require 'yaml'

require 'bundler/setup'

require 'tilt'

require_relative 'lib/course'
require_relative 'lib/rendering_context'
require_relative 'lib/scraper'

def erb(template_path, locals = {}, &block)
  template = Tilt.new(template_path, trim: '-')
  template.render(RenderingContext.new, locals, &block)
end

task :default => :build_html

task :build_html do
  courses = JSON.parse(File.read('data/courses.json')).map do |hash|
    Course.new(hash)
  end

  title = '高校数学標準講義'

  html = erb('views/layout.erb', title: title) do
    erb('views/index.erb', title: title, courses: courses)
  end

  File.write('index.html', html)
end

task :scrape => 'data/courses.json' do
  scraper = Scraper.new(courses_path: 'data/courses.json', durations_path: 'data/durations.json')
  scraper.run
end

file_create 'data/courses.json' => 'data/courses.yaml' do |t|
  File.write(t.name, JSON.pretty_generate(YAML.load_file(t.prerequisites.first)))
end
