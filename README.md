# Introducing the Custom Skills Framework for Witcher 3!

This framework serves as the prerequisite code base for installing new skills for Geralt. As a developer, you will be able to quickly implement additional skills without worrying about hooking up all the pipes. As a gamer, you will benefit from a simplified install experience that allows for multiple custom skills to coexist without needing ultra-nasty Script Mergers.



### This framework will take care of the following for you:

    1. Install custom skills with skill tree icons support
    2. Allow enable/disable of custom skills
    3. Selective clean uninstall of custom skills without breaking skill trees
    4. Dynamic custom skill tooltips based on custom mod menu values (no need to hardcode into xmls)
    5. Console command debugging of custom skills
    6. Simultaneous multiple custom skills support!



### What you (developer) will need to do:

    1. Cook geralt_skills.xml with new skills
    2. Create icons for your skills
    3. Create custom Mod menu to manage the skill
    4. Program the skill's behavior logic

For a detailed guide on how to use this framework to build your custom skill mod, please see the Wiki page.



### What you (gamer) will need to do:

    1. Copy \modSkillsFramework\ to <Witcher3>\Mods\
    2. Copy custom skill mod to <Witcher3>\Mods\
    3. Script Merger