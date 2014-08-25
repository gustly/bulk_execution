module BulkExecution
  class Executor
    def initialize(data)
      @data = data
    end

    def execute(&block)
      Results::ResultSet.new.tap do |results|
        data.each_with_index do |datum, index|
          block.call(ExecutionContext.new(datum, index, results))
        end
      end
    end

    private

    attr_reader :data
  end
end

