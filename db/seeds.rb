# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'

f = File.open(File.join(Rails.root, 'db', '1998statistics.xml'))
doc = Nokogiri::XML(f)
f.close
players = doc.xpath("//PLAYER[POSITION='Designated Hitter']")
year = doc.xpath("//YEAR")
year = year[0].content 
players.each do |player|
  #puts player
  surname = player.xpath("SURNAME")
  surname = surname[0].content
  #puts surname

  given_name = player.xpath("GIVEN_NAME")
  given_name = given_name[0].content
  #puts given_name

  at_bats = player.xpath("AT_BATS")
  ab = at_bats[0].content.to_f
  #puts ab

  runs = player.xpath("RUNS")
  runs = runs[0].content.to_f
  #puts runs

  hits = player.xpath("HITS")
  hits = hits[0].content.to_f
  #puts hits

  doubles = player.xpath("DOUBLES")
  doubles = doubles[0].content.to_f
  #puts doubles

  triples = player.xpath("TRIPLES")
  triples = triples[0].content.to_f
  #puts triples

  home_runs = player.xpath("HOME_RUNS")
  hr = home_runs[0].content.to_f
  #puts hr

  rbi = player.xpath("RBI")
  rbi = rbi[0].content.to_f
  #puts rbi

  steals = player.xpath("STEALS")
  sb = steals[0].content.to_f
  #puts sb

  sacrifice_flies = player.xpath("SACRIFICE_FLIES")
  sf = sacrifice_flies[0].content.to_f
  #puts sf

  walks = player.xpath("WALKS")
  walks = walks[0].content.to_f
  #puts = walks

  hit_by_pitch = player.xpath("HIT_BY_PITCH")
  hbp = hit_by_pitch[0].content.to_f
  #puts hbp
  
  avg = hits/ab
  obp = (hits + walks + hbp)/(ab-hr+sf)
  slp = (hits + doubles + triples*2+hr*3)/ab
  ops = obp+slp
  #puts "#{surname} #{given_name} #{year}"
  #puts"#{avg.round(2)}\t#{hr.round(2)}\t#{rbi.round(2)}\t#{runs.round(2)}\t#{sb.round(2)}\t#{ops.round(2)}"
  Player.create(year: year, surname: surname, given_name: given_name, avg: avg, hr: hr, rbi: rbi, runs: runs, sb: sb, ops: ops)
end

