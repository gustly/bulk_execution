require "support/spec_helper"

describe BulkExecution::ExecutionContext do
  let(:execution_context) { BulkExecution::ExecutionContext.new(data, index, result_set) }
  let(:data) { double(:data) }
  let(:result_set) { double(:result_set) }
  let(:index) { double(:index) }

  describe "#record_failure" do
    let(:failure_arg) { double(:failure_arg) }

    before do
      allow(result_set).to receive(:record_failure)
    end

    it "records a failure in the results set" do
      execution_context.record_failure(failure_arg)
      expect(result_set).to have_received(:record_failure).with(data, index, failure_arg)
    end
  end

  describe "#record_success" do
    let(:success_arg) { double(:success_arg) }

    before do
      allow(result_set).to receive(:record_success)
    end

    it "records a success in the results set" do
      execution_context.record_success(success_arg)
      expect(result_set).to have_received(:record_success).with(data, index, success_arg)
    end
  end
end

