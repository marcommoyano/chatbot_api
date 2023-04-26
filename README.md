# README

Esta es una aplicación simple creada utilizando RoR.

* Versiones: 
  - Ruby 2.6.5
  - Rails 5.2.8.1

* Gestor de Base de datos utilizado
  - postgresql

* Pasos para levantar la aplicación:
  - instalar dependencias: `bundle install`
  - Crear la base de datos: `rails db:create`
  - Ejecutar migraciones: `rails db:migrate`
  - Crear usuarios: `rails db:seed`
  - Levantar aplicación: `rails s`
  - Como el puerto por defecto es el 3000, ingresar en un navegador a `http://localhost:3000/`

*LOS DATOS DE USUSARIOS CREADOS SON:*
- rut: '18123456-7', name: 'Rodrigo', lastname: 'Rodriguez'
- rut: '17123456-7', name: 'Gonzalo', lastname: 'Gonzalez'
- rut: '16123456-7', name: 'Fernando', lastname: 'Fernandez'
