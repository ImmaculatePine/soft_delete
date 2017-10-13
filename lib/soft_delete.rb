require 'soft_delete/version'

# Adds soft delete functionality to your model
#
# Run this migration before using:
#
#     rails g migration AddDeletedAtToModelName deleted_at:datetime:index
module SoftDelete
  extend ActiveSupport::Concern

  included do
    scope :deleted, -> { with_deleted.where.not(deleted_at: nil) }
    scope :not_deleted, -> { where(deleted_at: nil) }
    scope :with_deleted, -> { unscope(where: :deleted_at) }
    default_scope { not_deleted }
  end

  # Marks record as deleted
  # @return [Boolean] whether it was marked as deleted
  def soft_delete
    return false if deleted?
    update_columns(soft_delete_values)
  end

  # Marks record as deleted but does not save it
  # @return [Boolean] whether record was marked as deleted
  def mark_for_soft_delete
    return false if deleted?
    assign_attributes(soft_delete_values)
    deleted?
  end

  # Marks deleted record as not deleted
  # @return [Boolean] whether it was marked as not deleted
  def restore
    return false unless deleted?
    update_columns(restore_values)
  end

  # @return [Boolean] whether record is marked as deleted
  def deleted?
    !deleted_at.nil?
  end

  private

  def soft_delete_values
    { deleted_at: Time.zone.now }
  end

  def restore_values
    { deleted_at: nil }
  end
end
