require "application_system_test_case"

class PermissionsTest < ApplicationSystemTestCase
  setup do
    @permission = permissions(:one)
  end

  test "visiting the index" do
    visit permissions_url
    assert_selector "h1", text: "Permissions"
  end

  test "should create permission" do
    visit permissions_url
    click_on "New permission"

    check "Canread" if @permission.canRead
    check "Canupdelete" if @permission.canUpdelete
    fill_in "List", with: @permission.list_id
    fill_in "permissable_type", with: @permission.permissable_type
    fill_in "Permissable", with: @permission.permissable_id
    fill_in "Title", with: @permission.title
    click_on "Create Permission"

    assert_text "Permission was successfully created"
    click_on "Back"
  end

  test "should update Permission" do
    visit permission_url(@permission)
    click_on "Edit this permission", match: :first

    check "Canread" if @permission.canRead
    check "Canupdelete" if @permission.canUpdelete
    fill_in "List", with: @permission.list_id
    fill_in "permissable_type", with: @permission.permissable_type
    fill_in "Permissable", with: @permission.permissable_id
    fill_in "Title", with: @permission.title
    click_on "Update Permission"

    assert_text "Permission was successfully updated"
    click_on "Back"
  end

  test "should destroy Permission" do
    visit permission_url(@permission)
    click_on "Destroy this permission", match: :first

    assert_text "Permission was successfully destroyed"
  end
end
