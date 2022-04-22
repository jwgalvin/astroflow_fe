class FlowchartController < ApplicationController

  def index
    user = session[:access_token]
    @all_charts = FlowchartFacade.chart_list(user)
    #binding.pry
    if @all_charts == nil
      redirect_to "/flowchart/new"
    end
    #binding.pry
  end

  def new
    @user_email = session[:access_token]
  end

  def create
    user_email = session[:access_token]
    #binding.pry
    flow_object = FlowchartFacade.flow_chart(flow_chart_params).to_json
    FlowchartFacade.send_flowchart(user_email, flow_object)
    redirect_to '/flowchart'
  end

  def edit
    @user_email = session[:access_token]
  end

  def update
    user_email = session[:access_token]
    flow_object = FlowchartFacade.flow_chart(flow_chart_params).to_json
    date = params[:date]
    FlowchartFacade.update_flowchart(user_email, date, flow_object)
    redirect_to '/flowchart'
  end

  private

  def flow_chart_params
    params.permit(:date, :bloating, :cramps, :emotions, :flow_status)
  end
end
