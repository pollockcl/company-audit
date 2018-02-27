require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def setup
    attributes = { project_id: '123',
                   name:       'Widget Maker',
                   start_date: '2015-01-01',
                   end_date:   '2018-01-01' }
    @project = Project.new(attributes)
  end

  def test_existence
    assert_instance_of Project, @project
  end

  def test_attributes
    assert_equal 123, @project.id
    assert_equal 'Widget Maker', @project.name
    assert_instance_of Time, @project.start_date
    assert_instance_of Time, @project.end_date
  end
end