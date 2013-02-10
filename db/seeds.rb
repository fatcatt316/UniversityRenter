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

### NCSU
ncsu = College.find_by_short_name("NCSU")
ncsu_communities = [
  {name: "Avery Close", college: ncsu,
    description: "Avery Close is a quiet condominium community located across the street from North Carolina State's Centennial Campus and within a mile of the main campus. The community is primarily upper classmen and graduate students. All of the condos are 1167 sq. ft., have 2 bedrooms, and either 2 or 2.5 bathrooms (see blueprints).  Avery Close's great location on bus routes (Wolfline and CAT) makes it possible to travel without a personal car.",
    email: "joestewart@wpminc.net", phone: "919 856-9188", fax: "919 856-9189", external_url: "", legacy_url: "averyclose",
    address_attributes: {line1: "2508 Avent Ferry Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Centennial Village", college: ncsu,
    description: "Centennial Village is a community located at the corner of Avent Ferry and Gorman st. The community is primarily NCSU students, since it is conveniently located on the Wolfline.  It was built in 2000, and is within walking distance of many restaurants and a Food Lion.  Centennial Village offers roommate matching and individual leases.",
    email: "managercen@HorizonRA.com", phone: "919-836-8662", fax: "919-832-8672", external_url: "", legacy_url: "centennialvillage",
    address_attributes: {line1: "2310 Crescent Creek Drive", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Champion Court", college: ncsu,
    description: "This collection of condos is made up of condos having 1300 sq. ft (2 bedrooms, 2.5 bathrooms or 3 bedroom, 2.5 bathroom). It's located across the street from Mission Valley and between Centennial and Main Campus.  Champion Court was built in 1966 and offers spacious living at an affordable price.",
    email: "BeckleeN@aol.com", phone: "(919)-852-0202", fax: "(919)-835-2250", external_url: "", legacy_url: "champcourt",
    address_attributes: {line1: "2300 Avent Ferry Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Colonial Arms", college: ncsu,
    description: "Colonial Arms offers these living choices: 800 sq. ft 1 bedroom, 1 bathroom or 1050 sq. ft 2 bedroom 1.5 bathroom condos.  Since it's located on Crest Road, it's easy to hop on the Wolfline for easy transportation.",
    email: "WPMINC@BELLSOUTH.NET", phone: "919-755-0864", fax: nil, external_url: "", legacy_url: "colonialarms",
    address_attributes: {line1: "Crest Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Falcon Ridge", college: ncsu,
    description: "Falcon Ridge is a townhouse community with a diverse population ranging from college students to retired people.  Since it's located on the Wolfline, there's no problem getting to class on time.  Come by and check this place out.",
    email: nil, phone: nil, fax: nil, external_url: "", legacy_url: "falconridge",
    address_attributes: {line1: "Trexler Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Gladbern", college: ncsu,
    description: "Convenient to Wolfline and very close to McKimmon Center.  CAT bus stops right in front of it.  Quiet with lots of parking.",
    email: nil, phone: "(919) 851-6665", fax: nil, external_url: "", legacy_url: "gladbern",
    address_attributes: {line1: "1411 Gorman Street", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Gorman Crossings", college: ncsu,
    description: "Gorman Crossings is located around the intersection of Gorman and Avent Ferry.  These are very spacious 2- and 3-bedroom places that offer the choice between carpeted or hardwood floors.  Pets are allowed, and there are no breed restrictions.  If you are a full-time student then you can take advantage of a nice student discount.",
    email: "trinprop.raleigh@gmail.com", phone: "(919) 851-8309", fax: "(919) 859-6005", external_url: "http://www.trinitypropertiesapartments.com/gorman-crossings.html", legacy_url: "gormancrossings",
    address_attributes: {line1: "3101 Kings Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Hunter's Creek", college: ncsu,
    description: "Quiet townhouse living at an affordable price.  Lots of parking and very spacious living space.  A nice creek runs behind many of the townhomes.",
    email: nil, phone: nil, fax: nil, external_url: "", legacy_url: "hunterscreek",
    address_attributes: {line1: "4608 Hunters Creek", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Ivy Commons", college: ncsu,
    description: "This condominium community offers these choices: 540 sq. ft 1 bedroom 1 full bathroom, or 960 sq. ft 2 bedroom 2 full bathroom condos.  It's located across the street from Centennial Campus, on the Wolfline.  Ivy Commons is quiet, with many young professionals and graduate students living there.  It was built in 1986.",
    email: nil, phone: "(919) 790-5455", fax: nil, external_url: "http://www.ivycommons.com/", legacy_url: "ivycommons",
    address_attributes: {line1: "Ivy Commons Drive", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Kensington Park", college: ncsu,
    description: "Kensington Park apartments house mainly students, but also some families.  Located about one mile from NC State, it is served by the Wolfline.  Kensington Park offers 1-, 2-, and 3-bedroom apartments with outdoor patios.",
    email: "trinprop.raleigh@gmail.com", phone: "(919) 851-8309", fax: "(919) 859-6005", external_url: "http://www.trinitypropertiesapartments.com/kensington-park.html", legacy_url: "kp",
    address_attributes: {line1: "2716 Brigadoon Drive", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Lake Park", college: ncsu,
    description: "This condominium community features 1220 sq. ft 4 bedroom 4 full bathroom condos.  It is conveniently located across the street from scenic Lake Johnson,and is only about a half a mile from the Wolfline.  Lake Park was designed with students in mind, so the majority of its residents are students.  The Lake Park buildings were built in 2000.",
    email: "info@lakeparkcondo.com", phone: "919-665-5902", fax: nil, external_url: "http://www.tectopia.com/lakeparkcondo/", legacy_url: "lakepark",
    address_attributes: {line1: "1230 University Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Pine Knoll", college: ncsu,
    description: "Located barely a mile from NC State's main campus (and practically right next to Centennial Campus), Pine Knoll offers good student living.  It's served by the Wolfline and is only about half a mile from Mission Valley",
    email: "elena@rhynerentals.com", phone: "919-787-9375", fax: nil, external_url: "http://www.pineknollraleigh.com/", legacy_url: "pineknoll",
    address_attributes: {line1: "2505 Avent Ferry Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Rhyne's Gate", college: ncsu,
    description: "Rhynes Gate is a community located across the street from North Carolina State's McKimmon Center and within a mile of the main campus. Its population is primarily NCSU students.  It was constructed in 2004.  This complex is made up of 2BR/2BA units.  All units have a washer and dryer and include water and cable.",
    email: "elena@rhynerentals.com", phone: "919-787-9375", fax: nil, external_url: "http://www.rhynesgate.com/", legacy_url: "rhynesgate",
    address_attributes: {line1: "1822 Gorman Street", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "The Summit at Avent Ferry", college: ncsu,
    description: "The Summit at Avent Ferry is a uniquely constructed apartment community located at the corner of Lake Dam and Avent Ferry Roads, just moments from the Raleigh beltline and NC State.  These one and two bedroom dwellings (built in 1989) are beautifully situated in a forested area adjacent to Lake Johnson.",
    email: nil, phone: "(888) 727-6041", fax: "(919) 859-6794", external_url: "http://www.summitaventferry.com/", legacy_url: "summit",
    address_attributes: {line1: "1025 Avent Hill", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "University Apartments", college: ncsu,
    description: "University Apartments is a community located next to North Carolina State's Centennial Campus and within a mile of the main campus. The community is primarily non-NCSU students, but does offer specials catered towards students.  One section was built in the 1970s and the other was recently built in 2005.  This community is made of primarily 2br/1.5ba units.  With its close proximity to Centennial Campus, it is ideal for a engineering student on a budget.",
    email: "info@ncsuniversityapartments.com", phone: "(919) 833-5588", fax: "(919) 833-9989", external_url: "http://universityapartmentsnc.com/", legacy_url: "universityapts",
    address_attributes: {line1: "700 Ryan Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "University Commons", college: ncsu,
    description: "University Commons features 1200 sq. ft 4 bedroom 4 bathroom condos.  It was designed with students in mind, so the majority of its residences are students.  This community was built in 1996.",
    email: "wpminc@bellsouth.net", phone: "919-755-0864", fax: "919-755-0857", external_url: "http://www.wpminc.net/leasing?id=74", legacy_url: "univcommon",
    address_attributes: {line1: "1523 Graduate Lane", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Wolf Creek", college: ncsu,
    description: "Wolf Creek offers these living choices: 2br/2ba, 3br/3ba, or 4br/4ba.  It offers the most amenities of any community around NC State, from an Olympic size swimming pool to a computer lab.  It is located around 3 miles from campus, but has a private bus that will shuttle students back and forth.  This apartment community was build in 2002.",
    email: "WolfCreek@placeproperties.com", phone: "919-278-7818", fax: "919-861-8346", external_url: "http://www.wolfcreekapts.info/", legacy_url: "wolfcreek",
    address_attributes: {line1: "403 Wolf Creek Circle", zip: "27606", city: "Raleigh", state_id: nc_state.id}}
]

ncsu_communities.each do |community_attrs|
  puts "Looking for Community \"#{community_attrs[:name]}\"..."
  if Community.find_by_name(community_attrs[:name])
    puts "...found it!"
  else
    Community.create!(community_attrs)
    puts "...created it!"
  end
end