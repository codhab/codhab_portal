module Concourse
  class SubscribeMailer < ActionMailer::Base
    default from: 'concursos@codhab.df.gov.br'

    def success(candidate, project)
      @project    = project
      @candidate  = candidate

      mail(to: @candidate.email, subject: "CODHAB - #{@project.title}- Inscrição recebida")
    end

    def update(candidate, project)
      @project    = project
      @candidate  = candidate

      mail(to: @candidate.email, subject: "CODHAB - #{@project.title}- Inscrição atualizada")
    end

    def remember_password(email, candidate, project, key)
      @project    =  project
      @candidate  =  candidate
      @key        =  key
      mail(to: email, subject: "CODHAB | CONCURSOS - Atualização de senha")
    end

    def checked(email, number, project_id)
      @email    = email
      @number   = number
      @project  = Concourse::Project.find(project_id)

      mail(to: email, subject: "Concurso Público Nacional de Projetos de Arquitetura e Complementares – Inscrição Homologada - Nº #{number}")
    end


    def project_send(email, number, project_id)
      @email    = email
      @number   = number
      @project  = Concourse::Project.find(project_id)
      @participation = Concourse::CandidateParticipation.find_by_candidate_id(number)
      @candidate = Concourse::Candidate.find(@number)

      if @candidate.homologado?
        mail(to: email, subject: "CONCURSO PÚBLICO NACIONAL DE PROJETO DE URBANISMO E ARQUITETURA NO SETOR HABITACIONAL PÔR DO SOL – Projeto Recebido - Inscrição Nº #{@number}")
      else
        mail(to: email, subject: "CONCURSO PÚBLICO NACIONAL DE PROJETO DE URBANISMO E ARQUITETURA NO SETOR HABITACIONAL PÔR DO SOL – Projeto Provisório Recebido - Inscrição Nº #{@number}")
      end
    end


    def crazy(email)
      mail(to: email, subject: "CODHAB - Informação importante: Unidades Habitacionais Coletivas - Samambaia")
    end

    def resource(email, resource)
      @resource = resource
      mail(to: email, subject: "MANIFESTAÇÃO DE  INTERPOSIÇÃO DE RECURSO")
    end
  end
end
