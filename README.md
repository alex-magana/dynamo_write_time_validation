
### Dynamo time validation 
This utility determines assets whose write times, are invalid epoch time format, values.
This tool uses a csv file exported from [dynamodb](https://eu-west-1.console.aws.amazon.com/dynamodb/home?region=eu-west-1).

### Why is this necessary?
Dynamodb does not have a support for datetime types. As such, direct queries to the table may include overhead of converting
the type, number or string values, used to represent time.

### Running the application
ruby bin/runner.rb
