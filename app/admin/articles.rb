ActiveAdmin.register Article do
  permit_params :title, :content, :image

  form html: { multipart: true } do |f|
    f.inputs 'Title' do
      f.input :title
    end
    f.inputs 'Content' do
      f.input :content
    end
    f.inputs 'Image' do
      f.input :image, as: :file
    end
    f.actions
  end
end
