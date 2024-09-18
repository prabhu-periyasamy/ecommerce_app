class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :email, :address
end