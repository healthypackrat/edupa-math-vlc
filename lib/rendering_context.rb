require 'erb'

require_relative 'format_helper'

class RenderingContext
  include ERB::Util
  include FormatHelper
end
