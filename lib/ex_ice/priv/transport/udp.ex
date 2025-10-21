defmodule ExICE.Priv.Transport.UDP do
  @moduledoc false
  @behaviour ExICE.Priv.Transport

  require Logger

  @impl true
  defdelegate open(port, opts), to: :gen_udp

  @impl true
  def sockname(socket) do
    socknames = :inet.socknames(socket)

    Logger.debug("MY-DEBUG Socknames: #{inspect(socknames)}")

    :inet.sockname(socket)
  end

  @impl true
  defdelegate send(socket, dest, packet), to: :gen_udp

  @impl true
  defdelegate close(socket), to: :gen_udp
end
