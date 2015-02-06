#!/usr/bin/ruby
require 'rss'
require 'open-uri'

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

      filename = item.enclosure.url.scan(/[^\/]*.mp3/)

      File.open(filename.to_s, 'wb') do |file|
        file.write open(item.enclosure.url).read
      end

    end
  end
end
