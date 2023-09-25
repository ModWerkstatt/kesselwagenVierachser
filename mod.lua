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
				key = "gefahrenguttafel",
				name = _("tafel_aktiv"),
				values = {_("cargo_only"), _("always_load"),},
				tooltip = _("gefahr_tooltip"),
				defaultIndex = 0,
			},
			{
				key = "soundCheck",
				name = _("sound_check"),
				uiType = "CHECKBOX",
				values = { "No", "Yes", },				
				defaultIndex = 1,	
			},
		},
		tags = { "Europe", "Vehicle", "Freight", "Wagon", "DB", "Kesselwagen", "Tank Car", "VTG", "EVA", "KVG", },
		dependencies = {},
		}, 
		
		runFn = function (settings, modParams)
		local params = modParams[getCurrentModId()]
		
			local hidden = {	
				["oelCo.mdl"] = true,
				["tankWagon.mdl"] = true,
				["turmoel60.mdl"] = true,
				["turmoel80.mdl"] = true,
				["turmoelEx.mdl"] = true,
				["evaAlt1.mdl"] = true,
				["evaAlt2.mdl"] = true,
				["evaGrau.mdl"] = true,
				["evaGrauShell.mdl"] = true,
				["evaSchwarz.mdl"] = true,
				["evaSchwarzMobil.mdl"] = true,
				["vtg1.mdl"] = true,
				["vtg2.mdl"] = true,
				["bp.mdl"] = true,
				["caib.mdl"] = true,
				["degussa.mdl"] = true,
				["ermewa1.mdl"] = true,
				["ermewa2.mdl"] = true,
				["esso.mdl"] = true,
				["esso2.mdl"] = true,
				["eva1.mdl"] = true,
				["eva2.mdl"] = true,
				["eva3.mdl"] = true,
				["eva4.mdl"] = true,
				["eva5.mdl"] = true,
				["eva100.mdl"] = true,
				["evaBP.mdl"] = true,
				["gatx.mdl"] = true,
				["millet.mdl"] = true,
				["milletMarcel.mdl"] = true,
				["mobil.mdl"] = true,
				["onRail.mdl"] = true,
				["onRail2.mdl"] = true,
				["siegwerk.mdl"] = true,
				["simotra1.mdl"] = true,
				["simotra2.mdl"] = true,
				["sogefa.mdl"] = true,
				["sogefaMarathon.mdl"] = true,
				["vtgEx1.mdl"] = true,
				["vtgEx2.mdl"] = true,
				["vtgEx3.mdl"] = true,
				["kroll.mdl"] = true,
				["krollShell.mdl"] = true,
				["vtg.mdl"] = true,
				["vtg71.mdl"] = true,
				["vtg80.mdl"] = true,
				["vtg80_grau.mdl"] = true,
				["vtg94.mdl"] = true,
				["vtgAlt.mdl"] = true,
				["vtgBlank.mdl"] = true,
				["vtgTexaco.mdl"] = true,
				["vtgVeba.mdl"] = true,		
				["asa.mdl"] = true,
				["asa2.mdl"] = true,
				["dr.mdl"] = true,
				["dr2.mdl"] = true,
				["enviloc.mdl"] = true,
				["ermewa.mdl"] = true,
				["ermewa2.mdl"] = true,
				["ermewa3.mdl"] = true,
				["ermewa4.mdl"] = true,
				["gatx.mdl"] = true,
				["gatxAlt.mdl"] = true,
				["gatxBio.mdl"] = true,
				["gatxBlau.mdl"] = true,
				["gatxFazeni.mdl"] = true,
				["kvg.mdl"] = true,
				["kvg2.mdl"] = true,
				["kvg3.mdl"] = true,
				["nacco.mdl"] = true,
				["nacco2.mdl"] = true,
				["ragnSells.mdl"] = true,
				["vtg.mdl"] = true,
				["vtg2.mdl"] = true,
				["vtg3.mdl"] = true,
			}
		
		local modelFilter = function(fileName, data)				
				local modelName = 
				fileName:match   ('/beladen_cfmf67_([^/]*.mdl)')
				or fileName:match('/beladen_kesselTyp50_([^/]*.mdl)')		
				or fileName:match('/beladen_uerdingen58_([^/]*.mdl)')	
				or fileName:match('/beladen_wuSiegen72_([^/]*.mdl)')		
				or fileName:match('/beladen_ZasDR_([^/]*.mdl)')					
				return (modelName==nil or hidden[modelName]~=true)				
			end  
			
		local modelFilter2 = function(fileName, data)				
				local modelName = 
				fileName:match   ('/cfmf67_([^/]*.mdl)')
				or fileName:match('/kesselTyp50_([^/]*.mdl)')		
				or fileName:match('/uerdingen58_([^/]*.mdl)')	
				or fileName:match('/wuSiegen72_([^/]*.mdl)')		
				or fileName:match('/ZasDR_([^/]*.mdl)')					
				return (modelName==nil or hidden[modelName]~=true)				
			end  
		
		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]					
			if params["gefahrenguttafel"] == 0 then
				addFileFilter("model/vehicle", modelFilter)		
			end
			if params["gefahrenguttafel"] == 1 then
				addFileFilter("model/vehicle", modelFilter2)		
			end
		else
			addFileFilter("model/vehicle", modelFilter)	
		end	
		

		local function metadataHandler(fileName, data)
			if params.soundCheck == 0 then
				if fileName:match('/vehicle/waggon/CFMF67/cfmf67_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/CFMF67/beladen/beladen_cfmf67_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/SGP55/kesselTyp50_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/SGP55/beladen/beladen_kesselTyp50_([^/]*.mdl)') or 
				fileName:match('/vehicle/waggon/Uerdingen58/uerdingen58_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/Uerdingen58/beladen/beladen_uerdingen58_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/WUSiegen72/wuSiegen72_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/WUSiegen72/beladen/beladen_wuSiegen72_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/ZasDR/ZasDR_([^/]*.mdl)') or
				fileName:match('/vehicle/waggon/ZasDR/beladen/beladen_ZasDR_([^/]*.mdl)')
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