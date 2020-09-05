
ActiveAdmin.register Product do
  permit_params :description, :brand, :ship_day,:name, :price,:tag_name,tag_name: [],images: [] , tags_attributes: [ :tag_name, :id ] 
  
  form html: { multipart: true }  do |f|
    f.inputs "ProductTab" do
      f.semantic_errors
      f.input :name
      f.input :description
      f.input :brand,as: :select, collection: Product.brands.keys
      f.input :ship_day
      f.input :price
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :images, as: :file, input_html: { multiple: true }
      f.inputs do
        f.has_many :tags do |t|
          t.input :tag_name,
                 as: :select,
                 collection:{"一眼レフ"=>"一眼レフ","ミラーレス"=>"ミラーレス","本体のみ"=>"本体のみ","初心者用"=>"初心者用","広角レンズ"=>"広角レンズ","望遠レンズ"=>"望遠レンズ"}
                 #collection:  Tag.all.map { |a| [a.tag_name,a.tag.id]}
              
        end
      end
    
    f.actions
  end 
end
end
  
  

