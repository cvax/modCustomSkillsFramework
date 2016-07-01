struct CustomSkill
{
	saved var abilityName : name;
	saved var skillType : ESkill;
	saved var groupName : name;
	saved var groupEnableVar : name;
	saved var argsIntName : array<name>;
	saved var argsFloatName : array<name>;
	saved var installState : CustomSkillState;
}

struct CustomSkillState
{
	var detected : bool;
	var enabled : ECustomSkillEnableState;
	var idx : int;
}

enum ECustomSkillEnableState
{
	ECSES_Disabled,
	ECSES_Enabled,
	ECSES_Uninstall
}

enum ECustomSkillsActionThisRun
{
	ECSATR_Disabled,
	ECSATR_Installed,
	ECSATR_Uninstalled,
	ECSATR_NoAction,
	ECSATR_Repaired
}

function GetCustomSkills() : array<CustomSkill>
{
	var dm : CDefinitionsManagerAccessor;
	var main : SCustomNode;
	var i, k : int;
	var tmpName, groupName, groupEnableVar, tmpArgIntName, tmpArgFloatName : name;
	var tmpString, tmpArgIntString, tmpArgFloatString, groupNameString, groupEnableVarString : string;
	var tmpCustomSkill : CustomSkill;
	var geraltSkill : array<CustomSkill>;

	dm = theGame.GetDefinitionsManager();
	main = dm.GetCustomDefinition('skills');
	
	for(i=0; i<main.subNodes.Size(); i+=1)
	{
		for(k=0; k<main.subNodes[i].subNodes.Size(); k+=1)
		{
			// Find mod added new skills labeled with attribute <skill_type>="custom"
			if(dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'skill_type', tmpString))
			{
				if (tmpString == "custom")
				{
					// Add skill name to list
					dm.GetCustomNodeAttributeValueName(main.subNodes[i].subNodes[k], 'skill_name', tmpName);
					dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'group_name', groupNameString);
					dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'group_var', groupEnableVarString);
					tmpCustomSkill.abilityName = tmpName;
					tmpCustomSkill.skillType = SkillNameToEnum(tmpName);

					groupName = StringDefinitionToEnum(groupNameString);
					if (groupName == '')
						dm.GetCustomNodeAttributeValueName(main.subNodes[i].subNodes[k], 'group_name', groupName);
					tmpCustomSkill.groupName = groupName;

					groupEnableVar = StringDefinitionToEnum(groupEnableVarString);
					tmpCustomSkill.groupEnableVar = groupEnableVar;

					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_int_var1', tmpArgIntString))
					{
						tmpArgIntName = StringDefinitionToEnum(tmpArgIntString);
						tmpCustomSkill.argsIntName.PushBack(tmpArgIntName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_int_var2', tmpArgIntString))
					{
						tmpArgIntName = StringDefinitionToEnum(tmpArgIntString);
						tmpCustomSkill.argsIntName.PushBack(tmpArgIntName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_int_var3', tmpArgIntString))
					{
						tmpArgIntName = StringDefinitionToEnum(tmpArgIntString);
						tmpCustomSkill.argsIntName.PushBack(tmpArgIntName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_int_var4', tmpArgIntString))
					{
						tmpArgIntName = StringDefinitionToEnum(tmpArgIntString);
						tmpCustomSkill.argsIntName.PushBack(tmpArgIntName);
					}

					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_float_var1', tmpArgFloatString))
					{
						tmpArgFloatName = StringDefinitionToEnum(tmpArgFloatString);
						tmpCustomSkill.argsFloatName.PushBack(tmpArgFloatName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_float_var2', tmpArgFloatString))
					{
						tmpArgFloatName = StringDefinitionToEnum(tmpArgFloatString);
						tmpCustomSkill.argsFloatName.PushBack(tmpArgFloatName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_float_var3', tmpArgFloatString))
					{
						tmpArgFloatName = StringDefinitionToEnum(tmpArgFloatString);
						tmpCustomSkill.argsFloatName.PushBack(tmpArgFloatName);
					}
					if (dm.GetCustomNodeAttributeValueString(main.subNodes[i].subNodes[k], 'arg_float_var4', tmpArgFloatString))
					{
						tmpArgFloatName = StringDefinitionToEnum(tmpArgFloatString);
						tmpCustomSkill.argsFloatName.PushBack(tmpArgFloatName);
					}


					if(!geraltSkill.Contains(tmpCustomSkill))
					{
						geraltSkill.PushBack(tmpCustomSkill);
						tmpCustomSkill.argsIntName.Clear();
						tmpCustomSkill.argsFloatName.Clear();
					}
				}
			}
		}
	}

	return geraltSkill;
}