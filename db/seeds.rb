## This file should contain all the record creation needed to seed the database with its default values.
## The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
##
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
##   Mayor.create(name: 'Emanuel', city: cities.first)
#
##populate the pre-defined lifecycles and lifecycle phases
#puts "Running seed"
#
#lifecycleData = {       "Waterfall" => ["Requirement Specification", "Design", "Construction", "Integration",
#                                        "Testing", "Installation", "Maintenance"],
#                        "Spiral" => ["Objective Planning", "Analyze Risks", "Engineering", "Iteration Planning"],
#                        "Iterative" => ["Inception", "Elaboration", "Construction", "Transition"],
#                        "Agile" => ["Exploration", "Planning", "Iterations to Release", "Deployment", "Maintenance"],
#                        "Rapid" => ["Requirements", "Design", "Construction", "Cutover"]
#}
#lifecycleData.each_pair { |lifecycle, lifecyclePhaseArray|
#
#  # create a new lifecycle entry
#  newLifecycle = FactoryGirl.create(:lifecycle, name: lifecycle)
#
#  # create lifecycle phases for the new lifecycle
#  lifecyclePhaseArray.each_with_index { |phase, index|
#    FactoryGirl.create(:lifecycle_phase, name: phase, sequenceNumber: index, lifecycle_id:newLifecycle.id)
#  }
#}