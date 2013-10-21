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
      @line_parser.parse(line)
      if @line_parser.present?
        @diff.push @line_parser.gem_name, @line_parser.version_number
      end
    end
  end
end
