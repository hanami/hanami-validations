# frozen_string_literal: true

RSpec.describe Hanami::Validator do
  describe "combinable validations" do
    let(:address) do
      Class.new(Hanami::Validator) do
        validations do
          required(:city) { filled? }
        end
      end
    end

    let(:customer) do
      Class.new(Hanami::Validator) do
        validations do
          required(:name) { filled? }
          # FIXME: ask dry team to support any object that responds to #schema.
          required(:address).schema(address.schema)
        end
      end
    end

    subject do
      Class.new(Hanami::Validator) do
        validations do
          required(:number) { filled? }
          required(:customer).schema(customer.schema)
        end
      end.new
    end

    xit "returns successful validation result for valid data" do
      result = subject.call(number: 23, customer: { name: "Luca", address: { city: "Rome" } })
      expect(result).to be_success
    end

    xit "returns failing validation result for invalid data" do
      result = subject.call({})

      expect(result).to be_failing
      expect(result.messages.fetch(:number)).to eq   ["is missing"]
      expect(result.messages.fetch(:customer)).to eq ["is missing"]
    end

    # Bug
    # See https://github.com/hanami/validations/issues/58
    xit "safely serialize to nested Hash" do
      data   = { name: "John Smith", address: { line_one: "10 High Street" } }
      result = subject.call(data)

      expect(result.to_h).to eq(data)
    end

    # Bug
    # See https://github.com/hanami/validations/issues/58#issuecomment-99144243
    xit "safely serialize to Hash" do
      data   = { name: "John Smith", tags: [1, 2] }
      result = subject.call(data)

      expect(result.to_h).to eq(data)
    end
  end
end
