class FlowchartController < ApplicationController

  def index
  end

  def new
    @user_email = session[:access_token]
  end
  
  # def create 
  #   FlowchartFacade.send_flowchart(user_email, flow_chart_params)
  # end 

  def edit 
    @user_email = session[:access_token]
  end 

  private 

  def flow_chart_params
    params.permit(:date, :bloating, :cramps, :emotions, :flow_status)
  end
end
