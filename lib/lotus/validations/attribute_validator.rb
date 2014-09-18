require 'lotus/validations/coercions'

class Range
  def size
    to_a.size
  end unless instance_methods.include?(:size)
end

module Lotus
  module Validations
    class AttributeValidator
      CONFIRMATION_TEMPLATE = '%{name}_confirmation'.freeze

      def initialize(validator, name, options)
        @validator, @name, @options = validator, name, options
        @value = @validator.__send__(@name)
      end

      def validate!
        presence
        acceptance

        _run_validations
      end

      private
      def presence
        _validate(__method__) { !blank_value? }
      end

      def acceptance
        _validate(__method__) { Lotus::Utils::Kernel.Boolean(@value) }
      end

      def format
        _validate(__method__) {|matcher| @value.to_s.match(matcher) }
      end

      def inclusion
        _validate(__method__) {|collection| collection.include?(@value) }
      end

      def exclusion
        _validate(__method__) {|collection| !collection.include?(@value) }
      end

      def confirmation
        _validate(__method__) do
          _attribute == _attribute(CONFIRMATION_TEMPLATE % { name: @name })
        end
      end

      def size
        _validate(__method__) do |validator|
          case validator
          when Numeric, ->(v) { v.respond_to?(:to_int) }
            @value.size == validator.to_int
          when Range
            validator.include?(@value.size)
          else
            raise ArgumentError.new("Size validator must be a number or a range, it was: #{ validator }")
          end
        end
      end

      def coerce
        _validate(:type) do |coercer|
          @value = Lotus::Validations::Coercions.coerce(coercer, @value)
          @validator.attributes[@name] = @value
          true
        end
      end

      def nil_value?
        @value.nil?
      end

      alias_method :skip?, :nil_value?

      def blank_value?
        nil_value? || (@value.respond_to?(:empty?) && @value.empty?)
      end

      def _run_validations
        return if skip?

        format
        coerce
        inclusion
        exclusion
        size
        confirmation
      end

      def _attribute(name = @name)
        @validator.attributes[name.to_sym]
      end

      def _validate(validation)
        if validator = @options[validation]
          condition = yield validator
          if condition && @value.respond_to?(:valid?)
            condition = @value.valid?
          end
          @validator.errors.add(@name, validation, @options.fetch(validation), @value) unless condition
        end
      end
    end
  end
end
