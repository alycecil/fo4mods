Scriptname Alice:AAF_KICKOFF extends TopicInfo

Actor Property Penetrator Auto
{The person penetrating the other.}

Actor Property Receiver Auto
{The person being penetrated/receiving.}

Quest Property ALICEClawAAFPostListenter Auto
{The Quest to trigger withscript Alice:AAFHook}

Scene Property pScene Auto
{The Scene to trigger on Finish}

AAF:AAF_API AAF_API

 Function LoadAAF()
        AAF_API = Game.GetFormFromFile(0x00000F99, "AAF.esm") as AAF:AAF_API
        If !AAF_API
            Debug.Notification("Can't find AAF API.")
            utility.wait(0.1)
        Else
		AAF:AAF_API:SceneSettings settings = AAF_API.GetSceneSettings()
		Actor[] Actors = New Actor [2]
		Actors[0] = Receiver
		Actors[1] = Penetrator
              settings.duration = 30.0
   		 settings.preventFurniture = False
   		 settings.usePackages = True
   		 settings.position = None
    		settings.includeTags = None
    		settings.excludeTags = None

	     Alice:AAFHook hook
            hook = ALICEClawAAFPostListenter as Alice:AAFHook 
            hook.pScene = pScene

           ALICEClawAAFPostListenter.Start()
           ALICEClawAAFPostListenter.SetStage(10)


		AAF:AAF_API.GetAPI().StartScene(Actors, settings)
        Endif
    EndFunction

Event OnEnd(ObjectReference akSpeaker, bool HasBeenSaid)
	LoadAAF()
EndEvent
