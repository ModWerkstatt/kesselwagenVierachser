function data()
  return {  
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING", 
		name = _("mod_name"),
		description = _(
						"mod_desc"
						),
		authors = {
			{
				name = 'jay_',
				role = 'CREATOR',
				text = 'Modell',
				tfnetId = 28954,
			},
					    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },  
		},
		params = {			
			{
				key = "soundCheck",
				name = _("sound_check"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,	
			},
		},
		tags = { "Europe", "Vehicle", "Freight", "Wagon", "DB", "SNCF", "VTG", "EVA", "KVG", "GATX", },
		dependencies = {},
		}, 
		
		runFn = function (settings, modParams)
		local params = modParams[getCurrentModId()]
	
		local function metadataHandler(fileName, data)
			if params.soundCheck == 0 then
				if fileName:match('/vehicle/waggon/habbis345/habbis345_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/habins3/habins3_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/habins901/habins901_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habinsAAE/habbinsAAE_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habis2/habis2_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habis2/habis2B_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habis1/habis1_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habisSBB/habisSBB_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habisSNCF/habisSNCF_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/habis6/habis6_([^/]*.mdl)') 
				then
					data.metadata.railVehicle.soundSet.name = "waggon_freight_modern"
				end
			end
			return data
		end

		addModifier( "loadModel", metadataHandler )
	end,
}
end