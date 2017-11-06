class ProgrammePage < BasePage
  
  sections :episodes, '[data-content-type="episode"]' do
    element :epi_image, '.js-lazy-picture'
    element :epi_number, '.theme__target'
    element :broadcast_date, '.theme__meta'
    element :epi_desc, '.tout__summary.theme__subtle'
    element :latest_badge, '.tout__image-overlay'
  end
end
