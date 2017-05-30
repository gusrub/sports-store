module Concerns
  module Paginable

    extend ActiveSupport::Concern

    included do
      scope :page, ->(page) { limit(ENV['MAX_RECORDS_PER_PAGE'].to_i).offset((page*ENV['MAX_RECORDS_PER_PAGE'].to_i)-ENV['MAX_RECORDS_PER_PAGE'].to_i) }
    end

    class_methods do
      def pages
        total = self.count
        if total >= ENV['MAX_RECORDS_PER_PAGE'].to_i
          page_count = total / ENV['MAX_RECORDS_PER_PAGE'].to_i
          page_count += total % ENV['MAX_RECORDS_PER_PAGE'].to_i
        else
          page_count = 1
        end

        page_count
      end
    end
  end
end