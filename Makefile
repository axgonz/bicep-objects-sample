.DEFAULT_GOAL := create

create:
	az deployment sub create \
		--name "bicep-objects-sample" \
		--location "australiaeast" \
		--template-file "src/main.bicep"