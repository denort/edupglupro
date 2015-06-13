json.array!(@clipped_files) do |clipped_file|
  json.extract! clipped_file, :id, :name, :lecture_id
  json.url clipped_file_url(clipped_file, format: :json)
end
