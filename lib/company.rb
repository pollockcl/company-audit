require_relative 'data_analyst'
require_relative 'employee'
require_relative 'project'
require_relative 'timesheets'
class Company
  attr_reader :employees, :projects, :timesheets
  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end

  def load_employees(csv)
    data = DataAnalyst.find_employees(csv)
    return invalid if data.to_a.flatten.include?(nil)
    data.map do |attributes|
      @employees << Employee.new(attributes.to_h)
    end
    valid
  end

  def load_projects(csv)
    data = DataAnalyst.find_projects(csv)
    return invalid if data.to_a.flatten.include?(nil)
    data.map do |attributes|
      @projects << Project.new(attributes.to_h)
    end
    valid
  end

  def load_timesheets(csv)
    data = DataAnalyst.find_timesheets(csv)
    return invalid if data.to_a.flatten.include?(nil)
    data.map do |attributes|
      @timesheets << Timesheets.new(attributes.to_h)
    end
    valid
  end

  def invalid
    { success: false, error: 'bad data' }
  end

  def valid
    { success: true, error: nil }
  end

  def find_employee_by_id(id)
    @employees.detect { |employee| employee.id == id }
  end

  def find_project_by_id(id)
    @projects.detect { |project| project.id == id }
  end
end
