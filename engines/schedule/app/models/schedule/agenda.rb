module Schedule
  class Agenda < ActiveRecord::Base
    self.table_name = "extranet.schedule_agendas"

    has_many :agenda_schedules
    belongs_to :program, class_name: "Candidate::Program"

    enum restriction_type: ['nenhuma', 'existente', 'inexistente']



    scope :regularization,  -> { where(program: 3)}
    scope :habitation,      -> { where(program: 1)}
    scope :finance,         -> { where(program: 8)}
    scope :entity,          -> { where(program: 2)}
    scope :active,          -> { where(status: true).order(:title)}

    validates :program, :description, presence: true
    validates :attendants, :attendance_time, numericality: true, presence: true
    validates :title, presence: true, uniqueness: true
    validates :lunch_attendants, numericality: true, presence: true, if: :lunch?

    validates_date :start, before: :end, presence: true
    validates_date :end, presence: true

    validates_time :start_hour, presence: true
    validates_time :end_hour, presence: true

    validates_time :lunch_start, before: :lunch_end, presence: true, if: :lunch?
    validates_time :lunch_end, presence: true, if: :lunch?


    def hours(date)
      hour_array      = Array.new
      lunch_array     = Array.new

      start_hour  = self.start_hour
      last_hour   = self.end_hour  - attendance_time.minutes

      lunch_ended_at  = lunch_end - attendance_time.minutes
      
      if lunch? && (self.lunch_attendants == 0)
        
        lunch_started_at_to_end = lunch_start - attendance_time.minutes

        time_iterate(start_hour, lunch_started_at_to_end, attendance_time.minutes) { |t| hour_array.push t.strftime('%H:%M') }
        time_iterate(lunch_end, last_hour, attendance_time.minutes) { |t| hour_array.push t.strftime('%H:%M') }
      
      elsif lunch? && (self.lunch_attendants > 0) 
      
        time_iterate(start_hour, last_hour, attendance_time.minutes) { |t| hour_array.push t.strftime('%H:%M') }
        time_iterate(lunch_start, lunch_ended_at, attendance_time.minutes) { |t| lunch_array.push t.strftime('%H:%M') }
      
      else

        time_iterate(start_hour, last_hour, attendance_time.minutes) { |t| hour_array.push t.strftime('%H:%M') }
      end 

      attendance_iterate(hour_array, lunch_array, self.attendants, self.lunch_attendants, date)
    end


    private

    def attendance_iterate(hour = [], lunch = [], attendant = 0, lunch_attendant = 0, date = nil)


      if !date.nil?
        Array.new(hour.count) do |i|

          if date.wday == 6 && Time.parse(hour[i]) > Time.parse('12:00')
            'esgotado'
          elsif lunch.include? hour[i]
            'esgotado'
          else
            (schedules_time(hour[i], date) >= attendant) ? 'esgotado' : hour[i]
          end

        end
      else
        []
      end
    end

    def time_iterate(start_time, end_time, step, &block)
      begin
        yield(start_time)
      end while (start_time += step) <= end_time
    end


    def schedules_time(time,date)
      agenda_schedules.where(hour: time, date: date, status: 0).count
    end

    def lunch?
      self.lunch_time?
    end
  end
end
