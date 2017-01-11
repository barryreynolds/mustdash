###
Batman.mixin Batman.Filters,

  startText: (str_start)->
    now = moment.utc()
    start = moment.unix(str_start)
    "#{start.from(now)}"

class Dashing.GoogleCalendar extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.


Batman.mixin Batman.Filters,

  startText: (str_start)->
    now = moment.utc()


    start = moment(str_start)

    "#{start.from(now)}"

class Dashing.ExchangeCalendar extends Dashing.Widget
###

class Dashing.ExchangeCalendar extends Dashing.Widget

  onData: (data) =>
    event = rest = null
    getEvents = (first, others...) ->
      event = first
      rest = others

    getEvents data.events...

    start = moment(event.start)
    end = moment(event.end)

    @set('event',event)
    @set('event_date', start.format('dddd Do MMMM'))
    @set('event_times', start.format('HH:mm') + " - " + end.format('HH:mm'))

    next_events = []
    for next_event in rest
      start = moment(next_event.start)
      start_date = start.format('Do MMM')
      start_time = start.format('HH:mm')

      next_events.push { summary: next_event.summary, start_date: start_date, start_time: start_time }
    @set('next_events', next_events)
