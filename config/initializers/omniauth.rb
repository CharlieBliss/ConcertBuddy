Rails.application.config.middleware.use OmniAuth::Builder do
  provider :eventbrite, '2VGT723BJZKJYWHIB3','3NLAE72WNQLDLE6VKWJ44VNDE3J3FYRRL2LNJLSZ4LEZSVCTMZ'
  provider :spotify, 'c2ad8981609d4b11ab13252b21847689', '9c36827575bd4defb36000e264e1509d', scope: 'playlist-read-private user-read-private user-read-email'
end