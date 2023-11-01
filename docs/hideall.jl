# Hide example blocks with "#hideall". 
# Also, use "#hideon" and "#hideoff" to toggle hiding for the current document.
function hideall(input)
    lines = split(input, "\n")
    inexample = false
    shouldhide = false
    hideon = false
    for (i,s) in enumerate(lines)
        if occursin(r"^````@example", s)
            inexample = true
            continue
        end
        if inexample && occursin(r"\#hideall", s)
            shouldhide = true
        end
        if inexample && occursin(r"\#hideon", s)
            hideon = true
        end
        if inexample && occursin(r"\#hideoff", s)
            hideon = false
        end
        if occursin(r"^````", s) && !occursin("@", s)
            inexample = false
            shouldhide = false
            continue
        end
        if inexample && (hideon || shouldhide)
            lines[i] *= "   #hide"
        end
    end
    return join(lines, "\n")
end
