require 'rubygems'

class Fuchikoma
  class Gem
    attr_accessor :name, :old_version, :new_version, :tag_prefx

    def initialize(name, versions, tag_prefx = 'v')
      @name = name
      @old_version, @new_version = versions.sort_by { |version|
        ::Gem::Version.new(version)
      }
      @tag_prefx = tag_prefx
    end

    def homepage
      ::Gem::Specification.find_by_name(@name).homepage.to_s.sub(/\Ahttps?/, 'https')
    end

    def tag_prefx
      @tag_prefx
    end
  end
end
