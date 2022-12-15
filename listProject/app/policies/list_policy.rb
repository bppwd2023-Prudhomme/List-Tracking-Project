class ListPolicy < ApplicationPolicy
  def show?
    true
  end
  def update?
    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
    if(current_user.id == @record.user.id)
      true
    end
    current_user.permissions.each do |perm|
      puts perm.title
    end
    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
  end
end