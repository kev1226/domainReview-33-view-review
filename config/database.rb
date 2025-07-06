require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(["#{ENV['MONGO_HOST']}:#{ENV['MONGO_PORT']}"], 
  database: ENV['MONGO_DB'])

DB = client.database
VOTES_COLLECTION = DB[:votes]
