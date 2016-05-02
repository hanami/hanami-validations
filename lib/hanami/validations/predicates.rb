require 'hanami/validations/predicate'
require 'hanami/validations/coercions'
require 'hanami/utils/blank'

module Hanami
  module Validations
    class UnknownPredicateError < ::StandardError
      def initialize(name)
        super("Unknown predicate: `#{ name }'")
      end
    end

    module Predicates
      def self.fabricate(name, predicate)
        case predicate
        when Predicate
          predicate
        when Proc
          Predicate.new(name, predicate)
        end
      end

      def self.register(name, predicate)
        registry[name] = fabricate(name, predicate)
      end

      # FIXME: make it private
      # FIXME: make it thread safe
      def self.registry
        @@registry ||= Hash[]
      end

      def self.predicate(name, predicates)
        registry.fetch(name) do
          predicates.fetch(name) do
            raise UnknownPredicateError.new(name)
          end
        end
      end

      class Nil < Predicate
        def initialize
          super(:nil, ->(attr) { attr.nil? })
        end
      end

      class Present < Predicate
        def initialize
          super(:present, ->(attr) { !Utils::Blank.blank?(attr) })
        end
      end

      class Include < Predicate
        def initialize
          super(:include, ->(attr, expected) { expected.include?(attr) })
        end
      end

      class Exclude < Predicate
        def initialize
          super(:exclude, ->(attr, expected) { !expected.include?(attr) })
        end
      end

      class Eql < Predicate
        def initialize
          super(:eql, ->(attr, expected) { attr == expected })
        end
      end

      class Empty < Predicate
        def initialize
          super(:empty, ->(attr) { attr.empty? })
        end
      end

      class Filled < Predicate
        def initialize
          super(:filled, ->(attr) { !attr.empty? })
        end
      end

      class Any < Predicate
        def initialize
          super(:any, ->(attr, &blk) {
            case attr
            when String
              result = false
              attr.each_char do |c|
                result = blk.call(c)
                break if result
              end

              result
            when ->(a) { a.respond_to?(:any?) }
              attr.any?(&blk)
            when ->(a) { a.respond_to?(:each) }
              result = false
              attr.each do |e|
                result = blk.call(e)
                return result if result
              end

              result
            else
              raise NoMethodError.new("undefined method `any?' for #{ attr.inspect }:#{ attr.class }")
            end
          })
        end
      end

      class All < Predicate
        def initialize
          super(:all, ->(attr, &blk) {
            case attr
            when String
              result = false
              attr.each_char do |c|
                result = blk.call(c)
                break unless result
              end

              result
            when ->(a) { a.respond_to?(:all?) }
              return false if attr.empty?
              attr.all?(&blk)
            when ->(a) { a.respond_to?(:each) }
              result = false
              attr.each do |e|
                result = blk.call(e)
                return result unless result
              end

              result
            else
              raise NoMethodError.new("undefined method `all?' for #{ attr.inspect }:#{ attr.class }")
            end
          })
        end
      end

      class Gt < Predicate
        def initialize
          super(:gt, ->(attr, expected) { attr > expected })
        end
      end

      class Gteq < Predicate
        def initialize
          super(:gteq, ->(attr, expected) { attr >= expected })
        end
      end

      class Lt < Predicate
        def initialize
          super(:lt, ->(attr, expected) { attr < expected })
        end
      end

      class Lteq < Predicate
        def initialize
          super(:lteq, ->(attr, expected) { attr <= expected })
        end
      end

      class Size < Predicate
        def initialize
          super(:size, ->(attr, expected) {
            case expected
            when Range
              expected.include?(size(attr))
            else
              size(attr) == expected
            end
          })
        end

        protected

        def size(attr)
          case attr
          when String
            attr.bytesize
          else
            attr.size
          end
        end
      end

      class Format < Predicate
        def initialize
          super(:format, ->(attr, matcher) { attr.match(matcher) })
        end
      end

      class Type < Predicate
        def initialize
          super(:type, ->(attr, type) { Coercions.coerce(type, attr) })
        end
      end

      class Accepted < Predicate
        def initialize
          super(:accepted, ->(attr) { Coercions.coerce(Boolean, attr).value })
        end
      end

      class Confirmed < Predicate
        def initialize
          super(:confirmed, ->(attr, confirmation) { attr == confirmation })
        end
      end

      register(:accepted?,  Accepted.new)
      register(:all?,       All.new)
      register(:any?,       Any.new)
      register(:confirmed?, Confirmed.new)
      register(:empty?,     Empty.new)
      register(:eql?,       Eql.new)
      register(:exclude?,   Exclude.new)
      register(:filled?,    Filled.new)
      register(:format?,    Format.new)
      register(:gt?,        Gt.new)
      register(:gteq?,      Gteq.new)
      register(:include?,   Include.new)
      register(:lt?,        Lt.new)
      register(:lteq?,      Lteq.new)
      register(:nil?,       Nil.new)
      register(:present?,   Present.new)
      register(:size?,      Size.new)
      register(:type?,      Type.new)
    end
  end
end
