class BasePage < SitePrism::Page
  section :cookies, CookiesSection, '#cookie-policy'
  section :primary_nav, PrimaryNavigationSection, '#nav-primary'
  section :footer, FooterSection, '#footer'
end