require 'json'
require 'net/http'

class PositionsController < ApplicationController

  include Quotes

  respond_to :json

  def index
    @positions = Position.find_all_open_with_recent_alert
    do_render
  end

  def active
    @positions = Position.find_active_open_with_recent_alert
    do_render
  end

  def core
    @positions = Position.find_core_open_with_recent_alert
    do_render
  end

  def do_render
    # TODO Hack slash here...this should move into a job that runs every
    # x-minutes and updates the positions directly into DB
    @positions.each do |position|
      quote(position)
    end
    respond_with @positions do |format|
      format.json { render :index }
    end
  end

end