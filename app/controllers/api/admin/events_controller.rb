class Api::Admin::EventsController < ApplicationController

  rapid_actions model: Event.includes(:school, :ministry)

  permit_params :location_id,
                :school_id,
                :ministry_id,
                :starts_at,
                :ends_at,
                :description

end
