FactoryGirl.define do
  sequence :soc_network_auth_hash do
    {
      :provider => 'soc_network',
      :uid => '1234567',
      :info => {
        :nickname => 'jbloggs',
        :email => 'joe@bloggs.com',
        :name => 'Joe Bloggs',
        :first_name => 'Joe',
        :last_name => 'Bloggs'
      }
    }
  end
end