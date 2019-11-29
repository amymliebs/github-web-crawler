require 'nokogiri'
require 'open-uri'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css("article")

js_count = 0
lang_na_array = ["NA"]
lang_na_list = lang_na_array.join(", ")

repo_list_items.each do |repo|
  header = repo.css("h1 a").text.split.join(" ")
  description = repo.css("p").text.strip
  contributor_array = repo.css("img").map { |user| user['alt']}
  contributor_tags = contributor_array.join(", ")
  contributor_list = contributor_tags.gsub("@", "")
  programming_language = repo.css("div span.ml-0").text.strip

  if programming_language == ""
    lang_na_array << header
    programming_language = "NA"
  end

  if programming_language == "JavaScript"
    js_count += 1
  end

  puts ""
  puts header
  puts "==========================="
  puts description
  puts "\nWritten primarily in #{programming_language}"
  puts "\nPrimary Contributor(s): #{contributor_list}"
  puts "\n\n---------------------------"
  puts ""

end

puts "JavaScript Repository Count: #{js_count}"
puts "Repositories with unspecified primary programming language: #{lang_na_list}"
