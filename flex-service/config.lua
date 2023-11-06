Config = {}

Config.commando = 'taakstraf'
Config.endcommando = 'stoptaakstraf'
Config.chockdistance = 250
Config.checkdamage = 1
Config.addtasks = math.random(2,5)

Config.markercolor = {
    r = 0,
    g = 100,
    b = 203
}

Config.policestation = vector3(-600.77, -929.72, 23.86)
Config.tasks = {
    [1] = {
        task = 1,
        text3d = 'Start cleaning',
        tasktime = 5, --seconds
        progresstext = 'Cleaning..',
        locations = {
            vector3(-600.2, -939.8, 23.86),
            vector3(-599.94, -932.22, 23.86),
            vector3(-604.91, -928.7, 23.86),
            vector3(-607.49, -936.08, 23.86),
            vector3(-597.3, -947.34, 22.44),
            vector3(-608.86, -948.16, 22.01),
            vector3(-621.47, -946.94, 21.74),
            vector3(-617.37, -941.46, 21.97),
            vector3(-611.48, -937.77, 22.27)
        },
        droploc = nil,
        anim = {
            type = 'broom',
            scenario = 'WORLD_HUMAN_JANITOR',
            animDic = 'anim@amb@drug_field_workers@rake@male_a@base',
            animation = 'base',
            prop = 'prop_tool_broom',
        }
    },
    [2] = {
        task = 2,
        text3d = 'Grab box',
        tasktime = 5, --seconds
        progresstext = 'Grabbing box..',
        locations = {
            vector3(206.0, -996.54, 29.43),
            vector3(202.42, -996.33, 29.43)
        },
        droploc = vector3(209.25, -993.27, 29.36),
        anim = {
            type = 'box',
            scenario = nil,
            animDic = "anim@heists@box_carry@",
            animation = "idle",
            prop = 'hei_prop_heist_box'
        }
    },
    [3] = {
        task = 3,
        text3d = 'Clean poop',
        tasktime = 5, --seconds
        progresstext = 'Cleaning poop..',
        locations = {
            vector3(-596.82, -943.78, 22.98),
            vector3(-590.16, -943.96, 23.06),
            vector3(-585.39, -943.49, 23.34),
            vector3(-579.74, -942.65, 23.51),
            vector3(-576.93, -944.89, 23.39),
            vector3(-571.88, -945.22, 23.47),
            vector3(-567.78, -944.79, 23.59)
        },
        droploc = nil,
        anim = {
            type = 'clean',
            scenario = 'WORLD_HUMAN_GARDENER_PLANT',
            animDic = nil,
            animation = nil,
            prop = nil
        }
    },
    [4] = {
        task = 4,
        text3d = 'Clean poop',
        tasktime = 5, --seconds
        progresstext = 'Cleaning poop..',
        locations = {
            vector3(214.74, -990.3, 29.33),
            vector3(211.35, -997.21, 29.34),
            vector3(209.03, -1004.7, 29.34),
            vector3(200.58, -1007.27, 29.34),
            vector3(194.3, -1004.85, 29.35),
            vector3(185.0, -1001.71, 29.35),
            vector3(179.0, -999.24, 29.36),
            vector3(173.53, -997.46, 29.36),
            vector3(175.55, -991.44, 29.36),
            vector3(177.99, -984.72, 29.36),
            vector3(181.22, -976.12, 29.36),
            vector3(190.22, -975.19, 29.36),
            vector3(198.38, -977.46, 29.36),
            vector3(210.18, -982.32, 29.36)
        },
        droploc = nil,
        anim = {
            type = 'clean',
            scenario = 'WORLD_HUMAN_GARDENER_PLANT',
            animDic = nil,
            animation = nil,
            prop = nil
        }
    },
    [5] = {
        task = 5,
        text3d = 'Start cleaning',
        tasktime = 5, --seconds
        progresstext = 'Cleaning..',
        locations = {
            vector3(173.95, -979.0, 29.36),
            vector3(157.75, -975.27, 29.38),
            vector3(154.84, -986.09, 29.38),
            vector3(167.66, -992.33, 29.37),
            vector3(171.44, -1002.73, 29.34),
            vector3(188.6, -1010.41, 29.32),
            vector3(200.56, -1017.61, 29.32),
            vector3(208.23, -1019.45, 29.31),
            vector3(145.44, -994.25, 29.36),
            vector3(130.74, -989.18, 29.33)
        },
        droploc = nil,
        anim = {
            type = 'broom',
            scenario = 'WORLD_HUMAN_JANITOR',
            animDic = 'anim@amb@drug_field_workers@rake@male_a@base',
            animation = 'base',
            prop = 'prop_tool_broom',
        }
    },
    [6] = {
        task = 6,
        text3d = 'Start cleaning',
        tasktime = 5, --seconds
        progresstext = 'Cleaning..',
        locations = {
            vector3(282.25, -612.61, 43.31),
            vector3(294.63, -615.0, 43.42),
            vector3(293.53, -596.75, 43.26),
            vector3(299.66, -579.13, 43.26),
            vector3(297.48, -571.37, 43.26),
            vector3(291.1, -561.55, 43.26),
            vector3(283.25, -579.98, 43.25),
            vector3(277.98, -593.6, 43.24)
        },
        droploc = nil,
        anim = {
            type = 'broom',
            scenario = 'WORLD_HUMAN_JANITOR',
            animDic = 'anim@amb@drug_field_workers@rake@male_a@base',
            animation = 'base',
            prop = 'prop_tool_broom',
        }
    },
}