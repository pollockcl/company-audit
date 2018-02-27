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
    @company.load_employees('./data/employees.csv')
  end

  # def test_load_projects_method
  #   @company.load_projects('./data/projects.csv')

  # end

  # def test_load_timesheets_method
  #   @company.load_timesheets('./data/bad_timesheets.csv')
  # end
end
