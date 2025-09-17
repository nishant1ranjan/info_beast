json.extract! blog, :id, :title, :published, :published_at, :admin_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
