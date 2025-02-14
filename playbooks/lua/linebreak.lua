function Str(elem)
    -- Replace [[br]] with an actual Pandoc line break
    if elem.text == "[[br]]" then
        return pandoc.LineBreak()
    end
    return elem
end
