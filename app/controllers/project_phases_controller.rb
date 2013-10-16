# * *Filename*    : project_phases_controller.rb
# * *Date*        : 09-30-2013
# * *Team*        : Rails Byters
# * *Description* : This controller provides an api to query and create project phases in PET
#
class ProjectPhasesController < ApplicationController

  # This function accept a project id and returns all project phases that belongs to the given project
  # in the database.
  # * *Args*    :
  #   - <tt>projectId:number</tt> - the id of a project in project table
  # * *Returns* :
  #   - an Array of projectPhases that belongs to the given project
  #def self.getProjectPhases (projectId)
  #  projectPhases = ProjectPhase.where :project_id => projectId
  #  projectPhases.to_a
  #end
end
