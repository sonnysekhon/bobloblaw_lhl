Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '0dSo4bMLOgdHJAmp9aGSkQwBU', 'IKB7ic494M8m2WhZzZAk2aoasvZga0SzITGy9nqQCmjuunztG0'
  # binding.pry
  provider :facebook, '1456094711366730', 'fc3339abca61d723cd89d3379acb4766', scope: 'public_profile, email', info_fields: 'id,name,link, email'
end