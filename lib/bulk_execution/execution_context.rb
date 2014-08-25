module BulkExecution
  class ExecutionContext
    def initialize(data, index, result_set)
      @data = data
      @result_set = result_set
      @index = index
    end

    def record_failure(*args)
      result_set.record_failure(data, index, *args)
    end

    def record_success(*args)
      result_set.record_success(data, index, *args)
    end

    attr_reader :data

    private

    attr_reader :result_set, :index
  end
end

