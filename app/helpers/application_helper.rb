# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 def time_since time
   delta = Time.now - time
   minutes = (delta/60).floor
   hours = (minutes/60).floor
   days = (hours/24).floor
   weeks = (days/7).floor
   months = (days/30).floor
   
   case delta
   when 0..60: "A few seconds ago"
   when 61..180: "A few minutes ago"
   when 180..3600: "#{pluralize minutes, 'minute'} ago"
   when 3601..86400: "About #{pluralize hours, 'hour'} ago"
   when 86401..604800: "About #{pluralize days, 'day'} ago"
   when 604801..2678400: "About #{pluralize weeks, 'week'} ago"
   else "About #{pluralize month, 'month'} ago"
   end
 end
end
