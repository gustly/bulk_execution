module BulkExecution
  module Results
    class Result
      def initialize(data, index, result)
        raise StandardError, "Abstract base class" if self.class == Result
        @data = data
        @index = index
        @result = result
      end

      def success?
        case self
        when Success then true
        when Failure then false
        end
      end

      attr_reader :data, :index, :result
    end

    class Success < Result; end

    class Failure < Result
      alias_method :error, :result
    end
  end
end
