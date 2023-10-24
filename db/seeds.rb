
# Just populating for this demo app, not really how we would seed
care_crew = HomeService.create(name: "Caring Crew", rate: 1750, description: "Caring Crew is a home care agency in vour area
prides itselt on taking all of the administrative burden off of family caregivers so they can focus
on providing great care to their loved ones", latitude: 40.801288, longitude: -73.961145)

care_crew.save

happy_care = HomeService.create(name: "Happy Care", rate: 1825, description: "Happy Care is a home care agency in vour area
prides itselt on taking all of the administrative burden off of family caregivers so they can focus
on providing great care to their loved ones", latitude: 40.728262, longitude: -74.051080)

happy_care.save


senior_help = HomeService.create(name: "Senior Help", rate: 1960, description: "Senior Help is a home care agency in vour area
prides itselt on taking all of the administrative burden off of family caregivers so they can focus
on providing great care to their loved ones", latitude: 40.682771, longitude: -73.946382)

senior_help.save


