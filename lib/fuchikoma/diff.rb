require 'fuchikoma/diff/line_parser'

module Fuchikoma
  class Diff
    include Enumerable

    def initialize(diff = '')
      @gems = Hash.new { |h, k| h[k] = [] }
      @line_parser = LineParser.new

      diff.each_line do |line|
        push(line)
      end
    end

    def push(line)
      _, gem_name, version_number = @line_parser.parse(line)
      if gem_name && version_number
        @gems[gem_name] << version_number
      end
    end
    alias_method :<<, :push

    def each(&block)
      @gems.each do |gem_name, versions|
        yield(gem_name, versions) if block_given?
      end
    end
  end
end
