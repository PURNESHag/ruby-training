class Task
  attr_accessor :name, :description, :status, :timestamp
      
  def initialize(name, description)
    @name = name
    @description = description
    @status = "todo"
    @timestamp = Time.now.strftime("%d/%m/%Y - %H:%M")
  end
end
