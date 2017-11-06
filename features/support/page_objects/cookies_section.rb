class CookiesSection < SitePrism::Section
  element :heading, '.cookie-policy__heading'
  element :body, '.cookie-policy__body'
  element :accept, '#accept-cookie-policy'
end