class Fuchikoma
  class Diff
    include Enumerable

    def initialize(diff = '')
      @diff = diff
      @gems = Hash.new { |h, k| h[k] = [] }
    end

    def push(gem_name, version_number)
      @gems[gem_name] << version_number
    end
    alias_method :<<, :push

    def to_s
      @diff
    end

    def each(&block)
      @gems.each do |gem_name, versions|
        gem = Fuchikoma::Gem.new(gem_name, versions)
        yield(gem) if block_given?
      end
    end
  end
end
