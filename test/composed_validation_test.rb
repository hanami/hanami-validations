require 'test_helper'

describe Lotus::Validations do
  describe 'composable' do
    describe 'without extra validations' do
      it 'is not valid if included attributes are not valid' do
        validator = ComposedValidationsTest.new({})

        validator.valid?.must_equal false
      end

      it 'is valid if included attributes are valid' do
        validator = ComposedValidationsTest.new(email: '@')

        validator.valid?.must_equal true
      end
    end

    describe 'with extra validations' do
      it 'is not valid if no attributes are valid' do
        validator = ComposedValidationsWithExtraAttributesTest.new({})

        validator.valid?.must_equal false
        errors = validator.errors
        errors.for(:name).wont_be_empty
        errors.for(:email).wont_be_empty
      end

      it 'is not valid if included attributes are not valid' do
        validator = ComposedValidationsWithExtraAttributesTest.new(name: 'L')

        validator.valid?.must_equal false
        errors = validator.errors
        errors.for(:name).must_be_empty
        errors.for(:email).wont_be_empty
      end

      it 'is valid if all attributes are valid' do
        validator = ComposedValidationsWithExtraAttributesTest.new(name: 'L', email: '@')

        validator.valid?.must_equal true
      end
    end

    describe 'nested composed validations' do
      it 'is not valid if included attributes are not valid' do
        validator = NestedComposedValidationsTest.new({})

        validator.valid?.must_equal false
      end

      it 'is valid if included attributes are valid' do
        validator = NestedComposedValidationsTest.new(email: '@')

        validator.valid?.must_equal true
      end
    end
  end
end
