class Player < ActiveRecord::Base
    Player.order(:avg)
    def self.search(search)
      if search != "" && search
        where('year = ?', "#{search}".to_i)
      else
        where(nil)
      end
    end
end
