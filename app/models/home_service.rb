class HomeService < ApplicationRecord

    # todo add location model, and add address and move longitude and latitude to address model
    
   def dollars_and_cents
      self.rate/100.00
   end
end
