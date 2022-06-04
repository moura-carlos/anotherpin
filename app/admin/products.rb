ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :is_featured, :collection_date, :description, :is_sold_out
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :is_featured, :collection_date, :description, :is_sold_out]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # Overwiting the default admin form for the Product resource to use our own personalized one.
  # start of form

  # selecting the content to be displayed on products index admin page
  index do
    selectable_column
    index_column
    column "Main Image" do |product|
      image_tag product.image_1.thumb.url, width: 40
    end
    column :title
    column :price
    column :is_featured
    column :is_sold_out
    actions
  end

  form do |f|
    f.inputs 'Product info' do
      f.input :title
      f.input :price
      f.input :description
      f.input :collection_date
    end

    f.inputs "Filters" do
      f.input :is_featured, label: "Featured on homepage?"
      f.input :is_sold_out, label: "Sold out?"
    end

    f.inputs "Images" do
      f.input :image_1
      f.input :image_2
      f.input :image_3
      f.input :image_4
      f.input :image_5
    end
    f.actions
  end
  # end of form
end
