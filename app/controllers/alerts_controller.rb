class AlertsController < ApplicationController

  before_filter :find_alerts

  respond_to :json

  def index 
    respond_with(@alerts)
  end

  def find_alerts
    if params[:position_id]
      @alerts = Alert.find_all_by_position_id(params[:position_id])
    end
  end

end