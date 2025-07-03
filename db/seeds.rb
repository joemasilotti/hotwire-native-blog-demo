def attach_to_post(filename, post:)
  filename = "#{filename}.png"
  file = File.open(Rails.root.join("db/seeds/posts/images", filename))
  post.image.attach(io: file, filename: filename, content_type: "image/png")
end

user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "password"
end

posts = YAML.load_file(Rails.root.join("db/seeds/posts/posts.yml"))
posts.each do |attrs|
  Post.find_or_create_by!(title: attrs["title"]) do |post|
    post.body = attrs["body"]
    attach_to_post(attrs["image"], post:)
  end
end

comments = YAML.load_file(Rails.root.join("db/seeds/comments/comments.yml"))
comments.each do |attrs|
  if (post = Post.find_by(title: attrs["post_title"]))
    author = attrs["author"]
    Comment.find_or_create_by!(post:, author:) do |comment|
      comment.body = attrs["body"]
    end
  end
end
