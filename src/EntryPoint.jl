module EntryPoint
export @entrypoint

macro entrypoint(exp)
    quote
        if $(esc(abspath(PROGRAM_FILE))) == $(esc(@__FILE__))
            $(esc(exp))()
        end
    end
end

end
