require 'nokogiri'
require 'open-uri'

Repository.destroy_all

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css("article")

repo_list_items.each do |repo|
  header = repo.css("h1 a").text.split.join(" ")
  description = repo.css("p").text.strip
  contributor_array = repo.css("img").map { |user| user['alt']}
  contributor_tags = contributor_array.join(", ")
  contributor_list = contributor_tags.gsub("@", "")
  programming_language = repo.css("div span.ml-0").text.strip

  repository = {
    name: header,
    description: description,
    language: programming_language,
    contributors: contributor_list
  }

  Repository.create!(repository)
end
