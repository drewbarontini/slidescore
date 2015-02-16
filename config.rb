# ====================================
#   Activate Plugins
# ====================================

activate :automatic_image_sizes
activate :directory_indexes
activate :livereload

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 10']
  config.cascade = false
end

# ====================================
#   Ignore Files & Directories
# ====================================

ignore 'assets/javascripts/vendor/*'

# ====================================
#   Global Variables
# ====================================

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# ====================================
#   Helpers
# ====================================

helpers do
  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

# ====================================
#   Build Configuration
# ====================================

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
