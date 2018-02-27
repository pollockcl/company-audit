class Project
  attr_reader :id, :name, :start_date, :end_date
  def initialize(attributes)
    @id = attributes[:project_id].to_i
    @name = attributes[:name]
    @start_date = Time.parse(attributes[:start_date])
    @end_date   = Time.parse(attributes[:end_date])
  end
end
