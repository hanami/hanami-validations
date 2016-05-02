module Hanami
  module Validations
    module Prefix
      SEPARATOR = '.'.freeze

      def self.join(prefix, key)
        [prefix, key].compact.join(SEPARATOR).to_sym
      end

      def self.split(key)
        key.to_s.split(SEPARATOR).map!(&:to_sym)
      end
    end
  end
end
