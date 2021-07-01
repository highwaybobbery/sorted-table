class FileParser
  DELIMITERS = [',', '|']

  def initialize(file)
    @file = file
  end

  def rows
    @rows ||= raw_lines.map do |line|
      # TODO: the controller should probably be detecting and enforcing the encoding
      line.force_encoding('utf-8').split(delimiter)
    end
  end

  def filename
    @file.original_filename
  end

  private

  def delimiter
    @delimiter ||= determine_delimiter
  end

  def raw_lines
    @raw_lines ||= @file.readlines
  end

  def determine_delimiter
    first_line = raw_lines.first
    DELIMITERS.each do |delimiter|
      return delimiter if first_line.include? delimiter
    end
    raise 'Error determining proper file delimiter'
  end
end
