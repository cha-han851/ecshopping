ActiveAdmin.register Product do
  permit_params :user_id, :name, :description, :brand, :ship_day, :price,:tag_list, images: []
  
  form html: { multipart: true }  do |f|
    f.inputs "Product" do
      f.input :user
      f.input :name
      f.input :description
      f.input :brand
      f.input :ship_day
      f.input :price
      f.input :tag_list
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end 
 
end

  

