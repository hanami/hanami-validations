require 'test_helper'

describe Hanami::Validations::Errors do
  before do
    @errors = Hanami::Validations::Errors.new
  end

  describe '#initialize' do
    it 'is empty by default' do
      @errors.must_be_empty
    end
  end

  describe '#empty?' do
    before do
      @errors.add(:email, Hanami::Validations::Error.new(:email, :format, /@/, 'test'))
    end

    it 'returns true when the set is empty' do
      @errors.clear

      assert @errors.empty?, "Expected errors to be empty"
    end

    it 'returns false when the set is not empty' do
      assert !@errors.empty?, "Expected errors to be not empty"
    end
  end

  describe '#any?' do
    before do
      @errors.add(:email, Hanami::Validations::Error.new(:email, :format, /@/, 'test'))
    end

    it 'returns true when the set is not empty' do
      assert @errors.any?, "Expected errors to be any"
    end

    it 'returns false when the set is empty' do
      @errors.clear

      assert !@errors.any?, "Expected errors to not be any"
    end
  end

  describe '#add' do
    it 'adds an error for an attribute' do
      @errors.add(:email, Hanami::Validations::Error.new(:email, :format, /@/, 'test'))
      @errors.wont_be_empty
    end
  end

  describe '#for' do
    it 'returns errors for the given attribute' do
      @errors.add(:email, Hanami::Validations::Error.new(:email, :format, /@/, 'test'))
      @errors.add(:name,  Hanami::Validations::Error.new(:name, :presence, true, nil))

      @errors.for(:name).must_include Hanami::Validations::Error.new(:name, :presence, true, nil)
    end
  end

  describe '#each' do
    it 'yields the given block for each error' do
      result = []

      @errors.add(:email,
        Hanami::Validations::Error.new(:email, :format, /@/, 'test'),
        Hanami::Validations::Error.new(:email, :confirmation, true, 'test')
      )

      @errors.add(:name,
        Hanami::Validations::Error.new(:name, :presence, true, nil)
      )

      @errors.each do |error|
        result << (
          "%{attribute} must match %{validation} (expected %{expected}, was %{actual})" %
          {attribute: error.attribute, validation: error.validation, expected: error.expected, actual: error.actual}
        )
      end

      result.must_equal [
        "email must match format (expected (?-mix:@), was test)",
        "email must match confirmation (expected true, was test)",
        "name must match presence (expected true, was )",
      ]
    end
  end

  describe '#map' do
    it 'yields the given block for each error' do
      @errors.add(:email,
        Hanami::Validations::Error.new(:email, :format, /@/, 'test'),
        Hanami::Validations::Error.new(:email, :confirmation, true, 'test')
      )

      @errors.add(:name,
        Hanami::Validations::Error.new(:name, :presence, true, nil)
      )

      result = @errors.map do |error|
        "%{attribute} must match %{validation} (expected %{expected}, was %{actual})" %
          {attribute: error.attribute, validation: error.validation, expected: error.expected, actual: error.actual}
      end

      result.must_equal [
        "email must match format (expected (?-mix:@), was test)",
        "email must match confirmation (expected true, was test)",
        "name must match presence (expected true, was )",
      ]
    end
  end

  describe '#count' do
    before do
      @errors.add(:email,
        Hanami::Validations::Error.new(:email, :format, /@/, 'test'),
        Hanami::Validations::Error.new(:email, :confirmation, true, 'test')
      )

      @errors.add(:name,
        Hanami::Validations::Error.new(:name, :presence, true, nil)
      )
    end

    it 'returns the count of errors' do
      @errors.count.must_equal 3
    end

    it 'is aliased as size' do
      @errors.size.must_equal 3
    end
  end

  describe '#==' do
    it 'compares with other errors' do
      assert Hanami::Validations::Errors.new == Hanami::Validations::Errors.new
    end
  end

  describe '#to_h' do
    before do
      @errors.add(:name,
        @error = Hanami::Validations::Error.new(:name, :presence, true, nil)
      )

      @actual = @errors.to_h
    end

    it 'returns a serialized version of the errors' do
      @actual.keys.must_equal([:name])

      errors = @actual.fetch(:name)
      errors.count.must_equal 1

      error = errors.first
      error.must_equal @error
    end

    it "returns a result compatible with Ruby's marshalling" do
      deserialized = Marshal.load(
        Marshal.dump(@actual)
      )

      deserialized.must_equal(@actual)
    end
  end

  describe '#to_a' do
    before do
      email_format       = Hanami::Validations::Error.new(:email, :format, /@/, 'test')
      email_confirmation = Hanami::Validations::Error.new(:email, :confirmation, true, 'test')
      name_presence      = Hanami::Validations::Error.new(:name, :presence, true, nil)

      @errors.add(:email, email_format, email_confirmation)
      @errors.add(:name,  name_presence)

      @expected = [email_format, email_confirmation, name_presence]
      @actual   = @errors.to_a
    end

    it 'returns a serialized version of the errors' do
      @expected.each do |error|
        @actual.must_include(error)
      end
    end

    it "returns a result compatible with Ruby's marshalling" do
      deserialized = Marshal.load(
        Marshal.dump(@actual)
      )

      deserialized.must_equal(@actual)
    end
  end

  describe 'attribute names' do
    it 'returns the attribute string when not namespaced' do
      error = Hanami::Validations::Error.new(:name, :presence, true, nil)
      error.attribute_name.must_equal('name')
      error.attribute.must_equal('name')
    end

    it 'returns the last segment of the attribute name when namespaced' do
      error = Hanami::Validations::Error.new('author', :presence, true, nil, :job)
      error.attribute_name.must_equal('author')
      error.attribute.must_equal('job.author')
    end
  end
end

