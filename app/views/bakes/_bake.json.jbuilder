json.extract! bake, :id, :baked_on, :total_carbs, :total_weight, :recipe_id, :container_id, :created_at, :updated_at
json.url bake_url(bake, format: :json)
