class CarMaintenance < ApplicationRecord
  belongs_to :car
  has_many_attached :documents
  attribute :remove_document, :boolean, default: false
  after_save :purge_document, if: :remove_document

  private
  def purge_document
    documents.each do |document|
      document.purge_later
    end
  end
end
