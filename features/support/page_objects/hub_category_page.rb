class HubCategoryPage < BasePage
  set_url '/categories{/category_id}'

  section :category_navigation, '#nav-secondary' do
    elements :cat_links, '.nav-secondary__link'
    element :active_category, '.nav-secondary__link--active'
  end

  element :cat_heading, '.module__heading'

  sections :programmes, '[data-content-type="programme"]' do
    element :programme_image, '.js-lazy-image'
    element :programme_title, '.theme__target'
    element :episode_count, '.theme__meta'
    element :programme_description, '.theme__subtle'
  end


  def load_page(category)
    load(category_id: category)
  end
end
