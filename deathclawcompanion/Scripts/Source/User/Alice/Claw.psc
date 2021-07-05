Scriptname Alice:Claw extends Actor Const

Actor Property CLAW Auto Const

Event OnLoad()
	CLAW.AllowPCDialogue(true)
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (akTarget == Game.GetPlayer())
        Debug.Trace("We have entered combat with the player! Stopping.")
        SetPlayerTeammate(true, true)
	 CLAW.SetRelationshipRank(Game.GetPlayer(), 4)
       CLAW.StopCombatAlarm()
  else
     if (aeCombatState == 0)
       CLAW.MoveTo(Game.GetPlayer())
     endif
  endIf
endEvent