class Calculator < ApplicationRecord
  validates_presence_of :width, :height
  validates :width, :height, numericality: { only_integer: true }

  serialize :cells, JSON

  before_create :create_blank_spreadsheet

  ALPHABET = ('A'..'Z').to_a.freeze
  REF_REGEX = /^([A-Z]+)([0-9]+)$/


  private

  def create_blank_spreadsheet
    spreadsheet_cells = {}

    self.width.times do |col_number|
      self.height.times do |row_number|
        location = [ALPHABET[col_number], row_number + 1].join
        spreadsheet_cells[location] = ''
      end
    end

    self.cells = spreadsheet_cells
  end
end
