namespace :faker do
  desc "it does a thing"
  task whoisyourdaddy: :environment do
    
    Member.find_each do |member|
      member.update_column(:level, :identity_verified)
      
      # Some Deposits
      #
      3.times do
        FactoryBot.create(:deposit_btc, member: member)
        FactoryBot.create(:deposit_usd, member: member)
      end
      
      # submit, accept, check deposits
      #
      member.reload.deposits.lazy.each(&:submit!).each(&:accept!).each(&:check!)
      
      # Trades
      #
      3.times do
        ask = FactoryBot.create(:order_ask, member: member)
        bid = FactoryBot.create(:order_bid, member: member)
        FactoryBot.create(:trade, ask: ask, bid: bid)
      end
    end
  end
end
