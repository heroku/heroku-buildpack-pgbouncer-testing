require "bundler"

Bundler.require

DB = Sequel.connect(ENV['DATABASE_URL'])

get '/' do
  begin
    res = DB.run("SELECT NOW()")
    host = URI.parse(ENV['DATABASE_URL']).host
    "executed against #{host}"
  rescue => e
    "exception happened #{e.message}"
  end
end
