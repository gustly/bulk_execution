[![Build Status](https://travis-ci.org/gustly/bulk_execution.svg?branch=master)](https://travis-ci.org/gustly/bulk_execution)

# BulkExecution

Execute a block over a collection of data keeping track of successes and failures, 
the data that caused them, and the index of that data within the collection.

## Installation

Add this line to your application's Gemfile:

    gem 'bulk_execution'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bulk_execution

## Usage

```ruby
executor = BulkExecution::Exector.new(data)
executor.execute do |execution_context|
  begin
    result = do_something(execution_context.data)
    execution_context.record_success(result)
  rescue
    execution_context.record_failure($!)
  end
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/bulk_execution/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
