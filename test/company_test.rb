require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def setup
    @company = Company.new
  end
  
  def test_existence
    assert_instance_of Company, @company
  end

  def test_attributes
    assert_equal [], @company.employees
    assert_equal [], @company.projects
    assert_equal [], @company.timesheets
  end

  def test_load_employees_method
    success   = { success: true, error: nil }
    employees = ->(element) { element.is_a?(Employee) }
    file      = './data/employees.csv'

    assert_equal success, @company.load_employees(file)
    assert_equal 2, @company.employees.size
    assert @company.employees.all?(&employees)
  end

  def test_load_employees_bad_data
    file = './data/bad_employees.csv'

    assert_equal @company.invalid, @company.load_employees(file)
    assert_equal 0, @company.employees.size
  end

  def test_load_projects_method
    success  = { success: true, error: nil }
    projects = ->(element) { element.is_a?(Project) }
    file     = './data/projects.csv'

    assert_equal success, @company.load_projects(file)
    assert_equal 3, @company.projects.size
    assert @company.projects.all?(&projects)
  end

  def test_load_projects_bad_data
    file = './data/bad_projects.csv'

    assert_equal @company.invalid, @company.load_projects(file)
    assert_equal 0, @company.projects.size
  end

  def test_load_timesheets_method
    success    = { success: true, error: nil }
    timesheets = ->(element) { element.is_a?(Timesheets) }
    file       = './data/timesheets.csv'

    assert_equal success, @company.load_timesheets(file)
    assert_equal 25, @company.timesheets.size
    assert @company.timesheets.all?(&timesheets) 
  end

  def test_load_timesheets_bad_data
    file = './data/bad_timesheets.csv'

    assert_equal @company.invalid, @company.load_timesheets(file)
    assert_equal 0, @company.timesheets.size
  end

  def test_find_employee_by_id
    file = './data/employees.csv'
    @company.load_employees(file)

    assert_instance_of Employee, @company.find_employee_by_id(2)
    assert_equal 'John Smith', @company.find_employee_by_id(2).name
    assert_equal 'Engineer', @company.find_employee_by_id(2).role
    assert_nil @company.find_employee_by_id(99)
  end

  def test_find_project_by_id
    file = './data/projects.csv'
    @company.load_projects(file)

    assert_instance_of Project, @company.find_project_by_id(1)
    assert_equal 'Widgets',@company.find_project_by_id(1).name
    assert_instance_of Time, @company.find_project_by_id(1).start_date
    assert_nil @company.find_project_by_id(5)
  end
end
