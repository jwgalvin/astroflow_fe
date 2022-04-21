class FlowchartService  
  class << self 
    def call_to_create_flowchart(email, flow_chart)
      response = conn.post("/api/v1/users/daily_flow_chart?email=#{email}&daily_flow_chart=#{flow_chart}")
    end 

    def call_to_update_flowchart(email, date, flow_chart)
      response = conn.patch("/api/v1/users/daily_flow_chart?email=#{email}&date=#{date}&daily_flow_chart=#{flow_chart}")
    end 

    private 

    def conn 
      Faraday.new(url: "http://localhost:5000")
    end 
  end 
end 