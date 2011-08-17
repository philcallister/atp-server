class AlertsController < ApplicationController

  before_filter :find_alerts

  respond_to :json

  def index 
    respond_with(@alerts)
  end

  def find_alerts
    if params[:position_id]
      @alerts = Alert.where(:position_id => params[:position_id]).order('date DESC')
    end
  end

end