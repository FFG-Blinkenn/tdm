--[[

Weclome menu upon loading a map or entering the game.
Choose a team.

]]--

    surface.CreateFont( "Close",
    {
                    font    = "CloseCaption_Bold", 
                    size    = 13,
                    weight  = 700,
                    antialias = true,
                    blursize = 0.2,
                    shadow = false
    })

    surface.CreateFont( "Button",
    {
                    font    = "Triomphe", 
                    size    = 16,
                    weight  = 700,
                    antialias = true,
                    blursize = 0.3,
                    shadow = false
    })

    surface.CreateFont( "WelcomeMSG",
    {
                    font    = "Triomphe",
                    size    = 62,
                    weight  = 400,
                    antialias = true,
                    blursize = 0.2,
                    shadow = false
    })

    surface.CreateFont( "WelcomeMSGShadow",
    {
                    font    = "Triomphe",
                    size    = 62,
                    weight  = 400,
                    antialias = true,
                    blursize = 2,
                    shadow = false
    })

    surface.CreateFont( "TeamMSG",
    {
                    font    = "Triomphe",
                    size    = 32,
                    weight  = 400,
                    antialias = true,
                    blursize = 0.2,
                    shadow = false
    })

    surface.CreateFont( "TeamMSGShadow",
    {
                    font    = "Triomphe",
                    size    = 32,
                    weight  = 400,
                    antialias = true,
                    blursize = 1.5,
                    shadow = false
    })

