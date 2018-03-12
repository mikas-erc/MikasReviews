# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Conta.create!(nome:"teste1",
              email:"teste1@gmail.com",
              password:"teste1",
              password_confirmation:"teste1",
              tipo:"admin",
              ativo:true,
              ativado_em: Time.zone.now,
              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))

Conta.create!(nome:"teste2",
              email:"teste2@gmail.com",
              password:"teste2",
              password_confirmation:"teste2",
              tipo:"user",
              ativo:true,
              ativado_em: Time.zone.now,
              foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))

Conta.create!(nome:"teste3",
              email:"teste3@gmail.com",
              password:"teste3",
              password_confirmation:"teste3",
              tipo:"empresa",
              ativo:true,
              verificado:true,
              ativado_em: Time.zone.now,
              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/120x120.png")))
