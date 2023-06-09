return {
    -- Greek letter snippets, autotriggered for efficiency
    s({ trig=";aa", },
        {
            t("\\alpha"),
        }
        ),
    s({ trig=";ps" },
        {
            t("\\psi"),
        }
        ),
    s({ trig=";ph" },
        {
            t("\\phi"),
        }
        ),

    -- Insert Nodes
    -- 1 node
    s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
        {
            t("\\texttt{"), -- remember backslashes need to be escaped
            i(1),
            t("}")
        }
    ),
    -- 2 nodes
    s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
        {
            t("\\frac{"), -- remember backslashes need to be escaped
            i(1), -- insert node 1
            t("}{"),
            i(2), -- insert node 2
            t("}")
        }
    ),

    -- Image template
}
