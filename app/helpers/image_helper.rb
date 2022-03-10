module ImageHelper
  def background_image(args = {})
    url = asset_path('persona_photo.png')

    url = args[:url] unless args[:url].nil?

    url = cl_image_path url if args[:cloudinary]

    color_one = 'rgba(0, 0, 0, 0)'
    color_two = 'rgba(0, 0, 0, .1)'

    "background-image: linear-gradient(#{color_one}, #{color_two}), url(#{url})"
  end
end
