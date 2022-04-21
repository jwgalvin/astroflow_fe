class DailyFlowChart
  attr_reader :date, :bloating, :cramps,
              :emotions, :flow_status

  def initialize(data)
    @date = data[:date]
    @bloating = data[:bloating]
    @cramps = data[:cramps]
    @emotions = data[:emotions]
    @flow_status = data[:flow_status]
  end 
end 