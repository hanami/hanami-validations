require 'test_helper'
require 'hanami/utils'

describe 'Predicates: lteq?' do
  before do
    @validator = Class.new do
      include Hanami::Validations

      validates(:name) { lteq?(23) }
    end
  end

  it 'raises error for missing data' do
    exception = -> { @validator.new({}).validate }.must_raise(NoMethodError)
    exception.message.must_match "undefined method `<=' for nil:NilClass"
  end

  it 'raises error for nil data' do
    exception = -> { @validator.new(name: nil).validate }.must_raise(NoMethodError)
    exception.message.must_match "undefined method `<=' for nil:NilClass"
  end

  it 'raises error for blank string' do
    exception = -> { @validator.new(name: '').validate }.must_raise(ArgumentError)
    exception.message.must_equal "comparison of String with 23 failed"
  end

  it 'raises error for filled string' do
    exception = -> { @validator.new(name: '23').validate }.must_raise(ArgumentError)
    exception.message.must_equal "comparison of String with 23 failed"
  end

  it 'raises error for empty array' do
    exception = -> { @validator.new(name: []).validate }.must_raise(NoMethodError)
    exception.message.must_match "undefined method `<=' for []:Array"
  end

  it 'raises error for filled array' do
    exception = -> { @validator.new(name: [23]).validate }.must_raise(NoMethodError)
    exception.message.must_match "undefined method `<=' for [23]:Array"
  end

  if RUBY_VERSION < '2.3' || Hanami::Utils.jruby?
    it 'raises error for empty hash' do
      exception = -> { @validator.new(name: {}).validate }.must_raise(NoMethodError)
      exception.message.must_equal "undefined method `<=' for {}:Hash"
    end

    it 'raises error for filled hash' do
      exception = -> { @validator.new(name: { a: 23 }).validate }.must_raise(NoMethodError)
      exception.message.must_equal "undefined method `<=' for {:a=>23}:Hash"
    end
  else
    it 'raises error for empty hash' do
      exception = -> { @validator.new(name: {}).validate }.must_raise(TypeError)
      exception.message.must_equal "no implicit conversion of Fixnum into Hash"
    end

    it 'raises error for filled hash' do
      exception = -> { @validator.new(name: { a: 23 }).validate }.must_raise(TypeError)
      exception.message.must_equal "no implicit conversion of Fixnum into Hash"
    end
  end

  it 'returns failing result for greater than fixnum' do
    resulteq = @validator.new(name: 24).validate

    resulteq.wont_be :success?
    resulteq.errors.for(:name).must_equal [
      Hanami::Validations::Error.new(:name, :lteq?, 23, 24)
    ]
  end

  it 'returns successful result for equal fixnum' do
    resulteq = @validator.new(name: 23).validate

    resulteq.must_be :success?
    resulteq.errors.must_be_empty
  end

  it 'returns successful resulteq for less than fixnum' do
    resulteq = @validator.new(name: 22).validate

    resulteq.must_be :success?
    resulteq.errors.must_be_empty
  end
end
