require 'rails_helper'

RSpec.describe FlowchartService do
  it "returns flow chart" do
    email = 'test@gmail.com'
    flow_chart = {bloating: true, cramps: false, emotions: "N/A", flow_status: :heavy}
    # search = FlowchartService.call_to_send_flowchart(email, flow_chart)
    # binding.pry
    # expect(search).to be_a Hash
    #once we get flowchart working, this test will take care of flow chart services
  end
end
