module BulkExecution
  module Results
    class ResultSet
      def initialize
        @successes = []
        @failures = []
      end

      def record_failure(*args)
        @failures << Failure.new(*args)
      end

      def record_success(*args)
        @successes << Success.new(*args)
      end

      def failure?
        failures.any?
      end

      def success?
        !failure?
      end

      attr_reader :failures,
        :successes
    end
  end
end

