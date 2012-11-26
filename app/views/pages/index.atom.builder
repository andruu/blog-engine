atom_feed do |feed|
  feed.title("andru.co")
  feed.updated(@pages[0].created_at) if @pages.length > 0

  @pages.each do |post|
    feed.entry(post, url: page_url(post.slug)) do |entry|
      entry.title(post.title)
      entry.content(markdown(post.body), :type => 'html')

      entry.author do |author|
        author.name("Andrew Weir")
      end
    end
  end
end