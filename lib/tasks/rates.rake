require 'open-uri'

namespace :rates do
  desc "Get actual currency rates"
  task update: :environment do
    response = JSON.load(open('https://www.tinkoff.ru/api/v1/currency_rates'))
    n_rates = NeededRate.all
    dp_rates = response['payload']['rates'].select do |r| 
      r['category'] == 'DepositPayments' &&
      n_rates.pluck(:from).include?(r['fromCurrency']['name']) &&
      n_rates.pluck(:to).include?(r['toCurrency']['name'])
    end
    dp_rates.each do |r|
      Rate.create!(from: r['fromCurrency']['name'], to: r['toCurrency']['name'], buy: r['buy'], sell: r['sell'])
    end
  end
  desc "Delete inactual currency rates"
  task clear: :environment do
    Rate.destroy_all
  end
end
