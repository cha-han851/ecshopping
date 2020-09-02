ActiveAdmin.register Article do
permit_params :title, :content, :image
  
form html: { multipart: true }  do |f|
  f.input :title
  f.input :content
  f.input :image, as: :file
  f.actions
end

end
