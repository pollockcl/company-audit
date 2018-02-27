class Timesheets
  attr_reader :employee_id, :project_id, :date, :minutes
  def initialize(attributes)
    @employee_id = attributes[:employee_id].to_i
    @project_id  = attributes[:project_id].to_i
    @date        = Time.parse(attributes[:date])
    @minutes     = attributes[:minutes].to_i
  end
end