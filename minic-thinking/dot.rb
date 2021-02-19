class Dot

    def nearby_data
      return nearby_data_query(self.to_s)
    end
  
    def nearby_function
      return nearby_function_query(self.to_s)
    end
  
    def default_attack
      max_impulse =  get_max_impulse(nearby_data, nearby_function)
      max_impulse.value > impulse_threshold ? max_impulse.attack : attack_on_hold
    end
  
end