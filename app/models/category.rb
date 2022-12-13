class Category < ApplicationRecord
  validates :name, presence: true

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end

end
