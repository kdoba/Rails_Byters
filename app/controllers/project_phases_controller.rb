class ProjectPhasesController < ApplicationController

  def self.getProjectPhases (projectId)
    projectPhases = ProjectPhase.where :project_id => projectId
    projectPhases.to_a
  end
end
