class Fuchikoma
  class DiffParser
    class LineParser
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
        REGEXP.match(line).captures
      rescue NoMethodError
      end
    end
  end
end
