defmodule Fresco.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :brand_color, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :brand_color])
    |> validate_required([:name, :brand_color])
    |> unique_constraint(:name)
  end
end
