ActiveAdmin.register User do
  permit_params :nickname, :email, :password, :password_confirmation, :birthday, :family_name, :first_name, :family_name_kana, :first_name_kana
  
  form html:{}  do |f|
    f.inputs "User" do
      f.input :nickname
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :birthday
      f.input :family_name
      f.input :first_name
      f.input :family_name_kana
      f.input :first_name_kana
    end
    f.actions

  end


end
