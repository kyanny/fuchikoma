require "fuchikoma/version"
require 'fuchikoma/diff'
require 'fuchikoma/gem'
require 'fuchikoma/compare'

module Fuchikoma
  def self.run(diff, &block)
    block ||= ->(compare) { puts compare.to_url }
    @retry = 0

    @diff = Fuchikoma::Diff.new(diff)
    @diff.each do |gem_name, versions|
      gem = Fuchikoma::Gem.new(gem_name, versions)
      begin
        compare = Fuchikoma::Compare.new(gem)
        block.call(compare)
        @retry = 0
      rescue
        next if @retry > 0
        gem = Fuchikoma::Gem.new(gem_name, versions, 'v')
        @retry += 1
        retry
      end
    end
  end
end
