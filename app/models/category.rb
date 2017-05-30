class Category < ActiveRecord::Base

  include Concerns::Paginable

  validates :name, presence: true, uniqueness: true

end
