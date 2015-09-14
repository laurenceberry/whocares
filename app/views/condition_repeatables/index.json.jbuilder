json.array!(@condition_repeatables) do |condition_repeatable|
  json.extract! condition_repeatable, :id, :name, :content, :condition_id
  json.url condition_repeatable_url(condition_repeatable, format: :json)
end
