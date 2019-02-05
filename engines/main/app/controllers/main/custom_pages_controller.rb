require_dependency 'main/application_controller'

module Main
  class CustomPagesController < ApplicationController

    def habilitacao
      
    end

    def terms

    end

    def portas_abertas
    end

    def info
      @relatorioum = Main::CustomPage.where(id:17)
      @relatoriodois = Main::CustomPage.where(id:18)
    end

    def ouvidoria
    end
    
    def carta_de_servico
    end
    
    def passoapasso

    end

    def relatorios
      @relatorios = Main::CustomPage.where(external:true).order(created_at: 'DESC')
    end


    def selagem_area1
    end

    def selagem_area2
    end

    def selagem_area3
    end

    def selagem_area4
    end

    def selagem_area5
    end

    def selagem_area6
    end

    def selagem_crixa
    end

    def selagem_bonsucesso_area1
    end
    def selagem_bonsucesso_area2
    end
    def selagem_bonsucesso_area3
    end
    def selagem_bonsucesso_area4
    end
    def selagem_bananal
    end
    def selagem_bananal_area1
    end

    def selagem_copaibas
    end
    def selagem_copaibas_area1
    end

  end
end
