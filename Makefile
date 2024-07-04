servedocs:
	julia -e 'using Pkg; Pkg.activate("./docs"); Pkg.develop(path="."); Pkg.instantiate()'
	julia  -e 'using Pkg; Pkg.activate("./docs"); using QModExp,LiveServer; servedocs()'

format:
	julia -e 'using JuliaFormatter; format("src",BlueStyle())'
	julia -e 'using JuliaFormatter; format("test",BlueStyle())'
