namespace :article do
  task fetch: :environment do
    url = 'https://b.hatena.ne.jp/ytkg/bookmark'
    html = Nokogiri::HTML(open(url).read)
    html.css('.bookmark-item').each do |bookmark_item|
      bookmark_id = bookmark_item.css('.centerarticle-reaction')&.attr('id')&.value
      bookmark_item.css('.centerarticle-entry').each do |centerarticle_entry|
        centerarticle_entry_title_a_tag = centerarticle_entry.css('.centerarticle-entry-title a')
        title = centerarticle_entry_title_a_tag.text.strip
        url = centerarticle_entry_title_a_tag&.attr('href')&.value
        description = centerarticle_entry.css('.centerarticle-entry-summary').text
        image_url = centerarticle_entry.css('.centerarticle-entry-image img')&.attr('src')&.value

        article = Article.find_or_initialize_by(bookmark_id: bookmark_id)
        article.update(title: title, url: url, description: description, image_url: image_url)
      end
    end
  end
end
