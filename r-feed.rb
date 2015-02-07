#!/usr/bin/ruby
require 'rss'
require 'open-uri'

days = 2
maxage = 60 * 60 * 24 * days
feedfile = "/home/voltron/Prog/feeds.txt"
poddir = "/home/voltron/pod/"

File.open(feedfile).each do |line| 

  rss = RSS::Parser.parse(line, false)
  puts "\n==========================================="
  puts "= #{rss.channel.title}"

  rss.items.each do |item|
  age = Time.now - Time.at(item.pubDate) 

    if age < maxage
      puts "\n[#{item.pubDate}] - #{item.title}, published #{(age / 86400).round} days ago."

      filename = item.enclosure.url.scan(/[^\/]*.mp3/).last.to_s

      if File.file?("#{poddir}/#{filename}") 
        puts "*** #{filename} exists, skipping...\n"
      else
        puts "*** Downloading #{filename}\n"
        File.open("#{poddir}/#{filename}", 'wb') do |file|
          file.write open(item.enclosure.url).read
        end
      end
    end
  end
  puts "==========================================="
end
