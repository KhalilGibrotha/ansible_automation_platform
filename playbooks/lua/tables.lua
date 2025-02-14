-- tables module for lua filter to convert markdown tables to docx with borders and blue header
function Table(tbl)
    -- Define table properties
    local tbl_props = {
        border = "single",  -- Set table border
        width = "auto",  -- Auto width
    }

    -- Define header properties (light blue shading)
    local header_props = {
        shading = "D3EAFD",  -- Light blue hex (R:211 G:234 B:253)
        bold = true,  -- Make headers bold
    }

    -- Apply properties to the entire table
    tbl.attr.attributes["custom-style"] = "TableStyle"

    -- Apply properties to headers
    for _, row in ipairs(tbl.head.rows) do
        for _, cell in ipairs(row.cells) do
            cell.attr.attributes["custom-style"] = "TableHeader"
        end
    end

    return tbl
end