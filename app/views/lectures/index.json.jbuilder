json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :course_id, :name, :user_id
  json.url lecture_url(lecture, format: :json)
end
