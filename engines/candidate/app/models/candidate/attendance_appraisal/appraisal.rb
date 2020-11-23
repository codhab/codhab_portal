module Candidate
  module AttendanceAppraisal
    class Appraisal < ::ActiveRecord::Base

      self.table_name = 'extranet.attendance_custom_tickets'

      default_scope -> {

        select(
          ' 
            attendance_custom_tickets.id as id,
            candidate_cadastre_mirrors.name as candidate_name,
            candidate_cadastre_mirrors.cpf as candidate_cpf,
            attendance_custom_tickets.created_at::date as candidate_date
          '
        )
        .joins('INNER JOIN candidate_cadastre_mirrors ON candidate_cadastre_mirrors.id = attendance_custom_tickets.cadastre_mirror_id')
        .where('candidate_cadastre_mirrors.special_condition_id = 2 OR ((
          select count(*) 
            from candidate_dependent_mirrors 
            where candidate_dependent_mirrors.cadastre_mirror_id = candidate_cadastre_mirrors.id
            and candidate_dependent_mirrors.special_condition_id = 2
          ) > 0)')
        .where('attendance_custom_tickets.attendant_date is null 
               and attendance_custom_tickets.supervisor_date is null')
        
        

      }
    end
  end
end