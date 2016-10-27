class Api::Admin::EventsController < ApplicationController

  rapid_actions

  permit_params :location_id,
                :school_id,
                :ministry_id,
                :starts_at,
                :ends_at,
                :description

end
