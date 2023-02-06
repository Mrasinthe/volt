# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Volt.Repo.insert!(%Volt.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


# alias Volt.{Repo, Users.Courier}
alias Volt.{Repo, Food.Item}
alias Volt.{Repo, Users.Restaurant}

# [%{name: "TestCourierName", surname: "TestCourierSurname", username: "TestUsername", date_of_birth: ~D[1997-01-02], email: "test@test.com", password: "parool"},
#  %{name: "TestCourierNameS", surname: "TestCourierSurnameS", username: "TestUsernameS", date_of_birth: ~D[1997-02-03], email: "testS@test.com", password: "parool"}]
# |> Enum.map(fn courier_data -> Courier.changeset(%Courier{}, courier_data) end)
# |> Enum.each(fn changeset -> Repo.insert!(changeset) end)



  restaurant = %Restaurant{address: "City Center, Tartu", email: "test@restaurant.com", rname: "KFC", username: "kfc01", password: "000000",tag: "fastfood"}
  restaurant = Repo.insert!(restaurant)
  item = Ecto.build_assoc(restaurant, :item, %{description: "Zinger Burger with Chicken", name: "Zinger Burger", price: "2.50", status: "active"})
  Repo.insert!(item)
  item = Ecto.build_assoc(restaurant, :item, %{description: "Mac Burger with Chicken", name: "Mac Burger", price: "2.50", status: "active"})
  Repo.insert!(item)
