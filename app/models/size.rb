class Size < ActiveRecord::Base

  include Concerns::Paginable

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

end
