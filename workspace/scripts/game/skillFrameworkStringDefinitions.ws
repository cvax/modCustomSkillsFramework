function StringDefinitionToEnum( s : string ) : name
{
	switch(s)
	{
		// In geralt_skills.xml, you must set the "group_name" and "group_var" attributes.
		// These attributes should be named how they are named in your custom mod menu xml.
		// Make sure to provide all string-to-name conversions below.

		// Ex:
		case "CustomSkillGroupID"	: return 'CustomSkillGroupID';		// group_name
		case "customSkillEnabled"	: return 'customSkillEnabled';		// group_var

		default					: return '';
	}
}