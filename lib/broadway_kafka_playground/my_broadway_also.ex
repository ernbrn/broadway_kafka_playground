defmodule BroadwayKafkaPlayground.MyBroadwayAlso do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: [localhost: 9092],
             group_id: "group_2",
             topics: ["test"]
           ]},
        concurrency: 10
      ],
      processors: [
        default: [
          concurrency: 10
        ]
      ],
      batchers: [
        default: [
          batch_size: 2,
          # what is
          # batch_timeout: 200,
          concurrency: 10
        ]
      ]
    )
  end

  @impl true
  def handle_message(_, message, _) do
    message
    |> IO.inspect()
    |> Message.update_data(fn data -> {data, "Group 2!"} end)
  end

  @impl true
  def handle_batch(_, messages, _, _) do
    IO.puts("And I should have 2 messages!")
    IO.inspect(messages)

    messages
  end
end
