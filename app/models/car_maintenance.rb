class CarMaintenance < ApplicationRecord
  belongs_to :car
  has_many_attached :documents
  attr_accessor :remove_document, :boolean
  after_save :purge_document, if: :remove_document

  private
  def purge_document
    documents.each do |document|
      document.purge_later
    end
  end
end
