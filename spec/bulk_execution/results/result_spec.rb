require "support/spec_helper"

describe BulkExecution::Results::Success do
  let(:success) { BulkExecution::Results::Success.new(data, index, result) }
  let(:data) { double(:data) }
  let(:index) { double(:index) }
  let(:result) { double(:result) }

  describe "#success?" do
    it "returns true" do
      expect(success.success?).to eq(true)
    end
  end
end

describe BulkExecution::Results::Failure do
  let(:failure) { BulkExecution::Results::Failure.new(data, index, result) }
  let(:data) { double(:data) }
  let(:index) { double(:index) }
  let(:result) { double(:result) }

  describe "#success?" do
    it "returns false" do
      expect(failure.success?).to eq(false)
    end
  end
end

