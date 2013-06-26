json.array!(@keywords) do |keyword|
  json.extract! keyword, :name, :cost_per_click, :clicks_per_day, :campaign_id
  json.url keyword_url(keyword, format: :json)
end
