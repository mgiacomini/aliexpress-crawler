namespace :crawler do
  desc "Runs Crawler.rb"
  task run: :environment do
    @crawlers.each do |crawler|
      orders = crawler.wordpress.get_orders
      crawler.run orders
    end
  end

  desc "Runs every 10 minutes"
  task tenminutes: :environment do
    @crawlers = Crawler.where(schedule: 'ten_minutes',enabled: true)
    unless @crawlers.nil?
      Rake::Task['crawler:run'].execute
    end
  end

  desc "Runs every hour"
  task hourly: :environment do
    @crawlers = Crawler.where(schedule: 'hourly',enabled: true)
    unless @crawlers.nil?
      Rake::Task['crawler:run'].execute
    end
  end

  desc "Runs every day"
  task daily: :environment do
    @crawlers = Crawler.where(schedule: 'daily',enabled: true)
    unless @crawlers.nil?
      Rake::Task['crawler:run'].execute
    end
  end
end
