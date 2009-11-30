atom_feed do |feed|  
  feed.title("Ilmo 2.0 newsfeed")
  feed.updated(@stories.first.updated_at)
 
  @stories.each do |story|
    feed.entry(story, :url => "http://lolcathost") do |entry|
      entry.title("luls")
      entry.content(story.message)
      entry.updated(story.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author do |author|
        author.name("Ilmo 2.0")
      end
    end
  end
end
