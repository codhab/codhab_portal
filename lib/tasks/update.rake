namespace :update_pass do
  task test: :environment do
    Entity::Old.all.each_with_index do |entity, index|
      puts index 
      @pass = entity.cnpj 
      @pass = @pass.to_s[0..3]
      puts "#{@pass}123456"

      entity.password = "#{@pass}123456"
      entity.save(validate: false)



    end
  end
end