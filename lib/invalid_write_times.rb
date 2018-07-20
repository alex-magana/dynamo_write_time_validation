require 'date'
require 'csv'

# Fetch CSV
# Ireate through records
# Pick the write time stored in field, value,
# Check if write time, year, is greater than, year today
# Return array of invalid write times

class InvalidWriteTime
  def initialize(path = 'backup')
    @year_today = DateTime.now.year
    @path = File.join(File.dirname(__FILE__), '..', path)
  end

  def invalid_write_times
    invalid_times = []
    backup_files.each { |file_name| invalid_times.push(validate_assets(file_name)) }
    puts invalid_times
  end

  def validate_assets(file_name)
    read_file(file_name).select do |record|
      write_time = record['value (N)']
      DateTime.strptime("#{write_time}",'%s').year > @year_today
    end
  end

  def backup_files
    Dir.chdir(@path) { Dir.glob('*.csv') }
  end

  def read_file(file_name)
    CSV.read("#{@path}/#{file_name}", headers: true)
  end
end