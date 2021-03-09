defmodule BankAccount do

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {_, pid} = Agent.start_link(fn -> %{balance: 0} end)
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
      Agent.stop(account)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    case Process.alive?(account) do
      true -> Agent.get(account,fn x -> Map.get(x, :balance) end)
      _  -> {:error, :account_closed}
    end

  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    case Process.alive?(account) do
      true ->  current = balance(account)
              Agent.update(account, fn x -> Map.put(x, :balance, current + amount) end)
      _ ->  {:error, :account_closed}
    end


  end
end
