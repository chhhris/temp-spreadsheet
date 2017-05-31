class Calculator < ApplicationRecord
  validates_presence_of :width, :height
  validates :width, :height, numericality: { only_integer: true }

  serialize :cells, JSON

  before_save :evaluate_input
  before_create :create_blank_spreadsheet

  ALPHABET = ('A'..'Z').to_a.freeze
  REF_REGEX = /^([A-Z]+)([0-9]+)$/


  private

  def evaluate_input
    if self.cells.present?
      self.cells.each do |loc, value|
        calculated_value = evaluate_cell(loc, value)
        return if self.errors[:cells].present?
        cells[loc] = calculated_value
      end
    end
  end

  def evaluate_cell(loc, value, cells_traversed: [loc])
    evaluation = []

    value.to_s.split.each do |term|
      if reference_match = term.match(REF_REGEX)
        if cells_traversed.include? term
          cells_traversed << term
          errors.add(:base, "Cyclic dependencies: #{cells_traversed.join(' >> ')}")
          raise ActiveRecord::Rollback
        else
          going_deeper = cells_traversed.clone
          going_deeper << term
          result = evaluate_cell(loc, self.cells[term], cells_traversed: going_deeper).to_f

          # save result so we don't need to calculate again
          self.cells[term] = result
          evaluation << result
        end
      elsif ["-", "/", "*", "+", "**"].include?(term)
        operands = evaluation.pop(2)

        # if operands.length < 2
        #   self.errors.add(:cells, "Cyclic dep detected: #{cells_traversed.join(' >> ')}")
        #   return
        # end

        evaluation << operands[0].send(term, operands[1])
      else
        evaluation << term.to_f
      end
    end

    return evaluation.first.round(5)
  end

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
