namespace :brb do
  task create_invoice: :environment do
    subscribe_id = 19

    @candidates = Concourse::Candidate.where(subscribe_id: subscribe_id)

    @index = 0

    @candidates.each do |candidate|
      @boleto = Brb::Invoice.where('cpf = ? and due = ?', candidate.cpf, "2018-10-26").first

      unless @boleto.present?
        @category = Brb::Category.find(candidate.subscribe.type_guide_id)
        @invoice = Brb::Invoice.new({
          name: candidate.name,
          cpf: candidate.cpf,
          cep: candidate.cep,
          address: candidate.address,
          state_id: candidate.state_id,
          city: candidate.city,
          due: Date.parse('2018-10-26'),
          category_id: @category.id,
          message: "Concursos Codhab",
          value: 300,
          invoice_type: 1
        })

        #p @invoice.inspect
        @invoice.save!

        p @index += 1
      end
    end
  end
end
