class Calculator < ApplicationRecord
  validates_presence_of :width, :height
  validates :width, :height, numericality: { only_integer: true }

  before_save :convert_cells_to_json
  before_create :create_blank_spreadsheet

  ALPHABET = ('A'..'Z').to_a.freeze
  REF_REGEX = /^([A-Z]+)([0-9]+)$/


  private

  def convert_cells_to_json
    if cells.is_a?(Hash)
      self.cells = self.cells.as_json
    end
  end

  def create_blank_spreadsheet
    spreadsheet_cells = {}
    # row_size, column_length = size.split.map(&:to_i)

    self.width.times do |col_number|
      self.height.times do |row_number|
        location = [ALPHABET[col_number], row_number + 1].join
        spreadsheet_cells[location] = ''
      end
    end

    self.cells = spreadsheet_cells.to_json
  end
end
