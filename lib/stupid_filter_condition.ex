defmodule StupidFilterCondition do
  def init(domain) do
    condition = &(String.contains?(&1, "http://" <> &2))
    &(condition.(&1, domain))
  end
end
