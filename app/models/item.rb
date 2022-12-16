class Item < ApplicationRecord

  has_many :categories
  include AASM

  enum status: { inactive: 0, active: 1 }

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end

  mount_uploader :image, ImageUploader

  aasm column: :state do
    state :pending, initial: true
    state :starting, :cancelled, :ended, :paused

    event :start do
      transitions from: [:pending, :cancelled, :ended, :paused], to: :starting
    end

    event :pause do
      transitions from: [:starting, :cancelled], to: :paused
    end

    event :end do
      transitions from: :starting, to: :ended
    end

    event :cancel do
      transitions from: :starting, to: :cancelled
    end
  end

  # def state=(value)
  #   if self.class.method_defined?(value)
  #     if self.send("may_#{value}?")
  #       self.send(value)
  #     else
  #       errors.add(:status, "status cannot transition from #{status} to #{value}")
  #     end
  #   else
  #     errors.add(:status, "status of #{value} is not valid.  Legal values are #{aasm.states.map(&:name).join(", ")}")
  #   end
  # end

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
