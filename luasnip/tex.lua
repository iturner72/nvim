return {
    -- Greek letter snippets, autotriggered for efficiency
    s({ trig=";aa", snippetType="autosnippet" },
        {
            t("\\alpha"),
        }
        ),
    s({ trig=";ps", snippetType="autosnippet" },
        {
            t("\\psi"),
        }
        ),
    s({ trig=";ph", snippetType="autosnippet" },
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

    -- Example: text and insert nodes quickly become hard to read
    s({trig="eq", dscr = "testing multiline"},
    {
        t({ -- using a table of strings for multiline text
            "\\begin{equation}",
            "    "
        }),
        i(1),
        t({
            "",
            "\\end{equation}"

        }),
    }
    ),

    -- Image template
    s({trig="image", dscr="A LaTeX figure environment"},
        {
            t({
                "\\begin{figure}[ht]",
                "    \\centering",
                "    \\includegraphics[width=12cm]{"
                }),
            i(1),
            t({
                "}",
                "    \\captionsetup{labelfont=bf, textfont=it}",
                "    \\caption{"
            }),
            i(2),
            t({
                "}",
                "    \\label{fig:"
            }),
            i(3),
            t({
                "}",
                "\\end{figure}"
            }),
        }
    ),
}
