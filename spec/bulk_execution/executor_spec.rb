require "support/spec_helper"

describe BulkExecution::Executor do
  let(:bulk_execution) { BulkExecution::Executor.new(data) }
  let(:block) { Proc.new {} }
  let(:result_set) { double(:result_set) }

  let(:data) { [datum] }
  let(:datum) { double(:datum) }

  let(:execution_context) { double(:execution_context) }

  before do
    allow(BulkExecution::Results::ResultSet).to receive(:new).
      and_return(result_set)

    allow(block).to receive(:call)
  end

  describe "#execute" do
    it "executes the block over the data" do
      allow(BulkExecution::ExecutionContext).to receive(:new).
        with(datum, 0, result_set).
        and_return(execution_context)

      bulk_execution.execute(&block)

      expect(block).to have_received(:call).with(execution_context)
    end
  end
end

