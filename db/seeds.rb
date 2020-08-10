# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all if Rails.env.development?

require 'open-uri'
require 'nokogiri'


cocktails_url = "https://www.bbcgoodfood.com/recipes/collection/cocktail"
doc = Nokogiri::HTML(open(cocktails_url).read)
cocktails = doc.search(".teaser-item__title a")
url_list = cocktails.map { |n| n.values }
base_url = "https://www.bbcgoodfood.com"
for i in url_list
  cocktail_url = base_url + i[0]
  doc = Nokogiri::HTML(open(cocktail_url).read)
  name = doc.search(".recipe-header__title").text
  description = doc.search(".field-item.even p").text 

  arr_instruction = []
  instruction = doc.search(".responsive-tabs__pane .method .method__list li")
  k = 1
  for i in instruction
    step = "#{k} "+ i.text
    k += 1  
    arr_instruction << step
  end


  arr_ingredients = []
  ingredients = doc.search(".ingredients-list__group li")
  h = 1
  for i in ingredients
    ingredient = "#{h} "+ i.text
    # step = step.CGI.unescapeHTML("test &quot;unescaping&quot; &lt;characters&gt;")
    h += 1
    arr_ingredients << ingredient
  end

  Recipe.create!(name: name, description: description, 
    instruction: arr_instruction, ingredients: arr_ingredients)

  #have both class in one element # .field-item .even child 
end



# doc
# .search('.teaser-item__title a').each do |element|
#   puts element.text.strip
#   puts element.attribute('href').value
