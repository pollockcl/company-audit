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

  # def test_load_employees_method
  #   success   = ->(element) { element[:success] }
  #   employees = ->(element) { element.is_a?(Employee) }
  #   file    = './data/employees.csv'

  #   assert @company.load_employees(file).all?(&success)
  #   assert_equal 2, @company.employees.size
  #   assert @company.employees.all?(&employees)
  # end

  def test_load_projects_method
    success  = ->(element) { element[:success] }
    projects = ->(element) { element.is_a?(Project) }
    file     = './data/bad_projects.csv'

    assert @company.load_projects(file).all?(&success)
    assert_equal 3, @company.projects.size
    assert @company.projects.all?(&projects)

  end

  # def test_load_timesheets_method
  #   success    = ->(element) { element[:success] }
  #   timesheets = ->(element) { element.is_a?(Timesheets) }
  #   file       = './data/timesheets.csv'

  #   assert @company.load_timesheets(file).all?(&success)
  #   assert_equal 25, @company.timesheets.size
  #   assert @company.timesheets.all?(&timesheets) 
  # end
end
