json.posts do
  json.array! @posts do |post|
    json.extract! post, :id, :image, :description, :user_id, :recipe_id
end
end
