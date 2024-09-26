class Task
  attr_accessor :name, :description, :status, :timestamp
  
  def initialize(name, description, status)
    @name = name
    @description = description
    @status = status
    @timestamp = Time.now
  end
end

class ToDoList
  def initialize
    @tasks = []
  end
  
  def add_task(name, description)
    task = Task.new(name, description, 'todo')
    @tasks << task
    puts "Task added: #{name}"
  end
  
  def edit_task(name, new_name, new_description)
    task = find_task_by_name(name)
    if task.nil?
      puts "Task not found: #{name}"
    else
      task.name = new_name
      task.description = new_description
      puts "Task updated: #{new_name}"
    end
  end
  
  def delete_task(name)
    task = find_task_by_name(name)
    if task.nil?
      puts "Task not found: #{name}"
    else
      @tasks.delete(task)
      puts "Task deleted: #{name}"
    end
  end
  
  def display_tasks(filter = 'all', sort_order = 'created_first')
    case filter
    when 'todo'
      tasks_to_display = @tasks.select { |task| task.status == 'todo' }
    when 'done'
      tasks_to_display = @tasks.select { |task| task.status == 'done' }
    else
      tasks_to_display = @tasks
    end
    
    case sort_order
    when 'created_first'
      tasks_to_display = tasks_to_display.sort_by { |task| task.timestamp }
    when 'created_last'
      tasks_to_display = tasks_to_display.sort_by { |task| task.timestamp }.reverse
    end
    
    puts "Tasks:"
    tasks_to_display.each do |task|
      puts "- #{task.name} (#{task.description}) - #{task.status} - #{task.timestamp}"
    end
  end
  
  
  def find_task_by_name(name)
    @tasks.find { |task| task.name == name }
  end
end

list = ToDoList.new

#Example:


list.add_task('Morning workout', 'Jogging')
list.add_task('Hair cut', 'Clean the hair')
list.add_task('going bank', 'complete bank work')

list.display_tasks('all', 'created_last')

list.edit_task('Buy milk', 'going bank', 'Passbook update and cash')

list.display_tasks('todo', 'created_first')

list.delete_task('Morning workout')

list.display_tasks('all', 'created_first')


