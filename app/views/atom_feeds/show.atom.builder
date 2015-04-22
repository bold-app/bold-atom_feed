xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title   site.name
  xml.link    rel: "self", href: atom_feed_url
  xml.link    rel: "alternate", href: root_url
  xml.id      root_url
  if (favicon = site.plugin_value(:atom_feed, :favicon_url)).present?
    xml.icon    favicon
  end
  xml.updated (@posts.first ? @posts.first.post_date : Time.now).xmlschema
  xml.author do
    if (author = site.plugin_value(:atom_feed, :author_name)).present?
      xml.name author
    else
      xml.name site.name
    end
  end
  xml.generator(uri: Bold::application_url) { xml.text! Bold::application_name }
  @posts.each do |post|
    xml.entry do
      url = post.public_url
      xml.id url
      xml.link rel: "alternate", href: url
      xml.title post.title
      xml.updated (post.last_update || post.post_date).xmlschema
      author = post.author if post.respond_to?(:author)
      xml.author do
        xml.name(author)
        xml.email(author.email) unless author.hide_email
      end if author
      xml.content type: "html" do
        xml.text! post.body_html
      end
    end
  end
end
