class UserBlueprint < Blueprinter::Base
  view :normal do
    identifier :id
    fields :name, :email, :address
  end
end