class Player < ActiveRecord::Base
    Player.order(:avg)
end
