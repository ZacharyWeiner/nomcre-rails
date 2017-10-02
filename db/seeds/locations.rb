asia = Location.create!(name: "Asia", location_type: 'Region')
china = Location.create(name: 'China', parent_id: asia.id, location_type: 'Country')
beijing = Location.create(name: 'Beijing', parent_id: china.id, location_type: 'City')

#More Asian Cities Here


africa = Location.create!(name: "Africa", location_type: 'Region')
egypt = Location.create!(name: "Egypt", parent_id: africa.id, location_type: 'Country')
cairo = Location.create!(name: "Cairo", parent_id: egypt.id, location_type: 'City')

#More African Cities Here

middle_east = Location.create!(name: "Middle East", location_type: 'Region')
jordan = Location.create!(name: "Jordan", parent_id: middle_east.id, location_type: 'Country')
amman = Location.create!(name: "Amman", parent_id: jordan.id, location_type: 'City')

#More Middle Eastern Cities Here


europe = Location.create!(name: "Europe", location_type: 'Region')
france = Location.create!(name: "France", parent_id: europe.id, location_type: 'Country')
paris = Location.create!(name: "Paris", parent_id: france.id, location_type: 'City')

#more European Cities Here


north_america = Location.create!(name: "North America", location_type: 'Region')
usa = Location.create!(name: "USA", parent_id: north_america.id, location_type: 'Country')
nyc = Location.create!(name: "NYC", parent_id: usa.id, location_type: 'City')
#more NA Cities Here

latin_america = Location.create!(name: "Latin America", location_type: 'Region')
colombia = Location.create!(name: "Colombia", parent_id: latin_america.id, location_type: 'Country')
medellin = Location.create!(name: "Medellin", parent_id: colombia.id, location_type: 'City')

#more latin american cities here

australia = Location.create!(name: "Australia", location_type: 'Region')
sydney = Location.create!(name: "Sydney", parent_id: australia.id, location_type: 'City')

