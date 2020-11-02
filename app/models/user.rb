class User < ApplicationRecord
  def full_name
    return 'Usuario no confirmado' unless confirmed?

    full_name = ''
    full_name += name if name.present?
    full_name += " #{last_name}" if last_name.present?
  end

  def confirmed?
    true
  end

  # def confirmed?
  #   Time.zone.now.to_i % 2 == 0
  # end
end