function welcomePlayer( ply )
	local PlayerName = ply:Name()
	local MapName = game.GetMap()
	local SpecPlayers = GetGlobalInt( "TDM_SpecTeamNum" )
	local RedPlayers = GetGlobalInt( "TDM_RedTeamNum" )
	local BluePlayers = GetGlobalInt( "TDM_BlueTeamNum" )

	local ChooseTeamFrame = vgui.Create( "DFrame" )
	ChooseTeamFrame:SetSize(ScrW(), ScrH()*0.3)
	ChooseTeamFrame:SetTitle("")
	ChooseTeamFrame:SetPos( 0, ScrH()/4)
	ChooseTeamFrame:SetVisible( true )
	ChooseTeamFrame:SetDraggable( false )
	ChooseTeamFrame:ShowCloseButton( false )
	ChooseTeamFrame:MakePopup()
	function ChooseTeamFrame:Paint( w, h, ply )
		draw.RoundedBox( 0, 0, 0 + h/(1.5), w, h*(1/3), Color(250,250,250,5))
		draw.RoundedBox( 0, 0, 0, w, h/(1.5), Color(0,0,0,165))
		draw.DrawText( "Welcome, " .. PlayerName .. ".", "WelcomeMSGShadow",  0 + w/2 + 1, 0 + (h/1.5)/3 - 31 + 1, Color(0, 0, 0, 225), TEXT_ALIGN_CENTER )
		draw.DrawText( "Welcome, " .. PlayerName .. ".", "WelcomeMSG",  0 + w/2, 0 + (h/1.5)/3 - 31, Color(255, 255, 255, 235), TEXT_ALIGN_CENTER )
		draw.DrawText( "Please select a team.", "TeamMSGShadow", 0 + w/2 + 1, 0 + (h/1.5)/3 + (h/1.5)/3 - 16 + 1, Color(0, 0, 0, 225), TEXT_ALIGN_CENTER )  
		draw.DrawText( "Please select a team.", "TeamMSG", 0 + w/2, 0 + (h/1.5)/3 + (h/1.5)/3 - 16, Color(255, 255, 255, 235), TEXT_ALIGN_CENTER ) 

	end

	local tabHover = false
	local HelpButton = vgui.Create('DButton')
	HelpButton:SetParent(ChooseTeamFrame)
	HelpButton:SetSize(45, 22)
	HelpButton:SetPos( ScrW()-90, 0 )
	HelpButton:SetFont("Close")
	HelpButton:SetText('Help')
	HelpButton:SetTextColor( Color(255,255,255,255) )
	function HelpButton:OnCursorEntered()
		tabHover = true
	end
	function HelpButton:OnCursorExited()
		tabHover = false
	end
	function HelpButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 0, 0, 0, w, h, Color(80,80,80,210))
		else
			draw.RoundedBox( 0, 0, 0, w, h, Color(120,120,120,210))
		end
	end
	function HelpButton:DoClick()
		--ChooseTeamFrame:Close()
	end

	local tabHover = false
	local CloseButton = vgui.Create('DButton')
	CloseButton:SetParent(ChooseTeamFrame)
	CloseButton:SetSize(45, 22)
	CloseButton:SetPos( ScrW()-45, 0 )
	CloseButton:SetFont("Close")
	CloseButton:SetText('Close')
	CloseButton:SetTextColor( Color(255,255,255,255) )
	function CloseButton:OnCursorEntered()
		tabHover = true
	end
	function CloseButton:OnCursorExited()
		tabHover = false
	end
	function CloseButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 0, 0, 0, w, h, Color(240,30,30,210))
		else
			draw.RoundedBox( 0, 0, 0, w, h, Color(250,70,70,210))
		end
	end
	function CloseButton:DoClick()
		ChooseTeamFrame:Close()
	end

	local tabHover = false
	local SpectatorButton = vgui.Create('DButton')
	SpectatorButton:SetParent(ChooseTeamFrame)
	SpectatorButton:SetSize(ScrW()/10, ScrH()/20)
	SpectatorButton:SetPos(ScrW()/2 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6)
	SpectatorButton:SetText("SPECTATE ("..SpecPlayers..")")
	SpectatorButton:SetTextColor( Color(255,255,255,255) )
	SpectatorButton:SetFont("Button")
	SpectatorButton:SetDrawBackground(true)
	function SpectatorButton:OnCursorEntered()
		tabHover = true
	end
	function SpectatorButton:OnCursorExited()
		tabHover = false
	end
	function SpectatorButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(75,75,75,255))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(65,65,65,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(65,65,65,255))
		end
	end
	function SpectatorButton:DoClick()
		ChooseTeamFrame:Close()
	end

	local tabHover = false
	local RedButton = vgui.Create('DButton')
	RedButton:SetParent(ChooseTeamFrame)
	RedButton:SetSize(ScrW()/10, ScrH()/20)
	RedButton:SetPos(ScrW()/3 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6 )
	RedButton:SetText("TEAM RED ("..RedPlayers..")")
	RedButton:SetTextColor( Color(255,255,255,255) )
	RedButton:SetFont("Button")
	RedButton:SetDrawBackground(true)
	function RedButton:OnCursorEntered()
		tabHover = true
	end
	function RedButton:OnCursorExited()
		tabHover = false
	end
	function RedButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(180,40,40,250))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(40,40,40,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(180,30,30,250))
		end
	end
	function RedButton:DoClick()
		if ply:Team() == 0 then
		ply:ChatPrint( "You are already on the Red Team." )
		else
			if RedPlayers > BluePlayers then
				ply:ChatPrint( "There are too many players on the Red Team." )
			else 
				RunConsoleCommand( "stTeamT" )
				ChooseTeamFrame:Close()
			end
		end
	end

	local tabHover = false
	local BlueButton = vgui.Create('DButton')
	BlueButton:SetParent(ChooseTeamFrame)
	BlueButton:SetSize(ScrW()/10, ScrH()/20)
	BlueButton:SetPos(ScrW()/2 + ScrW()/6 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6)
	BlueButton:SetText("TEAM BLUE ("..BluePlayers..")")
	BlueButton:SetTextColor( Color(255,255,255,255) )
	BlueButton:SetFont("Button")
	BlueButton:SetDrawBackground(true)
	function BlueButton:OnCursorEntered()
		tabHover = true
	end
	function BlueButton:OnCursorExited()
		tabHover = false
	end
	function BlueButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(40,40,180,250))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(40,40,40,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(30,30,180,250))
		end
	end
	function BlueButton:DoClick()
		if ply:Team() == 1 then
		ply:ChatPrint( "You are already on Team Blue." )
		else
			if BluePlayers > RedPlayers then
				ply:ChatPrint( "There are too many players on the Blue Team." )
			else
				RunConsoleCommand( "stTeamCT" )
				ChooseTeamFrame:Close()
			end
		end
	end
end
concommand.Add("welcomePlayer", welcomePlayer)