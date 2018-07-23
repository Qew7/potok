module RatesHelper
  def average from: from, to: to
    rates = Rate.where(from: from, to: to)
    buy = rates.average(:buy)
    sell = rates.average(:sell)
    {buy: buy, sell: sell}
    "Среднее значение покупки #{from} => #{to} #{buy} <br/>
    Среднее значение продажи #{from} <= #{to} #{sell} <br/>".html_safe
  end

  def hours_untill_now
    hours = []
    current_hour = Time.now.hour
    current_hour.times do |i|
      i += 1
      hours << (i < 10 ? "0#{i}:00" : "#{i}:00")      
    end
    hours.map(&:to_s)
  end
  def data_set(from: from, to: to)
    {
      label: "#{from} : #{to}",
      data: Rate.where(from: from, to: to).pluck(:sell),
      backgroundColor: "rgba(#{rand(1..255)},123,12,0.5)"
    }.to_json
  end
end
