OmniAuth.config.logger = Rails.logger if Rails.env.development?

Rails.application.config.middleware.use OmniAuth::Builder do
 	provider :facebook, '1454967231297065', '8cdc049ee6b948e12c1375c927254f06',:scope => 'email',:info_fields => 'name,email'
 	provider :twitter, '118na1oa3K5AH4nL441St8CFU','i0GVtpsS3Uy7oDZbwpdoKwLFDfpkh99RCL35GSVD2ToEDvHzKv'
 	provider :google_oauth2, '231220596276-qqtgqcr4ehrgk8k5re93ccaedr6rd4hk.apps.googleusercontent.com', 'HmWL-pln7OaLU-yuRmNKCpgm',:scope => 'email',:info_fields => 'name,email'
end