module BooksHelper
  def img_from_amazon(amazon_id, options = {})
    size = options[:size] || "130x160"
    url = "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZ.jpg"
    image_tag(url, size: size)
  end
end
