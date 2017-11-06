class FooterSection < SitePrism::Section
  section :channel_list, '.footer__channels' do
    elements :channels, '.footer__channel'
  end

  section :section_grid, '.footer__sections.grid' do
    sections :grid_block, '.footer__section grid__item' do
      element :heading, '.footer__heading'
      element :item_link, '.footer__item'
    end
  end

  section :legal, '.footer__legal' do
    element :heading, 'h3'
    elements :legal_copy, '.footer__legal-p'
    element :cookie_policy, '.underline'
  end
end