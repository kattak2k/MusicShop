module AlbumsHelper
  def with_status(album)
    title = album.title
    title += content_tag(:small, "hot!") if album.popular?
    title.html_safe
  end
end
