require_relative 'data_analyst'
require_relative 'employee'
require_relative 'project'
class Company
  attr_reader :employees, :projects, :timesheets
  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end

  def load_employees(csv)
    data   = DataAnalyst.find_employees(csv)
    result = []
    data.map do |attributes|
      @employees << Employee.new(attributes.to_h) if valid?(attributes)
      result << valid?(attributes)
    end
    result
  end

  def load_projects(csv)
    data   = DataAnalyst.find_projects(csv)
    result = []
    data.map do |attributes|
      @projects << Project.new(attributes.to_h) if valid?(attributes)
      result << valid?(attributes)
    end
    result
  end

  def load_timesheets(csv)
    CSV.readlines(csv, headers: true, header_converter: :symbols)
  end

  def valid?(attributes)
    case attributes.include?(nil)
    when true  then { success: false, error: 'bad data' }
    when false then { success: true, error: nil }
    end
  end
end
