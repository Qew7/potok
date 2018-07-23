class RatesController < ApplicationController
  def index
    @needed_rates = NeededRate.all
  end
end
