describe BulkExecution::Results::ResultSet do
  let(:result_set) { BulkExecution::Results::ResultSet.new }

  let(:failure) { double(:failure) }
  let(:failure_data) { double(:failure_data) }
  let(:index) { double(:index) }
  let(:error_message) { double(:error_message) }

  let(:success) { double(:success) }
  let(:success_data) { double(:success_data) }

  let(:success_result) { double(:success_result) }

  describe "#record_failure" do
    before do
      allow(BulkExecution::Results::Failure).to receive(:new).
        with(failure_data, index, error_message).
        and_return(failure)
    end

    it "creates a new Failure" do
      result_set.record_failure(failure_data, index, error_message)
      expect(result_set.failures).to include(failure)
    end
  end

  describe "#record_success" do
    before do
      allow(BulkExecution::Results::Success).to receive(:new).
        with(success_data, index, success_result).
        and_return(success)
    end

    it "creates a new Success" do
      result_set.record_success(success_data, index, success_result)
      expect(result_set.successes).to include(success)
    end
  end

  describe "#failure?" do
    subject { result_set.failure? }

    context "there are failures" do
      before { result_set.record_failure(failure_data, index, error_message) }
      specify { expect(subject).to eq(true) }
    end

    context "there are no failures" do
      specify { expect(subject).to eq(false) }
    end
  end

  describe "#success?" do
    subject { result_set.success? }

    context "there are failures" do
      before { result_set.record_failure(failure_data, index, error_message) }
      specify { expect(subject).to eq(false) }
    end

    context "there are no failures" do
      specify { expect(subject).to eq(true) }
    end
  end
end

