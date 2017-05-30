class Color < ActiveRecord::Base

  include Concerns::Paginable

  validates :name, presence: true, uniqueness: true

end
