class Item < ApplicationRecord
  # validates :image, presence: true
  # validates :name, presence: true
  # validates :quantity, presence: true
  # validates :minimum_bets, presence: true
  include AASM

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end

  mount_uploader :image, ImageUploader


  aasm column: :state do
    state :pending, initial: true
    state :submitted, :paid, :failed, :revoked

    event :submit do
      transitions from: :pending, to: :submitted
    end

    event :pay do
      transitions from: :submitted, to: :paid
    end

    event :fail do
      transitions from: [:pending, :submitted], to: :failed
    end

    event :revoke do
      transitions from: [:pending, :submitted], to: :revoked
    end
  end

  #
  # after_create :assign_serial_number
  # aasm column: :state do
  #   state :pending, initial: true
  #   state :submitted, :paid, :failed, :revoked
  #
  #   event :submit do
  #     transitions from: :pending, to: :submitted
  #   end
  #
  #   event :pay do
  #     transitions from: :submitted, to: :paid
  #   end
  #
  #   event :fail do
  #     transitions from: [:pending, :submitted], to: :failed
  #   end
  #
  #   event :revoke do
  #     transitions from: [:pending, :submitted], to: :revoked
  #   end
  # end
  #
  # private
  #
  # def assign_serial_number
  #   self.update(serial_number: "gem-#{id.to_s.rjust(9, '0')}")
  # end

end
