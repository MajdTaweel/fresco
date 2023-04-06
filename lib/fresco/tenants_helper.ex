defmodule Fresco.TenantsHelper do
  alias Fresco.Accounts
  alias Fresco.Repo

  def create_tenant(name, brand_color) do
    Triplex.create_schema(name, Repo, fn tenant, repo ->
      {:ok, _} = Triplex.migrate(tenant, repo)

      Repo.transaction(fn ->
        case Accounts.create_account(%{name: tenant, brand_color: brand_color}) do
          {:ok, account} -> {:ok, account}
          {:error, error} -> Repo.rollback(error)
        end
      end)
    end)
  end
end
