def attach_to_post(filename, post:)
  filename = "#{filename}.png"
  file = File.open(Rails.root.join("db/seeds/posts/images", filename))
  post.image.attach(io: file, filename: filename, content_type: "image/png")
end

posts = YAML.load_file(Rails.root.join("db/seeds/posts/posts.yml"))
posts.each do |attrs|
  Post.find_or_create_by(title: attrs["title"]) do |post|
    post.body = attrs["body"]
    attach_to_post(attrs["image"], post:)
  end
end
