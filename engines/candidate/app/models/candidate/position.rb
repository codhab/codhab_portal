module Candidate
	class Position < ActiveRecord::Base
		self.table_name = 'extranet.candidate_positions'
	 
    belongs_to :program

    scope :by_program, -> (type) { where(program_id: type)}
    
    scope :rii, -> { where(program_id: 1)}
    scope :rie, -> { where(program_id: 2)}
    scope :old, -> { where(program_id: 7)}
    scope :vulnerable, -> { where(program_id: 4)}
    scope :special, ->    { where(program_id: 5)}

    def formated_position; "#{self.position} º"; end;

    def formated_zone; "Faixa #{self.zone}"; end;

    def self.merge_hash
      item = {}

      self.all.each do |p|
        item[":#{p.created_at.strftime("%Y-%m-%d")}"] = p.position
      end

      item
    end


    def self.library_configs(title = nil)

      {
        hAxis: {title: "Histórico"},
        vAxis: {title: "Posição"}, 
        title: title 
      }

    end

    def self.positions_to_chart
      
      @collection = []

      ::Candidate::Program.all.each_with_index do |program, index|
        @positions = self.where(program_id: program.id)
        if @positions.present?
          @base_hash = {
            name: program.name, 
            data: @positions.merge_hash
          } 

          @collection << @base_hash
        end
      end

      @collection

    end

  end
end