defmodule WhiteBreadContext do
  use WhiteBread.Context

  given_ ~r/^I am on the add items page$/, fn state ->
    {:ok, state}
  end

  and_ ~r/^I click on the New Item$/, fn state ->
    {:ok, state}
  end

  and_ ~r/^I enter name "(?<argument_one>[^"]+)", description "(?<argument_two>[^"]+)", price "(?<argument_three>[^"]+)" and status "(?<argument_four>[^"]+)"$/,
fn state, %{argument_one: _argument_one,argument_two: _argument_two,argument_three: _argument_three,argument_four: _argument_four} ->
  {:ok, state}
end

when_ ~r/^I submit the form $/, fn state ->
  {:ok, state}
end

then_ ~r/^I should receive a confirmation message "(?<argument_one>[^"]+)"$/,
fn state, %{argument_one: _argument_one} ->
  {:ok, state}
end

given_ ~r/^I am on the Restaurant Registraion page$/, fn state ->
  {:ok, state}
end

and_ ~r/^I enter username "(?<argument_one>[^"]+)", Rname "(?<argument_two>[^"]+)" , Email "(?<argument_three>[^"]+)", Address "(?<argument_four>[^"]+)" , Password "(?<argument_five>[^"]+)" and Tag "(?<argument_six>[^"]+)"$/,
fn state, %{argument_one: _argument_one,argument_two: _argument_two,argument_three: _argument_three,argument_four: _argument_four,argument_five: _argument_five,argument_six: _argument_six} ->
  {:ok, state}
end

given_ ~r/^I am on the courier Registraion page$/, fn state ->
  {:ok, state}
end

and_ ~r/^I enter Name "(?<argument_one>[^"]+)", surname "(?<argument_two>[^"]+)", username "(?<argument_three>[^"]+)", Date of birth "(?<argument_four>[^"]+)", Email "(?<argument_five>[^"]+)" and  Password "(?<argument_six>[^"]+)" $/,
fn state, %{argument_one: _argument_one,argument_two: _argument_two,argument_three: _argument_three,argument_four: _argument_four,argument_five: _argument_five,argument_six: _argument_six} ->
  {:ok, state}
end
given_ ~r/^I am on the customer Registraion page$/, fn state ->
  {:ok, state}
end
and_ ~r/^I enter Name "(?<argument_one>[^"]+)",Surname "(?<argument_two>[^"]+)",Date of birth "(?<argument_three>[^"]+)",Address "(?<argument_four>[^"]+)",Card number "(?<argument_five>[^"]+)" and Email "(?<argument_six>[^"]+)"$/,
fn state, %{argument_one: _argument_one,argument_two: _argument_two,argument_three: _argument_three,argument_four: _argument_four,argument_five: _argument_five,argument_six: _argument_six} ->
  {:ok, state}
end

end
