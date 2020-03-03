# RakutenWebService.configuration do |c|
#   c.application_id = ENV["RAKUTEN_ID"]
#   # c.affiliate_id = '-------------------------------------'
# end
RakutenWebService.configure do |c|
  c.application_id = ENV["RAKUTEN_ID"]
  # c.affiliate_id = 'YOUR_AFFILIATE_ID'
end