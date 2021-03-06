class FlowchartService
  class << self
    def call_to_create_flowchart(email, flow_chart)
      #binding.pry
      response = conn.post("/api/v1/users/daily_flow_chart?email=#{email}&daily_flow_chart=#{flow_chart}")
    end

    def call_to_update_flowchart(email, date, flow_chart)
      response = conn.patch("/api/v1/users/daily_flow_chart?email=#{email}&date=#{date}&daily_flow_chart=#{flow_chart}")
    end

    def get_all_charts(email)
      response = conn.get("/api/v1/users/daily_flow_chart/all?email=#{email}")

      parse_data(response)
    end
    private

    def conn
      Faraday.new(url: "http://astro-flow-be.herokuapp.com")
    end

    def parse_data(response)
      data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
