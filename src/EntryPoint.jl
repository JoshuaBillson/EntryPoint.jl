module EntryPoint
export @entrypoint

macro entrypoint(f)
    quote
        if abspath(PROGRAM_FILE) == @__FILE__
            $f()
        end
    end
end

end
