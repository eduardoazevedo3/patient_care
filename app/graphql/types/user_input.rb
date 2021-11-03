module Types
  class UserInput < Types::BaseInputObject
    argument :full_name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
  end
end
