class FileRepresenter
  HEADER = [
    { label: 'Full name', sortable: true },
    { label: 'Email', sortable: false },
    { label: 'Vehicle type', sortable: true },
    { label: 'Vehicle name', sortable: false },
    { label: 'Vehicle length', sortable: false },
  ]

  def initialize(rows)
    @raw_lines = rows
  end

  def header
    HEADER
  end

  def rows
    @rows ||= raw_lines.map do |line|
      # NOTE: the first and last name are combined from the input into a single
      # value ('Full name'). This is then added to the rest of the cells.
      [line[0] + ' ' + line[1]] + line[2..]
    end
  end

  private

  attr_reader :raw_lines
end
