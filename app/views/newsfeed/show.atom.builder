atom_feed do |feed|  
  feed.title("Ilmo 2.0 newsfeed")
  feed.description("Latest cool happenings at ilmo 2.0")
  feed.updated(@stories.first.updated_at)
 
  @stories.each do |story|
    feed.entry(story, :url => root_url) do |entry|
      entry.title(story.message)
      entry.updated(story.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author do |author|
        author.name("Ilmo 2.0")
      end
    end
  end
end
