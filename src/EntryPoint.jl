module EntryPoint
export @entrypoint

macro entrypoint(exp)
    line_number_node = eval(QuoteNode(__source__)) |> Symbol |> String
    calling_file = split(line_number_node, ":")[1][4:end]
    quote
        if $(esc(abspath(PROGRAM_FILE))) == $calling_file
            $(esc(exp))()
        end
    end
end

end
