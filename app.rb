require "bundler"

Bundler.require

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/' do
  begin
    res = DB.run("SELECT NOW()")
    "SELECT NOW() => #{res} executed against #{ENV['DATABASE_URL']}"
  rescue => e
    "exception happened #{e.message}"
  end
end
