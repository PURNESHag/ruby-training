require_relative 'todo_list'
require_relative 'task'
require_relative 'constants'

todo_list = ToDoList.new
loop do
  puts "==================BEGIN======================"
  puts "Tasks in the list"
  todo_list.display_tasks(Constants::Filter::ALL, Constants::Sort::ASCENDING, Constants::Display::TOP)
  puts "Actions:"
  puts "1. Add task"
  puts "2. Update task status to done"
  puts "3. Delete task"
  puts "4. Display tasks"
  puts "5. Display tasks with filters"
  puts "6. Expand task"
  puts "7. Quit"
  puts "============================================="
  puts "==>Enter Action"
  choice = gets.chomp.to_i
  case choice
  when 1
    puts "==>Enter task name:"
    name = gets.chomp
    description = []
    puts "Enter description (enter 'quit' or 'exit' to stop): "
    loop do
      description_line = gets.chomp.downcase
      break if description_line.match?(/^(exit|quit)$/i)
      description << description_line
    end
    todo_list.add_task(name, description)
  when 2
    todo_list.display_tasks
    puts "==>Enter task index:"
    index = gets.chomp.to_i
    if todo_list.check_for_valid_index(index)
      todo_list.update_task_status_done(index)
    end

  when 3
    todo_list.display_tasks
    puts "==>Enter task index:"
    index = gets.chomp.to_i 
    if todo_list.check_for_valid_index(index)
      todo_list.delete_task(index)
    end
  when 4
    todo_list.display_tasks
  when 5
    puts "Filter by: 1. todo, 2. done, 3. all"
    filter = gets.chomp.to_i
    puts "Sort by: 1. created first, 2. created last"
    sort = gets.chomp.to_i
    todo_list.display_tasks(filter, sort, Constants::Display::ALL_SUMMARY)
  when 6
    todo_list.display_tasks(Constants::Filter::ALL, Constants::Sort::ASCENDING, Constants::Display::EXPAND)
  when 7
    break
  else
    puts "Invalid choice."
  end
end
