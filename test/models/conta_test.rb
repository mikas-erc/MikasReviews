require 'test_helper'

class ContaTest < ActiveSupport::TestCase
  def setup
    @conta = Conta.new(name: "Example Conta", email: "conta@example.com",
                      password: "foobar", password_confirmation: "foobar")

  end

  test "should be valid" do
    assert @conta.valid?
  end

  test "name should be present" do
    @conta.name = ""
    assert_not @conta.valid?
  end

  test "email should be present" do
    @conta.email = "     "
    assert_not @conta.valid?
  end

  test "name should not be too long" do
    @conta.name = "a" * 51
    assert_not @conta.valid?
  end

  test "email should not be too long" do
    @conta.email = "a" * 244 + "@example.com"
    assert_not @conta.valid?
  end

  test "email addresses should be saved as lower-case" do
  mixed_case_email = "Foo@ExAMPle.CoM"
  @conta.email = mixed_case_email
  @conta.save
  assert_equal mixed_case_email.downcase, @conta.reload.email
  end

  test "password should be present (nonblank)" do
  @conta.password = @conta.password_confirmation = " " * 6
  assert_not @conta.valid?
end

test "password should have a minimum length" do
  @conta.password = @conta.password_confirmation = "a" * 5
  assert_not @conta.valid?
end


end
