require './test/test_helper'
require './lib/audit'
require './lib/company'

class AuditTest < Minitest::Test
  def setup
    @audit = Audit.new

    @company = Company.new
    @company.load_employees('./data/employees.csv')
    @company.load_projects('./data/projects.csv')
    @company.load_timesheets('./data/timesheets.csv')
  end
  
  def test_existence
    assert_instance_of Audit, @audit
  end

  def test_load_company_method
    assert_equal @company, @audit.load_company(@company)
  end

  def test_were_invalid_days_worked
    @audit.load_company(@company)
    assert 'no invalid days', @audit.were_invalid_days_worked
  end
end
