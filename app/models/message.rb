require 'open-uri'

class Message < ActiveRecord::Base
  validates_presence_of :message, :url
  
  def self.download_news
    # url ku clanku
    # doc.css(".docLstLink a").map { |link| link['href']}[0]
    
    # title ku clanku
    # doc.css(".docLstLink a")[0].content
    
    # clanok
    # doc.css(".artPrevContent")[0].content[22..-2]
    
    doc = Nokogiri::HTML(open("http://www.bratislavskykraj.sk/lstNew.aspx?cpi=1&nid=2"))
    
    (0..5).each do |number|
      url = "http://www.bratislavskykraj.sk/" + doc.css(".docLstLink a").map { |link| link['href']}[number]
      title = doc.css(".docLstLink a")[number].content
      clanok = doc.css(".artPrevContent")[number].content[22..-2]

      message = Message.find_or_initialize_by_url(url)
      message.url = url
      message.message = clanok
      message.title = title
      message.save
    end
  end
end
