#!/usr/bin/ruby
require 'rss'

days = 2
maxage = 60 * 60 * 24 * days
feedfile = "/home/voltron/Prog/feeds.txt"

File.open(feedfile).each do |line| 

  rss = RSS::Parser.parse(line, false)
  puts "==========================================="
  puts "#{rss.channel.title}"
  puts "==========================================="

  rss.items.each do |item|
  age = Time.now - Time.at(item.pubDate) 

    if age < maxage
      puts "[#{item.pubDate}] - #{item.title}, published #{(age / 86400).round} days ago"
      #puts "#{item.enclosure.url}"
    end
  end
end
