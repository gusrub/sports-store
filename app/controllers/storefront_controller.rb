class StorefrontController < ApplicationController
  def index
    @search = params[:search]
    sort =  if params[:sort].present?
              params[:sort] == "name" ? "products.name ASC" : "product_variants.final_price ASC"
            else
              "product_variants.id ASC"
            end
    category = params[:cat]
    @featured = Product.enabled.featured

    if @search.present?
      @variants = ProductVariant.enabled.search(@search)
    elsif category.present?
      @variants = ProductVariant.enabled.by_category(category)
    else
      @variants = ProductVariant.enabled.order(sort)
    end
  end
end