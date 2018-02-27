class Employee
  attr_reader :id, :name, :role, :start_date, :end_date
  def initialize(attributes)
    @id = attributes[:id].to_i
    @name = attributes[:name]
    @role = attributes[:role]
    @start_date = Time.parse(attributes[:start_date])
    @end_date   = Time.parse(attributes[:end_date])
  end
end
