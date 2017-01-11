require_relative '../lib/01_rally_defect_count.rb'


SCHEDULER.every '1m', first_in: 0 do |job|
  v1defects = DefectCount.new
  current_defects = v1defects.get_defect_list
	send_event('numdefects', { current: "#{current_defects}" })
end
