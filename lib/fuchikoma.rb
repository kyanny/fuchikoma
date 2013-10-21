require "fuchikoma/version"
require 'fuchikoma/diff_parser'
require 'fuchikoma/gem'
require 'fuchikoma/compare'

class Fuchikoma
  def initialize(diff)
    @retry = 0

    @diff_parser = Fuchikoma::DiffParser.new(diff)
    @diff = @diff_parser.diff
  end

  def to_s
    @diff.map do |gem|
      compare = Fuchikoma::Compare.new(gem)
      compare.to_url
    end
  end
end
