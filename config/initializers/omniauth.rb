Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '0dSo4bMLOgdHJAmp9aGSkQwBU', 'IKB7ic494M8m2WhZzZAk2aoasvZga0SzITGy9nqQCmjuunztG0'
  provider :facebook, 'APP_ID', 'APP_SECRET'
end