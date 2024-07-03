using QModExp
using Documenter
using DocumenterCitations

DocMeta.setdocmeta!(QModExp, :DocTestSetup, :(using QModExp); recursive=true)

bib = CitationBibliography(joinpath(@__DIR__,"src/reference.bib"),style=:authoryear)

makedocs(;
    plugin = [bib],
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
        "Theory" => "theory.md",
        "API" => "api.md",
        "Suggested Readings and References" => "reference.md"
    ],
)

deploydocs(;
    repo="github.com/exAClior/QModExp.jl",
    devbranch="master",
)
