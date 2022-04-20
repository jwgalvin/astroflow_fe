class FlowchartService  
  class << self 
    def call_to_send_flowchart(email, flow_chart)
      response = conn.post("/api/v1/users/daily_flow_chart?email=#{@user_email}&daily_flow_chart=#{flow_chart}")
    end 

    private 

    def conn 
      Faraday.new(url: "http://localhost:5000")
    end 
  end 
end 