json.recipes do
  json.array! @recipes do |recipe|
    json.extract! recipe, :id, :name, :description, :ingredients, :instruction, :tag_list
  end
end
