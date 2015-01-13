# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

connection = ActiveRecord::Base.connection

sql_files = ['counties', 'townships']
adapter_type = connection.adapter_name.downcase.to_sym

sql_files.each do |sql_file|
  if adapter_type == :postgresql
    sql = File.read("db/pg/#{sql_file}.sql")
  else
    sql = File.read("db/sql/#{sql_file}.sql")
  end
  statements = sql.split(/;$/)
  statements.pop

  ActiveRecord::Base.transaction do
    statements.each do |statement|
      connection.execute(statement)
    end
  end
end
