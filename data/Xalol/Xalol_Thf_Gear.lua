-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('SkinKaja','SkinSari','KajaSkin','KajaSari','None')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')

    gear.stp_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10'}}
	gear.da_jse_back = gear.stp_jse_back
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace gs c weapons Throwing;gs c update')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind @q gs c cycle weapons;gs c update')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plunderer's Armlets +1",feet="Skulk. Poulaines"})
    sets.ExtraRegen = {}
    sets.Kiting = {feet="Skadi's Jambeaux +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	--sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	--sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	--sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket",hands="Floral Gauntlets",waist="Reiki Yotai"}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.SkinKaja = {main="Skinflayer",sub="Kaja Knife"}
	sets.weapons.SkinSari = {main="Skinflayer",sub="Taming Sari"}
	sets.weapons.KajaSkin = {main="Kaja Knife",sub="Skinflayer"}
	sets.weapons.KajaSari = {main="Kaja Knife",sub="Taming Sari"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Falcon Eye",
        head="Dampening Tam",neck="Erudit. Necklace",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Regal Ring",ring2="Begrudging Ring",
        back=gear.da_jse_back,waist="Eschan Stone",legs=gear.herculean_ta_legs,feet=gear.herculean_acc_feet}
		
    sets.precast.JA['Violent Flourish'] = {ammo="Falcon Eye",
        head="Dampening Tam",neck="Erudit. Necklace",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Regal Ring",ring2="Begrudging Ring",
        back=gear.da_jse_back,waist="Eschan Stone",legs=gear.herculean_ta_legs,feet=gear.herculean_acc_feet}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Accomplice'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +2"}
    sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {} --hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Ginsen",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body="Meg. Cuirie +2",hands="Slither Gloves +1",ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs=gear.herculean_dt_legs,feet=gear.herculean_ta_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",waist="Gishdubar Sash"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring2="Prolix Ring",
		legs=gear.herculean_ta_legs}

    --sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {range="Albin Bane"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Expeditious Pinion",
        head="Pill. Bonnet +2",neck="Caro Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Meghanada Cuirie +2",hands="Meg. Gloves +2",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Chiner's Belt +1",legs="Lustratio Subligar",feet="Lustratio Leggings"}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ear1="Digni. Earring",body="Meg. Cuirie +2",waist="Eschan Stone",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {ear1="Digni. Earring",body="Meg. Cuirie +2",waist="Eschan Stone",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket",back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila",head="Adhemar Bonnet",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila",head="Adhemar Bonnet",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yetshila",head="Adhemar Bonnet",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="Yetshila",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="Yetshila",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="Yetshila",body="Meg. Cuirie +2",legs="Pill. Culottes +2"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",body=gear.herculean_crit_body,head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Moonshade Earring",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Pill. Culottes +2",feet=gear.herculean_ta_feet})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {head="Adhemar Bonnet",body=gear.herculean_crit_body,neck="Fotia Gorget",ear1="Moonshade Earring",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Pill. Culottes +2",feet=gear.herculean_ta_feet})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {head="Mummu Bonnet +2",body=gear.herculean_crit_body,neck="Fotia Gorget",ear1="Moonshade Earring",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Pill. Culottes +2",feet=gear.herculean_ta_feet})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {head="Mummu Bonnet +2",body=gear.herculean_crit_body,hands="Mummu Wrists +2",legs="Pill. Culottes +2",feet=gear.herculean_ta_feet})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'], {})

    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_wsd_head,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hermetic Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Shiva Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Chaac Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_acc_feet}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Digni. Earring",ear2="Sherida Earring"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		legs=gear.herculean_ta_legs}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Mummu Bonnet +2",neck="Sanctity Necklace",ear1="Suppanomimi",ear2="Infused Earring",
        body="Adhemar Jacket",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

    sets.midcast.RA.Acc = {
        head="Mummu Bonnet +2",neck="Sanctity Necklace",ear1="Suppanomimi",ear2="Infused Earring",
        body="Adhemar Jacket",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Chaac Belt",legs=gear.herculean_ta_legs,feet=gear.herculean_ta_feet}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}
		
    --sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Archon Ring",
        back="Moonbeam Cape",waist="Eschan Stone",legs=gear.herculean_dt_legs,feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head=gear.herculean_wsd_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Adhemar Jacket",hands="Malignance Gloves",ring1="Defending Ring",ring2="Archon Ring",
		back="Moonbeam Cape",waist="Eschan Stone",legs=gear.herculean_dt_legs,feet="Malignance Boots"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.SomeAcc = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
    
	sets.engaged.Acc = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.FullAcc = {ammo="Ginsen",
        head="Adhemar Bonnet",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Samnuha Tights",feet="Malignance Boots"}

    sets.engaged.SomeAcc.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Samnuha Tights",feet="Malignance Boots"}
		
    sets.engaged.Acc.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Samnuha Tights",feet="Malignance Boots"}

    sets.engaged.FullAcc.PDT = {ammo="Staunch Tathlum",
        head="Dampening Tam",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Samnuha Tights",feet="Malignance Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 2)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 2)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 2)
    elseif player.sub_job == 'RUN' then
        set_macro_page(4, 2)
    else
        set_macro_page(5, 2)
    end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Kupipi") then
					windower.send_command('input /ma "Kupipi" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Joachim") then
					windower.send_command('input /ma "Joachim" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end
