module Candidate
  class RandomizeAttributesService
    
    attr_accessor :array
    
    def initialize(candidate)
      @candidate = candidate
    end

    def random_values
      @array = []

      %w(born_uf born name address telephone).each_with_index do |attr, index|  
        @array[index]    = []
        @array[index][0] = set_attribute @candidate.send(attr)
        @array[index][4] = set_attribute random_candidate.send(attr)
        @array[index][1] = set_attribute random_candidate.send(attr)
        @array[index][2] = set_attribute random_candidate.send(attr)
        @array[index][3] = set_attribute random_candidate.send(attr)
      end

      @array = attr_uniq @array

    end

    private

    def set_attribute attr
      if attr.class == Date
        attr.strftime("%d/%m/%Y")
      elsif attr.to_s.empty? || attr.to_s == "0"
        "Nenhuma das opções"
      else
        attr
      end 
    end

    def random_candidate
      ::Candidate::Cadastre.find(rand(0..400_000)) rescue random_candidate
    end

    def attr_uniq array
      array.each_with_index do |arr, index|
        @array[index] = @array[index].uniq
        @array[index] = @array[index].shuffle
      end
    end

  end
end