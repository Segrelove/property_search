require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize
    @ref = '17047L-Descombes'
    @price = '4200'
    @google_query = "https://www.google.com/search?source=hp&ei=EYwTXYHbGYqsae-jp6gC&q=%22Location%22+%2B+%22R%C3%A9f%3A+#{@ref}%22+%2B+%22#{@price}+%E2%82%AC%22+site%3Aseloger.com&oq=%22Location%22+%2B+%22R%C3%A9f%3A+18829%22+%2B+%22800+%E2%82%AC%22+site%3Aseloger.com&gs_l=psy-ab.3...828.828..1491...0.0..0.100.136.1j1......0....2j1..gws-wiz.....0.1aPkxlXd8CU"
  end 

  def get_seloger_url
    doc = Nokogiri::HTML(open(@google_query.to_s))
    link = doc.css("a")[17]
    seloger_link = link['href']
    @seloger_query =  seloger_link.slice(0..(seloger_link.index('&sa'))).gsub('/url?q=', "").chop
    puts @seloger_query
  end

  def get_seloger_info
    doc_two = Nokogiri::HTML(open(@seloger_query))
    puts doc_two
  end

  def perform
    get_seloger_url
    get_seloger_info
  end
end