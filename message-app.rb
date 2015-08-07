require "sinatra"     # Load the Sinatra web framework

get("/") do
  html = ""

  html.concat("<h1>Message of The Day</h1>")
  html.concat("<a href='/message'>See today's message.</a>")

  body(html)
end

get("/message") do
  file_contents = File.read("message-of-the-day.txt")

  html = ""
  html.concat("<h1>Message of the Day</h1>")
  html.concat("<p>Today's message is: #{file_contents}")
  html.concat("<ul><a href= '/'>Return to Menu</a><ul>")
  body(html)
end
