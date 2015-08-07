require "sinatra"     # Load the Sinatra web framework

set :sessions, true

get("/") do
  puts request.cookies.inspect
  puts response.set_cookie('Cookie', {:value => "Bread", :path => request.path})
  html = ""

  html.concat("<h1>Hello, World!</h1>")
  html.concat("<ul>")
  html.concat("<li><a href='/waffles'>show me waffles</a></li>")
  html.concat("<li><a href='/waffles/chocolate'>show me chocolate</a></li>")
  html.concat("<li><a href='/bake?baked_good=cookies&count=10'>bake 100 cookies</a></li>")
  html.concat("<li><a href='/bake?baked_good=cronut&count=10'>bake 10 cronuts</a></li>")
  html.concat("<li><a href='/bake?baked_good=cupcakes&count=500'>bake 500 cupcakes</a></li>")
  html.concat("<li><a href='/joke'>Funny Joke</a></li>")
  html.concat("</ul>")

  body(html)
end

get("/waffles") do3
  html = ""

  html.concat("<h1>Waffles are delicious.</h1>")
  html.concat("<p>No their not. Pancakes are much better.</p>")
  
  html.concat("<li><a href='/'>Main Menu</a></li>")
  
  body(html)
end

get("/waffles/chocolate") do
  html = ""

  html.concat("<h1>Chocolate waffles: No one has ever heard of it.</h1>")
  html.concat("<p>Don't believe me?! Have you ever heard of anyone say: Boy, Don't i wish i had some chocolate waffles with me right now.</p>")
  html.concat("<li><a href='/'>Main Menu</a></li>")
  body(html)
end

get("/joke") do
  html = ""
  
  html.concat("<h1>Here's a funny joke.</h1>")
  html.concat("<p>When we're trying to understand atoms. It's basically atoms trying to understand themselves.</p>")
  html.concat("<li><a href='/'>Main Menu</a></li>")
  
  body(html)
end

# Visit, e.g., /bake?baked_good=waffles&count=20
get("/bake") do
  count      = Integer(params["count"])
  baked_good = String(params["baked_good"])

  html = "I'm going to bake #{count} #{baked_good}!"

  html.concat("<ul>")
  count.times do |num|
    html.concat("<li>#{baked_good} number #{num}</li>")
  end
  html.concat("</ul>")

  body(html)
end