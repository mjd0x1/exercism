
defmodule RobotSimulator do

  @right "R"
  @left  "L"
  @ahead "A"
  @valid_instructions [@right,@left,@ahead]
  @north :north
  @south :south
  @east  :east
  @west  :west
  @valid_directions [@north,@south,@east,@west]
  @valid_integers -100..100
  @starting_position  {0,0}
  @starting_direction  @north


  defmodule Robot do
    defstruct position: {}, direction: nil
  end


  defp get_direction(direction) do

    case direction do
      nil  ->  nil
      d when d in @valid_directions -> d
      _ ->  :error
    end

  end

  defp get_position(position) do

    case position do
      nil  ->  nil
      {a,b} when a in @valid_integers and b in @valid_integers ->  {a,b}
      _ ->  :error
    end

  end


  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ nil, position \\ nil) do

    case {get_direction(direction),get_position(position)} do
       {nil, nil}   -> %Robot{direction: @starting_direction, position: @starting_position}
       {d, _ } when d in [:error, nil] -> {:error, "invalid direction"}
       {_ , p } when p in [:error, nil] -> {:error, "invalid position"}
       _  -> %Robot{direction: direction, position: position}

    end


  end

  defp validate?(instructions) do
    valid = MapSet.new(@valid_instructions())
    to_check  = MapSet.new(String.graphemes(instructions))
    MapSet.difference(to_check,valid)
      |> Enum.count == 0
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
      cond do
        validate?(instructions)-> iterate(String.graphemes(instructions),robot)
         true ->  {:error, "invalid instruction"}
      end
  end


  defp turn(robot,move) do

    case move do
        @right -> right(robot)
        @left -> left(robot)
        @ahead -> ahead(robot)
    end
  end

  defp right(robot) do
    case robot.direction do
       @north ->  @east
       @east ->  @south
       @south  -> @west
       @west   -> @north
    end
  end


  defp left(robot) do
    case robot.direction do
      @north ->  @west
      @west  ->  @south
      @south  -> @east
      @east   -> @north
   end
  end

  defp ahead(robot) do
    robot.direction
  end


  defp update_position(robot,new_direction) do
    {x,y}   = robot.position
    direction =  robot.direction
    {δx,δy}  = %{@north=> {0,1}, @east=> {1,0} , @west => {-1,0}, @south=> {0,-1} }[direction]

    cond do
      direction == new_direction ->  %Robot{direction: new_direction, position: {x + δx , y + δy}}
      true -> %Robot{direction: new_direction , position:  {x,y}}
    end

  end

  defp iterate([],robot) do robot end
  defp iterate([x | xs],robot) do
      new_direction = turn(robot,x)
      iterate(xs, update_position(robot,new_direction))
  end






  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
