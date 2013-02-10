# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

nc_state = State.find_by_name("North Carolina")
college_info = [
  # NC State
  {name: "NC State", short_name: "NCSU", mascot: "Wolfpack", description: "NC State University is located near downtown Raleigh.  With over 30,000 students, there are many student apartments right off NCSU's campus in Raleigh.",
  address_attributes: {line1: "100 Hillsborough Street", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
  
  # UNC
  {name: "UNC Chapel Hill", short_name: "UNC", mascot: "Tarheels", description: "University of North Carolina Chapel Hill is located, surprising enough, in Chapel Hill, North Carolina.  Opened way back in 1795, it was the first public college in the United States o' America.",
  address_attributes: {line1: "209 South Road", zip: "27599", city: "Chapel Hill", state_id: nc_state.id}},
  
  # UNCC
  {name: "UNC Charlotte", short_name: "UNCC", mascot: "49ers", description: "UNC Charlotte is is located in the Queen City, which has the largest population of any city in North Carolina.  The number of off-campus apartments around UNCC truly boggles the mind.",
  address_attributes: {line1: "9201 University City Blvd", zip: "28223", city: "Charlotte", state_id: nc_state.id}},
  
  # UNCW
  {name: "UNC Wilmington", short_name: "UNCW", mascot: "Seahawks", description: "Surfs up!  Situated near the beautiful North Carolina coast, UNCW offers higher education with all the benefits of being close to the beach.",
  address_attributes: {line1: "601 S College Rd", zip: "28403", city: "Wilmington", state_id: nc_state.id}},
  
  # ECU
  {name: "Eastern Carolina University", short_name: "ECU", mascot: "Pirates", description: "With the motto \"Tomorrow Starts Here\", ECU ambitiously puts its best foot forward.  Located in Greenville, NC, it was founded back in 1907, making it a wee bit over 100 years old.",
  address_attributes: {line1: "East Fifth Street", zip: "27858", city: "Greenville", state_id: nc_state.id}},
  
  # ASU
  {name: "App State", short_name: "ASU", mascot: "Mountaineers", description: "Nestled in the gorgeous mountain town of Boone, ASU offers an excellent college education along with an amazing natural setting.",
  address_attributes: {line1: "287 Rivers St", zip: "28608", city: "Boone", state_id: nc_state.id}},
  
  # UNCG
  {name: "UNC Greensboro", short_name: "UNCG", mascot: "Spartans", description: "Right in the middle of the thriving city of Greensboro, UNCG started off with 198 students in 1892.  In the 120+ years since, it's grown quite a bit.",
  address_attributes: {line1: "1400 Spring Garden St", zip: "27412", city: "Greensboro", state_id: nc_state.id}},
  
  # Duke
  {name: "Duke University", short_name: "Duke", mascot: "Wolfpack", description: "Duke is a private university situated in Durham, AKA the Bull City.  In 2013, \"U.S. News & World Report\" ranked Duke's undergrad program 8th best in the whole United States.",
  address_attributes: {line1: "2138 Campus Drive", zip: "27705", city: "Durham", state_id: nc_state.id}}
]

college_info.each do |college_attrs|
  puts "Looking for College with short name \"#{college_attrs[:short_name]}\"..."
  if College.find_by_short_name(college_attrs[:short_name])
    puts "...found it!"
  else
    College.create!(college_attrs)
    puts "...created it!"
  end
end