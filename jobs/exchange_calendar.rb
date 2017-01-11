require 'net/http'
require 'icalendar'
require 'open-uri'


exchange = ""
calendars = {}

SCHEDULER.every '15s', :first_in => 0 do |job|
cal_name = "MyCal"
cal_uri = exchange

ics  = open(cal_uri) { |f| f.read }
cal = Icalendar::Calendar.parse(ics).first
events = cal.events


now = Time.now
events = events.select{ |e| e.dtend.to_time.utc > now }


# sort by start time
events = events.sort{ |a, b| a.dtstart.to_time.utc <=> b.dtstart.to_time.utc }[0..1]


events = events.map do |e|
  {
      title:  e.summary,
      start: e.dtstart.to_datetime.strftime("%d-%b  %H:%M"),
      end: e.dtend.to_datetime
  }
end
puts events
send_event("exchange_calendar", {events: events})

end