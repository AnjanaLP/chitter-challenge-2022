class Peep < ActiveRecord::Base
  belongs_to :user

  def self.all_in_reverse_order
    self.all.order(created_at: :desc)
  end
end
