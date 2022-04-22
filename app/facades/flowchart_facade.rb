class FlowchartFacade
  class << self
    def send_flowchart(email, flow_chart)
      FlowchartService.call_to_create_flowchart(email, flow_chart)
    end

    def update_flowchart(email, date, flow_chart)
      FlowchartService.call_to_update_flowchart(email, date,flow_chart)
    end

    def chart_list(email)
      charts = FlowchartService.get_all_charts(email)
      if charts != {"error": "No Data Available"}
        poros = charts.each do |chart|
          #binding.pry
          DailyFlowChart.new(
            date: chart["date"],
            bloating: chart["bloating"],
            cramps: chart["cramps"],
            emotions: chart["emotions"],
            flow_status: chart["flow_status"]
            )
        end
      end
    end

    def flow_chart(flow_chart_data)
      DailyFlowChart.new(
            date: flow_chart_data["date"],
            bloating: flow_chart_data["bloating"],
            cramps: flow_chart_data["cramps"],
            emotions: flow_chart_data["emotions"],
            flow_status: flow_chart_data["flow_status"]
      )
    end
  end
end
