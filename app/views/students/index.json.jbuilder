json.array!(@student) do |student|
  json.extract! student, :id, :title, :body
  json.url student_url(student, format: :json)
end
