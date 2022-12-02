class MemberSerializer < ActiveModel::Serializer
  attributes :id

  def created_at
    object.created_at.strftime("%F %H:%M:%S")
  end

  def author
    object.user.email
  end

end
