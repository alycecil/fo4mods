Scriptname Alice:AAFHook extends Quest

GlobalVariable Property ALICEClawLastTimeDid auto

GlobalVariable Property GameDaysPassed auto

GlobalVariable Property ALICEClawTimesDidIt Auto

Actor Property Harold Auto
{The person penetrating the other.}

Scene Property pScene Auto

AAF:AAF_API AAF_API

    Function LoadAAF()
        AAF_API = Game.GetFormFromFile(0x00000F99, "AAF.esm") as AAF:AAF_API
        If !AAF_API
            Debug.Notification("Can't find AAF API.")
            utility.wait(0.1)
        Else
            RegisterForCustomEvent(AAF_API, "OnAnimationStop")
        Endif
    EndFunction

    Event OnQuestInit()
        RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
        LoadAAF()
    EndEvent

    Event Actor.OnPlayerLoadGame(actor aSender)
        RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
        LoadAAF()
    EndEvent

Event AAF:AAF_API.OnAnimationStop(AAF:AAF_API akSender, Var[] akArgs)
     If(pScene != None)
             Actor[] actors = Utility.VarToVarArray(akArgs[1]) as Actor[]
             Int I = 0
             Bool P1Found = False

             While (I < actors.length) && P1Found == False
                If (Actors[I] == Harold )
                    P1Found = True
                EndIf
                I += 1
             EndWhile

            If P1Found == False;
                 Return;
             Endif
            
            ALICEClawLastTimeDid.SetValue( GameDaysPassed.GetValue() + 1)
            ALICEClawTimesDidIt.SetValue( ALICEClawTimesDidIt.GetValue() + 1)
             pScene.Start()
		
              SetStage(20)
		CompleteQuest()
      EndIf
EndEvent

