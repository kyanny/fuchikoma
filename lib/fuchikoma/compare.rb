require 'net/https'
require 'uri'

module Fuchikoma
  class Compare
    attr_accessor :gem

    def initialize(gem)
      @gem = gem
    end

    def to_url
      "#{gem.homepage}/compare/#{gem.tag_prefx}#{gem.old_version}...#{gem.tag_prefx}#{gem.new_version}"
    end
  end
end
