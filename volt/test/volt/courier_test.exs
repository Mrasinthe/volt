defmodule Volt.CourierTest do
  use Volt.DataCase

  alias Volt.Users

  describe "courier" do
    alias Volt.Users.Courier

    import Volt.UsersFixtures

    test "list_couriers/0 returns all couriers" do
      courier = courier_fixture()
      assert Users.list_couriers() == [courier]
    end

    test "get_courier!/1 returns the courier with given id" do
      courier = courier_fixture()
      assert Users.get_courier!(courier.id) == courier
    end

    test "create_courier/1 with valid data creates a courier" do
      valid_attrs = %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-05], email: "some_email@test.com", password: "some password"}

      assert {:ok, %Courier{} = courier} = Users.create_courier(valid_attrs)
      assert courier.name == "some name"
      assert courier.surname == "some surname"
      assert courier.username == "some username"
      assert courier.date_of_birth == ~D[1995-05-05]
      assert courier.email == "some_email@test.com"
      assert courier.password != "some password"
    end

    test "create_courier/1 with invalid data returns error changeset" do
      invalid_attrs = [
        %{name: nil, email: nil, password: nil, username: nil},
        %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-01], email: "some_email@test.com", password: nil},
        %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-02], email: "some_email", password: "some password"},
        %{name: "some name", surname: "some surname", username: "", date_of_birth: ~D[1995-05-03], email: "some_email@test.com", password: "some password"},
        %{name: "some name", surname: "some surname", username: nil, date_of_birth: ~D[1995-05-04], email: "some_email@test.com", password: "some password"},
        %{name: nil, surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-05], email: "some_email@test.com", password: "some password"}
      ]

      for val <- invalid_attrs do
        assert {:error, %Ecto.Changeset{}} = Users.create_courier(val)
      end
    end

    test "update_courier/2 with valid data updates the courier" do
      courier = courier_fixture()
      update_attrs = %{name: "some U name", surname: "some U surname", username: "some U username", date_of_birth: ~D[1995-07-05], email: "some_email_u@test.com", password: "some U password"}

      assert {:ok, %Courier{} = courier} = Users.update_courier(courier, update_attrs)
      assert courier.name == "some U name"
      assert courier.surname == "some U surname"
      assert courier.username == "some U username"
      assert courier.date_of_birth == ~D[1995-07-05]
      assert courier.email == "some_email_u@test.com"
      assert courier.password != "some U password"
    end

    test "update_courier/2 with invalid data returns error changeset" do
      invalid_attrs = [
        %{name: nil, email: nil, password: nil, username: nil},
        %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-01], email: "some_email@test.com", password: nil},
        %{name: "some name", surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-02], email: "some_email", password: "some password"},
        %{name: "some name", surname: "some surname", username: "", date_of_birth: ~D[1995-05-03], email: "some_email@test.com", password: "some password"},
        %{name: "some name", surname: "some surname", username: nil, date_of_birth: ~D[1995-05-04], email: "some_email@test.com", password: "some password"},
        %{name: nil, surname: "some surname", username: "some username", date_of_birth: ~D[1995-05-05], email: "some_email@test.com", password: "some password"}
      ]

      courier = courier_fixture()
      for val <- invalid_attrs do
        assert {:error, %Ecto.Changeset{}} = Users.update_courier(courier, val)
        assert courier == Users.get_courier!(courier.id)
      end
    end

    test "delete_courier/1 deletes the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{}} = Users.delete_courier(courier)
      assert_raise Ecto.NoResultsError, fn -> Users.get_courier!(courier.id) end
    end

    test "change_courier/1 returns a courier changeset" do
      courier = courier_fixture()
      assert %Ecto.Changeset{} = Users.change_courier(courier)
    end
  end
end
