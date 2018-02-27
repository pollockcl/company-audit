require_relative 'data_analyst'
require_relative 'employee'
class Company
  attr_reader :employees, :projects, :timesheets
  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end

  def load_employees(csv)
    data = DataAnalyst.find_employees(csv)
    data.map do |attributes|
      @employees << Employee.new(attributes.to_h)
    end
  end

  def load_projects(csv)
    CSV.readlines(csv, headers: true, header_converter: :symbols)
  end

  def load_timesheets(csv)
    CSV.readlines(csv, headers: true, header_converter: :symbols)
  end
end
