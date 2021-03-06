describe Private::OrderAsksController, type: :controller do
  let(:member) do
    create(:member, :verified_identity).tap do |m|
      m.get_account(:btc).update_attributes(balance: '20')
    end
  end

  let(:market) { Market.find(:btcusd) }
  let(:params) do
    { market_id: market.id,
      market:    market.id,
      ask:       market.base_unit,
      bid:       market.quote_unit,
      order_ask: { ord_type: 'limit', origin_volume: '12.13', price: '2014.47' } }
  end

  context 'POST :create' do
    it 'should create a sell order' do
      expect do
        post :create, params, member_id: member.id
        expect(response).to be_success
        expect(response.body).to eq '{"result":true,"message":"Success"}'
      end.to change(OrderAsk, :count).by(1)
    end

    it 'should set order source to Web' do
      post :create, params, member_id: member.id
      expect(assigns(:order).source).to eq 'Web'
    end
  end

  context 'POST :clear' do
    it 'should cancel all my asks in current market' do
      o1 = create(:order_ask, member: member, market: market)
      o2 = create(:order_ask, member: member, market: Market.find(:dashbtc))
      expect(member.orders.size).to eq 2

      post :clear, { market_id: market.id }, member_id: member.id
      expect(response).to be_success
      expect(assigns(:orders).size).to eq 1
      expect(assigns(:orders).first).to eq o1
    end
  end
end
