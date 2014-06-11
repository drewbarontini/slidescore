activate :automatic_image_sizes
activate :directory_indexes
activate :livereload

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

helpers do
  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
