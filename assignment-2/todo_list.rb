class ToDoList
  attr_accessor :tasks
      
  def initialize
    @@tasks = []
  end
     
  def add_task(name, description)
    @@tasks << Task.new(name, description)
    puts "Task added!"
  end
   
  def check_for_valid_index(index)
    if index >= @@tasks.length
      puts "Invalid task index."
      return false
    else 
      return true
    end
  end

  def update_task_status_done(index)
      @@tasks[index].status = "done"
      puts "Status updated"
  end
   
  def delete_task(index)
    puts "Deleted task is: "
    puts @@tasks[index].name
    @@tasks.delete_at(index)      
  end
     
  def display_tasks(filter = Constants::Filter::ALL, sort = Constants::Sort::ASCENDING, display_type = Constants::Display::ALL_SUMMARY)
    puts "---------------------------------------------"
    filtered_tasks = []
    case filter
    when 1
      filtered_tasks = @@tasks.select {|task| task.status == "todo"}
    when 2
      filtered_tasks = @@tasks.select {|task| task.status == "done"}
    when 3
      filtered_tasks = @@tasks
    else
      puts "Invalid filter."
      return
    end
    sorted_tasks = []
    case sort
    when 1
      sorted_tasks = filtered_tasks.sort_by {|task| task.timestamp}
    when 2
      sorted_tasks = filtered_tasks.sort_by {|task| task.timestamp}.reverse
    else
      puts "Invalid sort."
      return
    end
    if display_type == 0
      sorted_tasks.each_with_index do |task, index|
        puts "#{index}: #{task.name} - #{task.status} (#{task.timestamp})"
      end
    elsif display_type == 1
      display_expand
    elsif display_type == 2
      display_tasks_top_five
    end
    diaplay_count_summary
  end
  
  def display_expand
    puts "==>Enter index to expand"
    index = gets.chomp.to_i
    if check_for_valid_index(index)
      puts "---------------------------------------------"
      puts "#{index}: Title: #{@@tasks[index].name} Description: (#{@@tasks[index].description}) - Status: #{@@tasks[index].status} Created time: (#{@@tasks[index].timestamp})"
    end
  end
  
  def display_tasks_top_five
    sorted_tasks = @@tasks.slice(0,5)
    sorted_tasks.each_with_index do |task, index|
      puts "#{index}: #{task.name} - #{task.status} (#{task.timestamp})"
    end
  end

  def diaplay_count_summary
    todo_count = @@tasks.count { |task| task.status == "todo" }
    done_count = @@tasks.count { |task| task.status == "done" }
    puts "---------------------------------------------"
    puts "TODO tasks: #{todo_count}"
    puts "DONE tasks: #{done_count}"
    puts "Total Tasks: #{todo_count + done_count} " 
    puts "---------------------------------------------"
  end
end
  