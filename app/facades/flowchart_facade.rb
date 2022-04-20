class FlowchartFacade 
  class << self 
    def send_flowchart(email, flow_chart)
      FlowchartService.call_to_send_flowchart(email, flow_chart)
    end 
  end 
end 