defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Marcel",
        password: "123456",
        email: "marcel@email.com",
        nickname: "marcel",
        age: 30
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Marcel", age: 30, id: ^user_id} = user
    end

    test "when there are invalid params, return an user" do
      params = %{
        name: "Marcel",
        password: "123456",
        email: "marcel@email.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        nickname: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
