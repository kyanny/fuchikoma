class Fuchikoma
  class DiffParser
    class LineParser
      attr_accessor :sign, :gem_name, :version_number

      REGEXP = /\A
               ([+-])     # sign
               \s*
               (\S+)      # gem_name
               \s*
               \(
                 ([\d.]+) # version_number
               \)
               \s*
             \z/x

      def parse(line)
        @sign, @gem_name, @version_number = REGEXP.match(line).captures
      rescue NoMethodError
      end

      def present?
        @gem_name && @version_number
      end

      def blank?
        !present?
      end
      alias_method :empty?, :blank?
    end
  end
end
