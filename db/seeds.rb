# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

overwrite = ENV['overwrite'] == "yes"
how_many_courses = ENV['courses'].to_i

puts "Usage: rake db:seed courses=<number of courses> <overwrite=true>" if how_many_courses <= 0 # to_i returns 0 if ENV['courses'] is empty

Course.delete_all if overwrite
 
for i in 1..how_many_courses
  Course.create(:name => "#{'Course #' + i.to_s}", :description => "Non eram nescius, Brute, cum, quae summis ingeniis exquisitaque doctrina philosophi Graeco sermone tractavissent, ea Latinis litteris mandaremus, fore ut hic noster labor in varias reprehensiones incurreret. nam quibusdam, et iis quidem non admodum indoctis, totum hoc displicet philosophari")
end
