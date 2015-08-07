require "sinatra"     # Load the Sinatra web framework
require "data_mapper" # Load the DataMapper database library
 
require "./database_setup"
 
class Message
  include DataMapper::Resource
 
  property :id,         Serial
  property :title,      Text 
  property :body,       Text,     required: true
  property :created_at, DateTime, required: true
  property :clicks,     Integer,  default: 0
  property :bumps,      Integer,  default: 0 
  
  def body_length
    self.body.length
  end
end
 
DataMapper.finalize()
DataMapper.auto_upgrade!()
 
get("/") do
  records = Message.all(order: :created_at.desc)
  total = 0
  click_count = Message.clicks
  records.each do |wer|
   total += wer.body_length
  end
  
  erb(:index, { locals: { messages: records, character_count: total, clicks: click_count}})
  
end


post("/delete-all") do
  redirect("/")
end


post("/add_click") do
  Message.clicks += 1
  redirect("/")
end


post("/messages") do
  message_title = params["title"]
  message_body  = params["body"]
  message_time  = DateTime.now
  
  message = Message.create(
    title:      message_title,
    body:       message_body,
    created_at: message_time
  )
 
  if message.saved?
    redirect("/")
  else
    erb(:error)
  end
end