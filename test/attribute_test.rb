require 'test_helper'

describe Lotus::Validations do
  describe '.attribute' do
    it 'coerces attribute names to symbols' do
      assert AttributeTest.defined_validation?(:attr)
    end

    it 'ensures attribute uniqueness' do
      assert UniquenessAttributeTest.defined_validation?(:attr)
    end

    it 'collects multiple errors for a single attribute' do
      validator = MultipleValidationsTest.new(email: 'test', email_confirmation: 'x')

      validator.valid?.must_equal false

      errors = validator.errors.for(:email)

      errors.must_include Lotus::Validations::Error.new(:format, /@/, 'test')
      errors.must_include Lotus::Validations::Error.new(:confirmation, true, 'test')

    end

    describe 'name checks' do
      it 'checks validation names' do
        exception = -> {
          Class.new {
            include Lotus::Validations
            attribute :email, pesence: true, comfirmation: true
          }
        }.must_raise ArgumentError

        exception.message.must_equal 'Unknown validation(s): pesence, comfirmation for "email" attribute'
      end
    end
  end

  describe '.defined_attributes' do
    it 'returns a set of unique attribute names' do
      UniquenessAttributeTest.defined_attributes.must_equal(Set.new(%w(attr)))
    end
  end
end
