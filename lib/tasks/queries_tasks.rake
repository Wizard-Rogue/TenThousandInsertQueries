desc 'insert ten thousand queries into table'
namespace :db do
  task :queries => :environment do
    Table.delete_all
    (1..10000).each do |x|
      insert = Table.create(text: x.to_s)
      insert.save!
    end
  end

  task :redis => :environment do
    (1..10000).each do |x|
      $redis.sadd("queries", x.to_s)
    end
    puts $redis.smembers("queries").count
  end
end