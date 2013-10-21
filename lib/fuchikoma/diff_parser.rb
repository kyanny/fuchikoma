require 'fuchikoma/diff'
require 'fuchikoma/diff_parser/line_parser'

class Fuchikoma
  class DiffParser
    attr_accessor :diff

    def initialize(diff = '')
      @diff = Diff.new(diff)

      @line_parser = LineParser.new

      diff.each_line do |line|
        parse_line(line)
      end
    end

    def parse_line(line)
      _, gem_name, version_number = @line_parser.parse(line)
      if gem_name && version_number
        @diff.push gem_name, version_number
      end
    end
  end
end
