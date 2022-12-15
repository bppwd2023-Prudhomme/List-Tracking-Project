class ListPolicy < ApplicationPolicy
  def show?
    true
  end
  def update?
    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
    if(@user.id == @record.user.id)
      true
    end
    @user.permissions.each do |perm|
      puts perm.title
    end
    puts "\n\n\n\n\n\n\n\n\n\n\n\n"
  end
end