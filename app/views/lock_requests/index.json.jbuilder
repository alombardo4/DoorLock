json.array!(@lock_requests) do |lock_request|
  json.extract! lock_request, :id, :isLocked, :willLock, :created_at
  json.user User.find(lock_request.user).username
  json.url lock_request_url(lock_request, format: :json)
end
