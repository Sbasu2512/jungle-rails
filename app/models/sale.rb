class Sale < ActiveRecord::Base
  def self.active
    Sale.all
  end
end
