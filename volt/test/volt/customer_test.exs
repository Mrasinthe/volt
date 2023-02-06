defmodule Volt.CustomerTest do
  use Volt.DataCase

  alias Volt.Users

  describe "customer" do
    alias Volt.Users.Customer

    import Volt.UsersFixtures

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Users.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Users.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-05], email: "some_email@test.com", password: "some password", address: "Tartu", card_number: "1234567898746541"}

      assert {:ok, %Customer{} = customer} = Users.create_customer(valid_attrs)
      assert customer.name == "some name"
      assert customer.surname == "some surname"
      assert customer.date_of_birth == ~D[1995-05-05]
      assert customer.email == "some_email@test.com"
      assert customer.password != "some password"
      assert customer.address == "Tartu"
      assert customer.card_number == "1234567898746541"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      invalid_attrs = [
        %{name: nil, email: nil, password: nil, address: nil, card_number: nil},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-01], email: "some_email@test.com", password: "some password", address: "Tartu", card_number: "1234"},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-02], email: "some_email@test.com", password: nil, address: "Tartu", card_number: "1234567898746541"},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-03], email: "some_email", password: "some password", address: "Tartu", card_number: "1234567898746541"}
      ]

      for val <- invalid_attrs do
        assert {:error, %Ecto.Changeset{}} = Users.create_customer(val)
      end
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{name: "some U name", surname: "some U surname", date_of_birth: ~D[1995-07-05], email: "some_email_u@test.com", password: "some U password", address: "Tartu linn", card_number: "0234567898746541"}


      assert {:ok, %Customer{} = customer} = Users.update_customer(customer, update_attrs)
      assert customer.name == "some U name"
      assert customer.surname == "some U surname"
      assert customer.date_of_birth == ~D[1995-07-05]
      assert customer.email == "some_email_u@test.com"
      assert customer.password != "some U password"
      assert customer.address == "Tartu linn"
      assert customer.card_number == "0234567898746541"

    end

    test "update_customer/2 with invalid data returns error changeset" do
      invalid_attrs = [
        %{name: nil, email: nil, password: nil, address: nil, card_number: nil},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-01], email: "some_email@test.com", password: "some password", address: "Tartu", card_number: "1234"},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-02], email: "some_email@test.com", password: nil, address: "Tartu", card_number: "1234567898746541"},
        %{name: "some name", surname: "some surname", date_of_birth: ~D[1995-05-03], email: "some_email", password: "some password", address: "Tartu", card_number: "1234567898746541"}
      ]

      customer = customer_fixture()
      for val <- invalid_attrs do
        assert {:error, %Ecto.Changeset{}} = Users.update_customer(customer, val)
        assert customer == Users.get_customer!(customer.id)
      end
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Users.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Users.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Users.change_customer(customer)
    end
  end
end
