namespace :all do
  task all: :environment do
    Rake.application.tasks.each do |task|
      task.invoke if task.name.starts_with?("ruby:")
      task.invoke if task.name.starts_with?("rails:")
      task.invoke if task.name.starts_with?("scrape:")
    end

  end
end
