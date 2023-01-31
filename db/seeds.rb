(0...1000).step(10).each do |i|
  FactoryBot.create(:notification,
                    created_at: Time.current + i.minutes,
                    updated_at: Time.current + i.minutes)
end
