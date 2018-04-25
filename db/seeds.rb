# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Conta.create!(nome:"MikasReviews",
              nickname:"mikasreviews",
              email:"mikasreviews@gmail.com",
              password:"teste1",
              password_confirmation:"teste1",
              tipo:"backoffice",
              ativo:true,
              verificado:true,
              ativado_em: Time.zone.now,
              foto: File.open(File.join(Rails.root, "/app/assets/images/logo.png")))

Conta.create!(nome:"teste1",
              nickname:"teste1",
              email:"teste1@gmail.com",
              password:"teste1",
              password_confirmation:"teste1",
              tipo:"admin",
              ativo:true,
              verificado:true,
              ativado_em: Time.zone.now,
              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))

Conta.create!(nome:"teste2",
              nickname:"teste2",
              email:"teste2@gmail.com",
              password:"teste2",
              password_confirmation:"teste2",
              tipo:"reviewer",
              ativo:true,
              ativado_em: Time.zone.now,
              foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))

Conta.create!(nome:"teste3",
              nickname:"teste3",
              email:"teste3@gmail.com",
              password:"teste3",
              password_confirmation:"teste3",
              tipo:"empresa",
              ativo:true,
              verificado:true,
              ativado_em: Time.zone.now,
              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))

50.times do |n|
  Conta.create!(nome:Faker::RickAndMorty.character,
                nickname:"TesteSeed#{n+1}" ,
                email:"exemplo-conta-#{n+1}@seed.org",
                password:"teste1",
                password_confirmation:"teste1",
                tipo:"user",
                ativo:true,
                ativado_em: Time.zone.now,
                foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
end

20.times do |n|
  Conta.create!(nome:Faker::RickAndMorty.character,
                nickname:"TesteSeedR#{n+1}" ,
                email:"exemplo-conta-r#{n+1}@seed.org",
                password:"teste1",
                password_confirmation:"teste1",
                tipo:"reviewer",
                ativo:true,
                ativado_em: Time.zone.now,
                foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
end

20.times do |n|
  Conta.create!(nome:Faker::RickAndMorty.character,
                nickname:"TesteSeedE#{n+1}" ,
                email:"exemplo-empresa-#{n+1}@seed.org",
                password:"teste1",
                password_confirmation:"teste1",
                tipo:"empresa",
                ativo:true,
                ativado_em: Time.zone.now,
                verificado:true,
                foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
end
Conta.where(tipo:"empresa").each do |j|
  3.times do |n|
    Jogo.create!(nome:Faker::Fallout.character + "#{n+1}",
                  preco: n+1.99,
                  descricao:Faker::Lorem.sentence,
                  developer:j.nickname,
                  idsteam: 0,
                  steam:false,
                  data_de_lancamento:Time.zone.tomorrow,
                  tags:'teste1,teste2,teste3',
                  foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
  end
end
30.times do |n|
  Noticium.create!(nome:Faker::ProgrammingLanguage.name + "#{n+1}",
                texto:Faker::Lorem.sentence(50),
                descricao:Faker::Lorem.sentence,
                tags:"teste1,teste2,teste3",
                data:Time.zone.now,
                conta_id:admin.id,
                ativo:true,
                foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
end

Conta.all.each do |n|
  Jogo.all.each do |j|
    if rand(1..3) == 1
      Classificacao.new(classificacao:-1,jogo_id:j.id,conta_id:n.id).save
    else
      Classificacao.new(classificacao:1,jogo_id:j.id,conta_id:n.id).save
    end
  end
end

Conta.where(tipo:"reviewer").each do |n|
  Jogo.all.each do |j|
    Review.new(texto:Faker::Lorem.sentence(20),classificacao:rand(0...11),conta_id:n.id,jogo_id:j.id).save
  end
end
Conta.all.each do |n|
  Conta.all.each do |j|
    if !(j==n)
      if rand(1..2) == 1
        Seguido.new(idseguidor:n.id,idseguido:j.id).save
      end
    end
  end
end

Conta.all.each do |n|
  Conta.all.each do |j|
    if rand(1..2) == 1
      Comentario.new(tipo:'conta',tipoid:j.id,texto:Faker::Lorem.sentence(20),conta_id:n.id).save
    end
  end
end
Conta.all.each do |n|
  Jogo.all.each do |j|
    if rand(1..2) == 1
      Comentario.new(tipo:'jogo',tipoid:j.id,texto:Faker::Lorem.sentence(20),conta_id:n.id).save
    end
  end
end
Conta.all.each do |n|
  Noticium.all.each do |j|
    if rand(1..2) == 1
      Comentario.new(tipo:'noticia',tipoid:j.id,texto:Faker::Lorem.sentence(20),conta_id:n.id).save
    end
  end
end
Jogo.all.each do |n|
  n.update_attribute(:favreview, Review.where(jogo_id:n.id).first.id) 
end
