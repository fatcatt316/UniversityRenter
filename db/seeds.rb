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
    email: "joestewart@wpminc.net", phone: "919 856-9188", fax: "919 856-9189", external_url: nil, legacy_url: "averyclose",
    address_attributes: {line1: "2508 Avent Ferry Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Centennial Village", college: ncsu,
    description: "Centennial Village is a community located at the corner of Avent Ferry and Gorman st. The community is primarily NCSU students, since it is conveniently located on the Wolfline.  It was built in 2000, and is within walking distance of many restaurants and a Food Lion.  Centennial Village offers roommate matching and individual leases.",
    email: "managercen@HorizonRA.com", phone: "919-836-8662", fax: "919-832-8672", external_url: nil, legacy_url: "centennialvillage",
    address_attributes: {line1: "2310 Crescent Creek Drive", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Champion Court", college: ncsu,
    description: "This collection of condos is made up of condos having 1300 sq. ft (2 bedrooms, 2.5 bathrooms or 3 bedroom, 2.5 bathroom). It's located across the street from Mission Valley and between Centennial and Main Campus.  Champion Court was built in 1966 and offers spacious living at an affordable price.",
    email: "BeckleeN@aol.com", phone: "(919)-852-0202", fax: "(919)-835-2250", external_url: nil, legacy_url: "champcourt",
    address_attributes: {line1: "2300 Avent Ferry Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Colonial Arms", college: ncsu,
    description: "Colonial Arms offers these living choices: 800 sq. ft 1 bedroom, 1 bathroom or 1050 sq. ft 2 bedroom 1.5 bathroom condos.  Since it's located on Crest Road, it's easy to hop on the Wolfline for easy transportation.",
    email: "WPMINC@BELLSOUTH.NET", phone: "919-755-0864", fax: nil, external_url: nil, legacy_url: "colonialarms",
    address_attributes: {line1: "Crest Road", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Falcon Ridge", college: ncsu,
    description: "Falcon Ridge is a townhouse community with a diverse population ranging from college students to retired people.  Since it's located on the Wolfline, there's no problem getting to class on time.  Come by and check this place out.",
    email: nil, phone: nil, fax: nil, external_url: nil, legacy_url: "falconridge",
    address_attributes: {line1: "Trexler Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Gladbern", college: ncsu,
    description: "Convenient to Wolfline and very close to McKimmon Center.  CAT bus stops right in front of it.  Quiet with lots of parking.",
    email: nil, phone: "(919) 851-6665", fax: nil, external_url: nil, legacy_url: "gladbern",
    address_attributes: {line1: "1411 Gorman Street", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Gorman Crossings", college: ncsu,
    description: "Gorman Crossings is located around the intersection of Gorman and Avent Ferry.  These are very spacious 2- and 3-bedroom places that offer the choice between carpeted or hardwood floors.  Pets are allowed, and there are no breed restrictions.  If you are a full-time student then you can take advantage of a nice student discount.",
    email: "trinprop.raleigh@gmail.com", phone: "(919) 851-8309", fax: "(919) 859-6005", external_url: "http://www.trinitypropertiesapartments.com/gorman-crossings.html", legacy_url: "gormancrossings",
    address_attributes: {line1: "3101 Kings Court", zip: "27606", city: "Raleigh", state_id: nc_state.id}},
    
  {name: "Hunter's Creek", college: ncsu,
    description: "Quiet townhouse living at an affordable price.  Lots of parking and very spacious living space.  A nice creek runs behind many of the townhomes.",
    email: nil, phone: nil, fax: nil, external_url: nil, legacy_url: "hunterscreek",
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

# UNC
unc = College.find_by_short_name("UNC")
unc_communities = [
  {name: "Autumn Woods", college: unc,
    description: "Autumn Woods' quiet, pastoral setting, and beautifully landscaped grounds is the perfect place to watch the seasons change. Yet the location couldn't be more convenient with the close proximity to downtown Chapel Hill, UNC, the hospitals and Research Triangle Park. Live in the beautiful surroundings of the woods. Autumn Woods.",
    email: nil, phone: "(919)-933-7555", fax: nil, external_url: "http://www.autumnwoods-nc.com/", legacy_url: "autumnwoods",
    address_attributes: {line1: "222 Old Fayetteville Rd", zip: "27510", city: "Carrboro", state_id: nc_state.id}},
    
  {name: "Berkshire Manor", college: unc,
    description: "Berkshire Manor offers one and two bedroom apartments at and affordable price, with a great loaction. The community is quiet and family friendly. Also, for the students, a free bus ride to UNC is available.",
    email: "berkshire_manor@aspensquare.com", phone: "(866)-301-6855", fax: nil, external_url: "http://www.berkshiremanorapts.com/", legacy_url: "berkshiremanor",
    address_attributes: {line1: "101 Highway 54 Bypass", zip: "27510", city: "Carrboro", state_id: nc_state.id}},
    
  {name: "Chapel Ridge", college: unc,
    description: "Chapel Ridge Apartments has a great location close to campus and all of the amenities to make your living experience all you can imagine. All of the little things like utilities, internet, furniture, and roommates that do not pay are not a worry at Chapel Ridge Apartments. Basically, everything that you can think of is taken care of. Although a little pricey, Chapel Ridge Apartments does offer one the of best living experiences around UNC.",
    email: nil, phone: "(919)-945-8875", fax: "(919)-945-8877", external_url: "http://chapelridgeliving.com/", legacy_url: "chapelridge",
    address_attributes: {line1: "101 Legacy Terrace", zip: "27516", city: "Chapel Hill", state_id: nc_state.id}},
    
  {name: "Glen Lennox", college: unc,
    description: "Glen Lennox has been one of the most popular places to live in Chapel Hill and it is easy to see why. Charming single-story cottages in a peaceful neighborhood setting with tree-lined streets. Private entrances, yards and sidewalks offer classic living with a premium Chapel Hill location minutes from UNC, Franklin Street and Research Triangle Park.",
    email: "glenlennox@grubbproperties.com", phone: "919-967-7081", fax: nil, external_url: "http://www.glenlennoxapartments.com/", legacy_url: "glenlennox",
    address_attributes: {line1: "5 Hamilton Road", zip: "27517", city: "Chapel Hill", state_id: nc_state.id}},
    
  {name: "Shadowood", college: unc,
    description: "Shadowood Apartments offers some of the finest living conditions, close to UNC. It is located less than 2 miles from campus and is also very close to I-40. With the beautiful landscaping and focus on luxury, Shadowood can keep you comfortable during your time at school.",
    email: nil, phone: "(888)-409-8210", fax: nil, external_url: "http://www.liveshadowood.com/", legacy_url: "shadowood",
    address_attributes: {line1: "110 Piney Mountain Road", zip: "27514", city: "Chapel Hill", state_id: nc_state.id}},
    
  {name: "The Villages of Chapel Hill", college: unc,
    description: "The Villages of Chapel Hill offers one of the widest varieties of floor plans. There are 11 to choose from: lofts, studios, townhomes, and regular apartments. There are a wide variety of fitness options, including the weight and cardio rooms, basketball courts, tennis courts, street hockey, and a volleyball court. The community also has two swimming pools. With a large library of movies, you can enjoy your favorite movies for free. Also, this community is on the J busline, allowing you to enjoy public transportation.",
    email: "villageschapelhill@greystar.com", phone: "(919)-929-1141", fax: nil, external_url: nil, legacy_url: "villageschapelhill",
    address_attributes: {line1: "1000 Smith Level Road", zip: "27510", city: "Carrboro", state_id: nc_state.id}}
]

# UNCG
uncg = College.find_by_short_name("UNCG")
uncg_communities = [
  {name: "Amber Trace", college: uncg,
      description: "Amber Trace is a private student community in a wooded area. It's about two miles away from the UNCG campus. Some of the apartments have a fireplace, which can be nice in the fall and winter.",
      email: "ambertrace@pickeringandco.com", phone: "(336) 854-4422", fax: "(336) 854-4417", external_url: "http://www.pickeringandco.com/property_listings/residential/greensboro/amber_trace", legacy_url: "amberTrace",
      address_attributes: {line1: "2908 W Florida Street", zip: "27407", city: "Greensboro", state_id: nc_state.id}},
  {name: "Campus Crossing", college: uncg,
      description: "Campus Crossing lists 2, 3, and 4 bedroom units for rent. These Greensboro apartments come with 2 bathrooms. These Greensboro apartments feature total living area between 800 and 1100 sq.ft.",
      email: nil, phone: "(336)-294-3855", fax: "(336)-315-5216", external_url: "http://www.outofthedorm.com/", legacy_url: "campusCrossing",
      address_attributes: {line1: "2813 Spring Garden Street", zip: "27403", city: "Greensboro", state_id: nc_state.id}},
  {name: "Campus One", college: uncg,
      description: "A nice student apartment complex with 3 BR/2 BA apartments and 2 BR/2 BA apartments. It's within walking or biking distance from UNCG, and they offer ample parking. They're also within walking distance of several restaurants and stores.",
      email: nil, phone: "(336) 273-1357", fax: nil, external_url: nil, legacy_url: "campusOne",
      address_attributes: {line1: "1919 Spring Garden Street", zip: "27403", city: "Greensboro", state_id: nc_state.id}},
  {name: "Reynolds Place", college: uncg,
      description: "Reynolds Place apartments is a student-friendly community close to UNCG, Guilford College, and Greensboro college.",
      email: nil, phone: "(336) 273-1357", fax: nil, external_url: nil, legacy_url: "reynoldsPlace",
      address_attributes: {line1: "1915 Spring Garden Street", zip: "27403", city: "Greensboro", state_id: nc_state.id}},
  {name: "Spring Garden Apartments", college: uncg,
      description: "Spring Garden apartments combines the best of on-campus convenience with off-campus freedoms.  A good transition place to live between the dorms and off-campus places.",
      email: "hrl@uncg.edu", phone: "(336)-334-5636", fax: "(336)-334-5680", external_url: "http://hrl.uncg.edu/living_on_campus/halls2/spgd/spgd.php", legacy_url: "springGarden",
      address_attributes: {line1: "1540 Spring Garden Street", zip: "27412", city: "Greensboro", state_id: nc_state.id}},
  {name: "The Oaks at Spring Garden", college: uncg,
      description: "An off-campus student apartment community near UNCG.",
      email: nil, phone: "(336)-273-1357", fax: "(336)-273-1374", external_url: "http://www.oaksatspringgarden.net/Locate_Us.html", legacy_url: nil,
      address_attributes: {line1: "2119-A Spring Garden Street", zip: "27403", city: "Greensboro", state_id: nc_state.id}},
  {name: "Spring Place Apartments", college: uncg,
      description: "Spring Place Apartments are just a couple minutes from UNCG's campus.  There's plenty of things to do here, with a pool, basketball court, and even a gym.",
      email: "Spring@PeakCampus.com", phone: "(336)-617-3411", fax: nil, external_url: "http://springplaceapts.info/", legacy_url: "springPlace",
      address_attributes: {line1: "3610 Clifton Road", zip: "27407", city: "Greensboro", state_id: nc_state.id}}
]

# UNCW
uncw = College.find_by_short_name("UNCW")
uncw_communities = [
  {name: "Canterbury Woods", college: uncw,
    description: "This nice community is located in Wilmington. There are a wide variety of activities you can do, like tennis, basketball, volleyball, or going to the entertainment and stores close by. Pets are allowed; however, the policy differs according to the pet.",
    email: nil, phone: "(910) 791-3782", fax: nil, external_url: "http://www.canterburywoodsapartments.com/", legacy_url: "canterburyWoods",
    address_attributes: {line1: "2320 Canterwood Drive", zip: "28401", city: "Wilmington", state_id: nc_state.id}},
  {name: "Clear Run", college: uncw,
      description: "Clear Run apartmens is a quiet community within walking distance of shopping centers and restaurants. There are a pretty good variety of floorplans to choose from, and there are two swimming pools.",    
      email: nil, phone: "(910)-726-2777", fax: nil, external_url: "www.clearrunapts.com", legacy_url: "clearRun",    
      address_attributes: {line1: "5300 New Centre Drive", zip: "28403", city: "Wilmington", state_id: nc_state.id}},
  {name: "Creek at Forest Hills", college: uncw,    
      description: "Creek at Forest Hills has ample parking, without assigned parking. Pets are allowed here, but some breeds may not be allowed. It's minutes from the beach, downtown, and shopping centers.",    
      email: nil, phone: "(910)-726-2777", fax: nil, external_url: "http://www.bellapartmentliving.com/NC/Wilmington/The-Creek/", legacy_url: "creekAtForestHills",
      address_attributes: {line1: "2247 Wrightsville Avenue", zip: "28403", city: "Wilmington", state_id: nc_state.id}},
  {name: "Osprey Landing", college: uncw,
      description: "Osprey Landing is a pleasant apartment community with a pool, gym, and playground. They offer three different floorplans, and there's pretty good closet space too.",
      email: nil, phone: "(910)-430-1529", fax: "(910)-343-1879", external_url: "http://www.ospreylandingapartments.com/", legacy_url: "ospreyLanding",
      address_attributes: {line1: "800 Walden Drive", zip: "28401", city: "Wilmington", state_id: nc_state.id}}
]

# ASU
asu = College.find_by_short_name("ASU")
asu_communities = [
  {name: "University Highlands", college: asu,
      description: "University Highlands apartments is only about two miles from ASU.  It comes fully furnished, plus, they rent individual bedrooms, so you're not responsible for your roommate!",
      email: "info@universityhighlands.com", phone: "(828) 263-0100", fax: "(828) 263-0200", external_url: "http://www.universityhighlands.com/", legacy_url: nil,
      address_attributes: {line1: "289 Ambling Way", zip: "28607", city: "Boone", state_id: nc_state.id}}
]

# UNCC
uncc = College.find_by_short_name("UNCC")
uncc_communities = [
  {name: "901 Place", college: uncc,
      description: "If you want to live in class while you go to school, 901 Place Apartments is for you. Although a little pricy, very few locations can compete with the features offered by 901 Place Apartments. With a large student population, this will feel like a high class dorm.",
      email: "901@peakcampus.com", phone: "704-503-3553", fax: "704-503-3992", external_url: "http://901place.com/", legacy_url: "901PlaceApartments",
      address_attributes: {line1: "901 Forty Niner Avenue", zip: "28262", city: "Charlotte", state_id: nc_state.id}},
  {name: "Colonial Village at Chancellor Park", college: uncc,
        description: "Located close to I-85,I-77, and UNCC. Well maintained landscape and designer style apartments offer one of the finest looking communities around the city. This location can serve as your housing, not only during college, but also once you begin working.",
        email: nil, phone: "(704) 598-0803", fax: nil, external_url: "http://www.colonialprop.com/charlotte/colonial-village-at-chancellor-park/", legacy_url: "colonialVillage",
        address_attributes: {line1: "8215 University Ridge Drive", zip: "28213", city: "Charlotte", state_id: nc_state.id}},
  {name: "Hunt Club", college: uncc,
        description: "Hunt Club is one of the nicest communities around UNCC. With more features than about any community around the area, Hunt Clus still offers a reasonable price.",
        email: nil, phone: "704.412.3450", fax: nil, external_url: "http://www.bellapartmentliving.com/NC/Charlotte/Hunt-Club/", legacy_url: "huntClub",
        address_attributes: {line1: "100 Heritage Pointe Road", zip: "28262", city: "Charlotte", state_id: nc_state.id}},
  {name: "Somerset", college: uncc,
        description: "Somerset is a professionally managed complex, close to University City and uptown. One, two, and three bedrooms are offered. The ground are well maintained and staff strive to make your living experience the best possible. If your focus is price and location, Somerset could be right for you.",
        email: "somerset@tricityrentals.com", phone: "(704) 597-8146", fax: "(704) 596-9911", external_url: "http://www.somersetapartments.com/", legacy_url: "somerset",
        address_attributes: {line1: "1400 Ventura Way Drive", zip: "28213", city: "Charlotte", state_id: nc_state.id}},
  {name: "The Oaks Apartments", college: uncc,
        description: "Upscale apartments at a low price, that is what you get at The Oaks. With 7 different floor plans, you are bound to find what you need. Also makes for an easy drive to UNCC.",
        email: nil, phone: "(704) 596-2303", fax: nil, external_url: "http://www.bellapartmentliving.com/NC/Charlotte/The-Oaks/", legacy_url: "theOaks",
        address_attributes: {line1: "4915 Misty Oaks Blvd.", zip: "28269", city: "Charlotte", state_id: nc_state.id}},
  {name: "Village at Brierfield", college: uncc,
        description: "Villiage at Brierfield is located right by UNCC, around all of the attraction in Charlotte. 1, 2, and 3 bedrooms are available.",
        email: nil, phone: "(704) 688-0085", fax: nil, external_url: nil, legacy_url: "villagrAtBrierfield",
        address_attributes: {line1: "11609 Windy Creek Drive", zip: "28262", city: "Charlotte", state_id: nc_state.id}},
  {name: "Colonial Grand at University Center", college: uncc,
        description: "Located close to the University, Colonial Grand has a good variety of layouts, and some great amenities. Two of the most important being the pool and fitness center which are some of the best in the area. If you do not have a car, the location is a great plus.",
    email: nil, phone: "(704) 548-0844", fax: nil, external_url: "http://www.colonialprop.com/charlotte/colonial-grand-at-university-center/", legacy_url: "colonialGrandAtUniversityCenter",
        address_attributes: {line1: "608 McCullough Drive", zip: "28262", city: "Charlotte", state_id: nc_state.id}}
]

# ECU
ecu = College.find_by_short_name("ECU")
ecu_communities = [
  {name: "Cannon Court", college: ecu,
        description: "Cannon Court has a great location close to campus on Luci Drive, just off of Greenville Blvd. These Dutch-style apartments offer the perfect living experience at the right price.",
        email: "info@wainrightproperties.com", phone: "(252) 756-6209", fax: nil, external_url: "http://wainrightproperties.com/wpm/cannon-court", legacy_url: "cannonCourt",
        address_attributes: {line1: "100 Luci Drive", zip: "27858", city: "Greenville", state_id: nc_state.id}},
  {name: "Cedar Court", college: ecu,
        description: "Cedar Court has a great location close to campus on Cedar Lane, just off of Greenville Blvd. These 980 sqft 2 bedroom, 1 1/2 bath apartments offer the perfect living experience at the right price.",
        email: nil, phone: "(252)-756-6209", fax: nil, external_url: nil, legacy_url: "cedarCourt",
        address_attributes: {line1: "1902 Charles Boulevard", zip: "27858", city: "Greenville", state_id: nc_state.id}},
  {name: "College Park", college: ecu,
        description: "College Park is located close to campus, right on East 10th Street. You have the choice between 590 sqft 1 bedroom or 720 sqft 2 bedroom. With the great location and great price, College Park apartments could be the best place for you.",
        email: nil, phone: "(252) 756-6209", fax: nil, external_url: "http://wainrightproperties.com/wpm/college-park", legacy_url: "collegeParkApartments",
        address_attributes: {line1: "1302 East 10th Street", zip: "27858", city: "Greenville", state_id: nc_state.id}},
  {name: "Cypress Gardens", college: ecu,
        description: "Cypress Gardens Apartments is located close to campus, right on East 10th Street. You have the choice between 716 sqft 1 bedroom or 925 sqft 2 bedroom. With the great location and great price, Cypress Gardens Apartments could be the best place for you.",
        email: nil, phone: "(252) 756-6209", fax: nil, external_url: "http://wainrightproperties.com/wpm/cypress-gardens", legacy_url: "cypressGardens",
        address_attributes: {line1: "1401 East 10th Street", zip: "27858", city: "Greenville", state_id: nc_state.id}},
  {name: "Gladiolus Gardens", college: ecu,
        description: "Gladiolus Gardens Apartments is located close to campus, right on East 10th Street. You have the choice between 612 sqft 1 bedroom, 748 sqft 2 bedroom, or 1200 sqft 3 bedroom. With the great location and great price, Gladiolus Gardens Apartments could be the best place for you.",
        email: nil, phone: "(252) 756-6209", fax: nil, external_url: "http://wainrightproperties.com/wpm/gladiolus-garden", legacy_url: "gladiolusGardens",
        address_attributes: {line1: "1333 East 10th Street", zip: "27858", city: "Greenville", state_id: nc_state.id}}
]

# DUKE
duke = College.find_by_short_name("Duke")
duke_communities = [
  {name: "The Belmont", college: duke,
        description: "The Belmont offers a variety of floor plans close to Duke University.  When you want to relax from studying, go for a quiet stroll around the private lake.",
        email: nil, phone: "(919) 383-0801", fax: nil, external_url: "http://www.livebelmont.com/", legacy_url: nil,
        address_attributes: {line1: "1000 McQueen Drive", zip: "27705", city: "Durham", state_id: nc_state.id}},
  {name: "Crossman Properties", college: duke,
        description: "Crossman Properties offer student living close to Duke's campus.  As an added convenience, tenants can submit maintenance requests online.",
        email: "management@crossmanproperties.com", phone: "919.842.3842", fax: "866.489.2029", external_url: "http://www.crossmanproperties.com/", legacy_url: nil,
        address_attributes: {line1: "762 Ninth St. #591", zip: "27705", city: "Durham", state_id: nc_state.id}},
  {name: "Duke Manor", college: duke,
        description: "Duke Manor offers apartments close to Duke's campus, as well as Duke Medical Center and I-85.",
        email: nil, phone: "919-383-6683", fax: "919-382-5536", external_url: nil, legacy_url: nil,
        address_attributes: {line1: "311 LaSalle Street", zip: "27705", city: "Durham", state_id: nc_state.id}},
  {name: "Duke Villa", college: duke,
        description: "Duke Villa offers solid student apartments near to Duke University.",
        email: nil, phone: "(919) 493-4509", fax: nil, external_url: nil, legacy_url: nil,
        address_attributes: {line1: "1505 Duke University Road", zip: "27701", city: "Durham", state_id: nc_state.id}}
]

(ncsu_communities + unc_communities + uncg_communities + uncw_communities +
asu_communities + uncc_communities + ecu_communities + duke_communities).each do |community_attrs|
  puts "Looking for Community \"#{community_attrs[:name]}\"..."
  community = Community.find_by_name(community_attrs[:name])
  
  if community
    puts "...found it, and updating it!"
    community.update_attributes(community_attrs)
  else
    Community.create!(community_attrs)
    puts "...created it!"
  end
end