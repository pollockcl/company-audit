require './test/test_helper'
require './lib/timesheets'

class TimesheetsTest < Minitest::Test
  def setup
    attributes = { employee_id: '5',
                   project_id:  '7',
                   date:        '2015-01-01',
                   minutes:     '120' }

    @timesheet = Timesheets.new(attributes)
  end

  def test_existence
    assert_instance_of Timesheets, @timesheet
  end

  def test_attributes
    assert_equal 5, @timesheet.employee_id
    assert_equal 7, @timesheet.project_id
    assert_instance_of Time, @timesheet.date
    assert_equal 120, @timesheet.minutes
  end

end