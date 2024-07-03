using QModExp
using Documenter

DocMeta.setdocmeta!(QModExp, :DocTestSetup, :(using QModExp); recursive=true)

makedocs(;
    modules=[QModExp],
    authors="Yusheng Zhao <yushengzhao2020@outlook.com> and contributors",
    sitename="QModExp.jl",
    format=Documenter.HTML(;
        canonical="https://exAClior.github.io/QModExp.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/exAClior/QModExp.jl",
    devbranch="main",
)
