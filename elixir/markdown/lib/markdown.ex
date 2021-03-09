defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """

  #re-factor parse using pipes
  @spec parse(binary) :: binary
  def parse(m) do
    m
    |> String.split("\n")
    |> Enum.map_join(&(process(&1)))
    |> patch

  end

  #rewrite process using 3 functions process/parse_word/h
  defp process(m) do

      #process word tags..
      s = String.split(m, " ")
      [f | e] = Enum.map(s,&(parse_word(&1,"__","<strong>","</strong>")))
             |> Enum.map(&(parse_word(&1,"_","<em>","</em>")))

      #process global tags
      case String.contains?(f,"#") do
        true -> "<#{h(f)}>"  <> Enum.join(e," ") <> "</#{h(f)}>"
        _ -> case f do
          "*" -> "<li>" <> Enum.join(e," ") <> "</li>"
          _ -> "<p>" <> Enum.join([f | e]," ") <> "</p>"
        end
      end

  end

  defp h(x) do "h" <> Integer.to_string(String.length(x)) end

  defp parse_word(m,check,open_tag,close_tag) do
    case String.split(m,check) do
        [_,b,_] -> open_tag <> b <> close_tag
        ["",b] -> open_tag <> b
        [b,_]  -> b <> close_tag
        [b] -> b
    end
  end

  #re-use patch to post adjust list tags,  refactor to pipe
  defp patch(l) do
    l
    |> String.replace("<li>", "<ul>" <> "<li>", global: false)
    |> String.replace_suffix("</li>","</li>" <> "</ul>")

  end

  #re-name parse to oldparse, process to oldprocess
  def oldparse(m) do
    patch(Enum.join(Enum.map(String.split(m, "\n"), fn t -> oldprocess(t) end)))
  end


  defp oldprocess(t) do
    if String.starts_with?(t, "#") || String.starts_with?(t, "*") do
      if String.starts_with?(t, "#") do
        enclose_with_header_tag(parse_header_md_level(t))
      else
        parse_list_md_level(t)
      end
    else
      enclose_with_paragraph_tag(String.split(t))
    end
  end

  defp parse_header_md_level(hwt) do
    [h | t] = String.split(hwt)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  defp parse_list_md_level(l) do
    t = String.split(String.trim_leading(l, "* "))
    "<li>" <> join_words_with_tags(t) <> "</li>"
  end

  defp enclose_with_header_tag({hl, htl}) do
    "<h" <> hl <> ">" <> htl <> "</h" <> hl <> ">"
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp join_words_with_tags(t) do
    Enum.join(Enum.map(t, fn w -> replace_md_with_tag(w) end), " ")
  end

  defp replace_md_with_tag(w) do
    replace_suffix_md(replace_prefix_md(w))
  end

  defp replace_prefix_md(w) do
    cond do
      w =~ ~r/^#{"__"}{1}/ -> String.replace(w, ~r/^#{"__"}{1}/, "<strong>", global: false)
      w =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(w, ~r/_/, "<em>", global: false)
      true -> w
    end
  end

  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end


end
