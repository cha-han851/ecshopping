ActiveAdmin.register Product do
  permit_params :user_id, :name, :description, :brand, :ship_day, :price,tag_ids: [],tag_name: [],images: [], tags_attributes: [:id, :tag_name, :description, :_destroy]
  
  form html: { multipart: true }  do |f|
    f.inputs "ProductTab" do
      f.input :user
      f.input :name
      f.input :description
      f.input :brand
      f.input :ship_day
      f.input :price
      f.input :tag_ids, as: :check_boxes, collection: Tag.all.map { |a| [a.tag_name, a.id] }, input_html: { multiple: true }
      #f.inputs "Tags" do
        #f.has_many :tags do |t|
         # t.input :tag_name,
                 #as: :select,
                 #collection: Tag.all.map { |a| [a.tag_name, a.id] }, input_html: { multiple: true }
        #end
      #end
      f.inputs "Images" do 
        f.input :images, as: :file, input_html: { multiple: true }
        f.input :images, as: :file, input_html: { multiple: true }
        f.input :images, as: :file, input_html: { multiple: true }
      end
    f.actions
    end 
  end
end
  

