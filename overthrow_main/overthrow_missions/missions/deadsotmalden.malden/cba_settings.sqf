// ACE Advanced Ballistics
force ace_advanced_ballistics_ammoTemperatureEnabled = true;
force ace_advanced_ballistics_barrelLengthInfluenceEnabled = true;
force ace_advanced_ballistics_bulletTraceEnabled = true;
force ace_advanced_ballistics_enabled = false;
force ace_advanced_ballistics_muzzleVelocityVariationEnabled = true;
force ace_advanced_ballistics_simulationInterval = 0.05;

// ACE Advanced Fatigue
force ace_advanced_fatigue_enabled = true;
force ace_advanced_fatigue_enableStaminaBar = true;
force ace_advanced_fatigue_fadeStaminaBar = true;
force ace_advanced_fatigue_loadFactor = 1;
force ace_advanced_fatigue_performanceFactor = 2;
force ace_advanced_fatigue_recoveryFactor = 2;
force ace_advanced_fatigue_swayFactor = 1;
force ace_advanced_fatigue_terrainGradientFactor = 1;

// ACE Advanced Throwing
force ace_advanced_throwing_enabled = true;
force ace_advanced_throwing_enablePickUp = true;
force ace_advanced_throwing_enablePickUpAttached = true;
force ace_advanced_throwing_showMouseControls = true;
force ace_advanced_throwing_showThrowArc = true;

// ACE Arsenal
force ace_arsenal_allowDefaultLoadouts = true;
force ace_arsenal_allowSharedLoadouts = true;
force ace_arsenal_camInverted = false;
force ace_arsenal_enableIdentityTabs = true;
force ace_arsenal_enableModIcons = true;
force ace_arsenal_EnableRPTLog = false;
force ace_arsenal_fontHeight = 5.99999;

// ACE Artillery
force ace_artillerytables_advancedCorrections = false;
force ace_artillerytables_disableArtilleryComputer = false;
force ace_mk6mortar_airResistanceEnabled = false;
force ace_mk6mortar_allowCompass = true;
force ace_mk6mortar_allowComputerRangefinder = true;
force ace_mk6mortar_useAmmoHandling = false;

// ACE Captives
force ace_captives_allowHandcuffOwnSide = false;
force ace_captives_allowSurrender = false;
force ace_captives_requireSurrender = 0;
force ace_captives_requireSurrenderAi = false;

// ACE Common
force ace_common_allowFadeMusic = true;
force ace_common_checkPBOsAction = 0;
force ace_common_checkPBOsCheckAll = false;
force ace_common_checkPBOsWhitelist = "[]";
ace_common_displayTextColor = [0,0,0,0.1];
ace_common_displayTextFontColor = [1,1,1,1];
ace_common_settingFeedbackIcons = 1;
ace_common_settingProgressBarLocation = 0;
force ace_noradio_enabled = true;
ace_parachute_hideAltimeter = true;

// ACE Cook off
force ace_cookoff_ammoCookoffDuration = 1;
force ace_cookoff_enable = 0;
force ace_cookoff_enableAmmobox = true;
force ace_cookoff_enableAmmoCookoff = true;
force ace_cookoff_probabilityCoef = 1;

// ACE Crew Served Weapons
force ace_csw_ammoHandling = 2;
force ace_csw_defaultAssemblyMode = false;
force ace_csw_dragAfterDeploy = false;
force ace_csw_handleExtraMagazines = true;
force ace_csw_progressBarTimeCoefficent = 1;

// ACE Explosives
force ace_explosives_explodeOnDefuse = true;
force ace_explosives_punishNonSpecialists = true;
force ace_explosives_requireSpecialist = false;

// ACE Fragmentation Simulation
force ace_frag_enabled = true;
force ace_frag_maxTrack = 10;
force ace_frag_maxTrackPerFrame = 10;
force ace_frag_reflectionsEnabled = true;
force ace_frag_spallEnabled = true;

// ACE Goggles
force ace_goggles_effects = 2;
force ace_goggles_showClearGlasses = true;
force ace_goggles_showInThirdPerson = false;

// ACE Hearing
force ace_hearing_autoAddEarplugsToUnits = true;
ace_hearing_disableEarRinging = false;
force ace_hearing_earplugsVolume = 0.5;
force ace_hearing_enableCombatDeafness = true;
force ace_hearing_enabledForZeusUnits = true;
force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Interaction
force ace_interaction_disableNegativeRating = false;
ace_interaction_enableMagazinePassing = false;
force ace_interaction_enableTeamManagement = false;

// ACE Interaction Menu
ace_gestures_showOnInteractionMenu = 0;
ace_interact_menu_actionOnKeyRelease = true;
ace_interact_menu_addBuildingActions = false;
ace_interact_menu_alwaysUseCursorInteraction = false;
ace_interact_menu_alwaysUseCursorSelfInteraction = true;
ace_interact_menu_colorShadowMax = [0,0,0,1];
ace_interact_menu_colorShadowMin = [0,0,0,0.25];
ace_interact_menu_colorTextMax = [1,1,1,1];
ace_interact_menu_colorTextMin = [1,1,1,0.25];
ace_interact_menu_cursorKeepCentered = false;
ace_interact_menu_cursorKeepCenteredSelfInteraction = false;
ace_interact_menu_menuAnimationSpeed = 0;
ace_interact_menu_menuBackground = 0;
ace_interact_menu_menuBackgroundSelf = 0;
ace_interact_menu_selectorColor = [1,0,0];
ace_interact_menu_shadowSetting = 2;
ace_interact_menu_textSize = 2;
ace_interact_menu_useListMenu = true;
ace_interact_menu_useListMenuSelf = true;

// ACE Logistics
force ace_cargo_enable = true;
force ace_cargo_loadTimeCoefficient = 5;
force ace_cargo_paradropTimeCoefficent = 2.5;
force ace_rearm_distance = 20w;
force ace_rearm_level = 0;
force ace_rearm_supply = 0;
force ace_refuel_hoseLength = 12;
force ace_refuel_rate = 1;
force ace_repair_addSpareParts = false;
force ace_repair_autoShutOffEngineWhenStartingRepair = true;
force ace_repair_consumeItem_toolKit = 0;
force ace_repair_displayTextOnRepair = true;
force ace_repair_engineerSetting_fullRepair = 0;
force ace_repair_engineerSetting_repair = 0;
force ace_repair_engineerSetting_wheel = 0;
force ace_repair_fullRepairLocation = 3;
force ace_repair_fullRepairRequiredItems = ["ToolKit"];
force ace_repair_miscRepairRequiredItems = ["ToolKit"];
force ace_repair_repairDamageThreshold = 0.399202;
force ace_repair_repairDamageThreshold_engineer = 0.50019;
force ace_repair_wheelRepairRequiredItems = [];

// ACE Magazine Repack
force ace_magazinerepack_repackAnimation = true;
force ace_magazinerepack_repackLoadedMagazines = false;
force ace_magazinerepack_timePerAmmo = 1.5;
force ace_magazinerepack_timePerBeltLink = 4;
force ace_magazinerepack_timePerMagazine = 1;


// ACE Map
force ace_map_BFT_Enabled = false;
force ace_map_BFT_HideAiGroups = false;
force ace_map_BFT_Interval = 1;
force ace_map_BFT_ShowPlayerNames = false;
force ace_map_DefaultChannel = -1;
force ace_map_mapGlow = true;
force ace_map_mapIllumination = true;
force ace_map_mapLimitZoom = false;
force ace_map_mapShake = true;
force ace_map_mapShowCursorCoordinates = false;
ace_markers_moveRestriction = 0;

// ACE Map Gestures
ace_map_gestures_defaultColor = [1,0.88,0,0.7];
ace_map_gestures_defaultLeadColor = [1,0.88,0,0.95];
force ace_map_gestures_enabled = true;
force ace_map_gestures_interval = 0.03;
force ace_map_gestures_maxRange = 7;
ace_map_gestures_nameTextColor = [0.2,0.2,0.2,0.3];

// ACE Map Tools
ace_maptools_drawStraightLines = true;
ace_maptools_rotateModifierKey = 1;

// ACE Medical
force ace_medical_ai_enabledFor = 2;
force ace_medical_AIDamageThreshold = 1;
force ace_medical_bleedingCoefficient = 1;
force ace_medical_blood_bloodLifetime = 60;
force ace_medical_blood_enabledFor = 2;
force ace_medical_blood_maxBloodObjects = 100;
force ace_medical_fatalDamageSource = 2;
ace_medical_feedback_bloodVolumeEffectType = 0;
ace_medical_feedback_painEffectType = 2;
force ace_medical_fractureChance = 0.8;
force ace_medical_fractures = 1;
ace_medical_gui_enableActions = 0;
ace_medical_gui_enableMedicalMenu = 1;
ace_medical_gui_enableSelfActions = true;
force ace_medical_gui_maxDistance = 5;
ace_medical_gui_openAfterTreatment = true;
force ace_medical_ivFlowRate = 1;
force ace_medical_limping = 1;
force ace_medical_painCoefficient = 1;
force ace_medical_playerDamageThreshold = 1;
force ace_medical_spontaneousWakeUpChance = 0.5;
force ace_medical_spontaneousWakeUpEpinephrineBoost = 30;
force ace_medical_statemachine_AIUnconsciousness = true;
force ace_medical_statemachine_cardiacArrestTime = 150;
force ace_medical_statemachine_fatalInjuriesAI = 0;
force ace_medical_statemachine_fatalInjuriesPlayer = 1;
force ace_medical_treatment_advancedBandages = 1;
force ace_medical_treatment_advancedDiagnose = true;
force ace_medical_treatment_advancedMedication = true;
force ace_medical_treatment_allowLitterCreation = true;
force ace_medical_treatment_allowSelfIV = 1;
force ace_medical_treatment_allowSelfPAK = 1;
force ace_medical_treatment_allowSelfStitch = 1;
force ace_medical_treatment_allowSharedEquipment = 0;
force ace_medical_treatment_clearTraumaAfterBandage = true;
force ace_medical_treatment_consumePAK = 1;
force ace_medical_treatment_consumeSurgicalKit = 1;
force ace_medical_treatment_convertItems = 0;
force ace_medical_treatment_cprSuccessChance = 0.4;
force ace_medical_treatment_holsterRequired = 0;
force ace_medical_treatment_litterCleanupDelay = 300;
force ace_medical_treatment_locationEpinephrine = 0;
force ace_medical_treatment_locationPAK = 0;
force ace_medical_treatment_locationsBoostTraining = false;
force ace_medical_treatment_locationSurgicalKit = 0;
force ace_medical_treatment_maxLitterObjects = 50;
force ace_medical_treatment_medicEpinephrine = 0;
force ace_medical_treatment_medicIV = 0;
force ace_medical_treatment_medicPAK = 0;
force ace_medical_treatment_medicSurgicalKit = 0;
force ace_medical_treatment_timeCoefficientPAK = 1;

// ACE Name Tags
ace_nametags_defaultNametagColor = [0.77,0.51,0.08,1];
ace_nametags_nametagColorBlue = [0.67,0.67,1,1];
ace_nametags_nametagColorGreen = [0.67,1,0.67,1];
ace_nametags_nametagColorMain = [1,1,1,1];
ace_nametags_nametagColorRed = [1,0.67,0.67,1];
ace_nametags_nametagColorYellow = [1,1,0.67,1];
force ace_nametags_playerNamesMaxAlpha = 0.8;
force ace_nametags_playerNamesViewDistance = 5;
force ace_nametags_showCursorTagForVehicles = false;
ace_nametags_showNamesForAI = true;
ace_nametags_showPlayerNames = 1;
ace_nametags_showPlayerRanks = true;
ace_nametags_showSoundWaves = 1;
ace_nametags_showVehicleCrewInfo = true;
ace_nametags_tagSize = 2;

// ACE Nightvision
force ace_nightvision_aimDownSightsBlur = 1;
force ace_nightvision_disableNVGsWithSights = false;
force ace_nightvision_effectScaling = 1;
force ace_nightvision_fogScaling = 1;
force ace_nightvision_noiseScaling = 1;
ace_nightvision_shutterEffects = false;

// ACE Overheating
ace_overheating_displayTextOnJam = true;
force ace_overheating_enabled = true;
force ace_overheating_overheatingDispersion = true;
ace_overheating_showParticleEffects = true;
ace_overheating_showParticleEffectsForEveryone = false;
force ace_overheating_unJamFailChance = 0.1;
force ace_overheating_unJamOnreload = true;

// ACE Pointing
force ace_finger_enabled = false;
ace_finger_indicatorColor = [0.83,0.68,0.21,0.75];
ace_finger_indicatorForSelf = true;
force ace_finger_maxRange = 4;

// ACE Pylons
force ace_pylons_enabledForZeus = true;
force ace_pylons_enabledFromAmmoTrucks = true;
force ace_pylons_rearmNewPylons = false;
force ace_pylons_requireEngineer = false;
force ace_pylons_requireToolkit = true;
force ace_pylons_searchDistance = 15;
force ace_pylons_timePerPylon = 5;

// ACE Quick Mount
force ace_quickmount_distance = 3;
force ace_quickmount_enabled = true;
ace_quickmount_enableMenu = 3;
ace_quickmount_priority = 0;
force ace_quickmount_speed = 18;

// ACE Respawn
force ace_respawn_removeDeadBodiesDisconnected = true;
force ace_respawn_savePreDeathGear = false;

// ACE Scopes
force ace_scopes_correctZeroing = true;
force ace_scopes_deduceBarometricPressureFromTerrainAltitude = false;
force ace_scopes_defaultZeroRange = 100;
force ace_scopes_enabled = true;
force ace_scopes_forceUseOfAdjustmentTurrets = false;
force ace_scopes_overwriteZeroRange = false;
force ace_scopes_simplifiedZeroing = false;
ace_scopes_useLegacyUI = false;
force ace_scopes_zeroReferenceBarometricPressure = 1013.25;
force ace_scopes_zeroReferenceHumidity = 0;
force ace_scopes_zeroReferenceTemperature = 15;

// ACE Spectator
force ace_spectator_enableAI = false;
ace_spectator_maxFollowDistance = 5;
force ace_spectator_restrictModes = 0;
force ace_spectator_restrictVisions = 0;

// ACE Switch Units
force ace_switchunits_enableSafeZone = true;
force ace_switchunits_enableSwitchUnits = false;
force ace_switchunits_safeZoneRadius = 100;
force ace_switchunits_switchToCivilian = false;
force ace_switchunits_switchToEast = false;
force ace_switchunits_switchToIndependent = false;
force ace_switchunits_switchToWest = false;

// ACE Uncategorized
force ace_fastroping_requireRopeItems = false;
force ace_gforces_enabledFor = 1;
force ace_hitreactions_minDamageToTrigger = 0.1;
ace_inventory_inventoryDisplaySize = 0;
force ace_laser_dispersionCount = 2;
force ace_microdagr_mapDataAvailable = 2;
force ace_microdagr_waypointPrecision = 3;
ace_optionsmenu_showNewsOnMainMenu = true;
force ace_overpressure_distanceCoefficient = 1;
ace_tagging_quickTag = 3;

// ACE User Interface
force ace_ui_allowSelectiveUI = true;
ace_ui_ammoCount = false;
ace_ui_ammoType = true;
ace_ui_commandMenu = true;
ace_ui_firingMode = true;
ace_ui_groupBar = true;
ace_ui_gunnerAmmoCount = true;
ace_ui_gunnerAmmoType = true;
ace_ui_gunnerFiringMode = true;
ace_ui_gunnerLaunchableCount = true;
ace_ui_gunnerLaunchableName = true;
ace_ui_gunnerMagCount = true;
ace_ui_gunnerWeaponLowerInfoBackground = true;
ace_ui_gunnerWeaponName = true;
ace_ui_gunnerWeaponNameBackground = true;
ace_ui_gunnerZeroing = true;
ace_ui_magCount = true;
ace_ui_soldierVehicleWeaponInfo = true;
ace_ui_staminaBar = true;
ace_ui_stance = true;
ace_ui_throwableCount = true;
ace_ui_throwableName = true;
ace_ui_vehicleAltitude = true;
ace_ui_vehicleCompass = true;
ace_ui_vehicleDamage = true;
ace_ui_vehicleFuelBar = true;
ace_ui_vehicleInfoBackground = true;
ace_ui_vehicleName = true;
ace_ui_vehicleNameBackground = true;
ace_ui_vehicleRadar = true;
ace_ui_vehicleSpeed = true;
ace_ui_weaponLowerInfoBackground = true;
ace_ui_weaponName = true;
ace_ui_weaponNameBackground = true;
ace_ui_zeroing = true;

// ACE Vehicle Lock
force ace_vehiclelock_defaultLockpickStrength = 60;
force ace_vehiclelock_lockVehicleInventory = false;
force ace_vehiclelock_vehicleStartingLockState = -1;

// ACE Vehicles
ace_vehicles_hideEjectAction = true;
force ace_vehicles_keepEngineRunning = false;
ace_vehicles_speedLimiterStep = 5;

// ACE View Distance Limiter
force ace_viewdistance_enabled = false;
force ace_viewdistance_limitViewDistance = 10000;
ace_viewdistance_objectViewDistanceCoeff = 0;
ace_viewdistance_viewDistanceAirVehicle = 0;
ace_viewdistance_viewDistanceLandVehicle = 0;
ace_viewdistance_viewDistanceOnFoot = 0;

// ACE Weapons
ace_common_persistentLaserEnabled = false;
force ace_laserpointer_enabled = true;
ace_reload_displayText = true;
force ace_reload_showCheckAmmoSelf = true;
ace_weaponselect_displayText = true;

// ACE Weather
force ace_weather_enabled = true;
ace_weather_showCheckAirTemperature = false;
force ace_weather_updateInterval = 60;
force ace_weather_windSimulation = true;

// ACE Wind Deflection
force ace_winddeflection_enabled = true;
force ace_winddeflection_simulationInterval = 0.05;
force ace_winddeflection_vehicleEnabled = true;

// ACE Zeus
force ace_zeus_autoAddObjects = false;
force ace_zeus_canCreateZeus = -1;
force ace_zeus_radioOrdnance = false;
force ace_zeus_remoteWind = false;
force ace_zeus_revealMines = 0;
force ace_zeus_zeusAscension = false;
force ace_zeus_zeusBird = false;

// CBA UI
cba_ui_notifyLifetime = 4;
cba_ui_StorePasswords = 1;

// CBA Weapons
cba_disposable_dropUsedLauncher = 2;
force cba_disposable_replaceDisposableLauncher = true;
cba_events_repetitionMode = 1;
cba_optics_usePipOptics = true;

// Fire For Effect
force RydFFE_2PhWithoutFO = false;
force RydFFE_Acc = 2;
force RydFFE_Active = true;
force RydFFE_Amount = 6;
force RydFFE_Debug = false;
force RydFFE_FO_string = "";
force RydFFE_FoAccGain = 1;
force RydFFE_FOClass_string = "i_spotter_f, o_spotter_f, b_spotter_f, o_recon_jtac_f, b_recon_jtac_f, i_sniper_f, o_sniper_f, b_sniper_f, i_soldier_m_f, o_soldier_m_f, b_g_soldier_m_f, b_soldier_m_f, o_recon_m_f, b_recon_m_f, o_soldieru_m_f, i_uav_01_f, i_uav_02_cas_f, i_uav_02_f, o_uav_01_f, o_uav_02_cas_f, o_uav_02_f, b_uav_01_f, b_uav_02_cas_f, b_uav_02_f";
force RydFFE_Monogamy = true;
force RydFFE_OnePhase = false;
force RydFFE_Safe = 100;
force RydFFE_ShellView = false;

// NMAB Settings
NMAB_setting_particlesEnabled = true;

// Unit Ambient SFX Options
force UAS_option_chanceCough = 0.1;
force UAS_option_chanceRadio = 0.5;
force UAS_option_chanceSigh = 0.1;
force UAS_option_chanceWhistle = 0.03;
force UAS_option_disableOnPlayers = false;
force UAS_option_disableRadioOnPlayers = false;
force UAS_option_enableCough = true;
force UAS_option_enableRadio = true;
force UAS_option_enableSigh = true;
force UAS_option_enableWhistle = true;
force UAS_option_groupRadio = 0;
force UAS_option_intMultiplierCough = 2.5;
force UAS_option_intMultiplierRadio = 2.5;
force UAS_option_intMultiplierSigh = 2.5;
force UAS_option_intMultiplierWhistle = 2.5;
force UAS_option_maxDistCough = 250;
force UAS_option_maxDistRadio = 250;
force UAS_option_maxDistRadioInVehicle = 100;
force UAS_option_maxDistSigh = 150;
force UAS_option_maxDistWhistle = 250;
force UAS_option_minIntervalCough = 60;
force UAS_option_minIntervalRadio = 20;
force UAS_option_minIntervalSigh = 60;
force UAS_option_minIntervalWhistle = 120;

// Unit Voice-Over Options
force UVO_option_clientEnabled = true;
force UVO_option_deathShoutsVolume = 3;
force UVO_option_enableSentencesCustom_CZ = true;
force UVO_option_enableSentencesCustom_RU = true;
force UVO_option_enableSentencesEast = true;
force UVO_option_enableSentencesGuer = true;
force UVO_option_enableSentencesWest = true;
force UVO_option_enableUVOCustom_CZ = true;
force UVO_option_enableUVOCustom_RU = true;
force UVO_option_enableUVOEast = true;
force UVO_option_enableUVOGuer = true;
force UVO_option_enableUVOWest = true;
force UVO_option_killConfirmChanceAI = 1;
force UVO_option_killConfirmChancePlayer = 1;
force UVO_option_maxDistDeathShouts = 300;
force UVO_option_maxDistVoices = 300;
force UVO_option_soundsSamplePitch = 1;

// Vandeanson's Apocalypse - AI
force VA_SpecialFAKits = 1.06175;
force VA_vDogFerAmnt = 1;
force VA_vDogFerAmntRnd = 2;
force VA_vDogFerTerritory = 900;
force VAAI_MilGrChnc = 88.3847;
force VAAI_Ptrl_Side = "red";
force VAAI_Ptrl_Units = "";
force VAAI_Stlk_GrpMax = 2;
force VAAI_Stlk_GrpMin = 3;
force VAAI_Stlk_MaxDist = 800;
force VAAI_Stlk_MinDist = 500;
force VAAI_Stlk_Pres = 300;
force VAAI_Stlkr_dogChnc = 0;
force VAAI_Stlkr_Side = "red";
force VAAI_Stlkr_Units = "";
force VAAS_Cnt = 0;
force VADBO_Cnt = 0;
force VADOG_Cnt = 0;
force VAPT_Cnt = 1;
force VAST_Cnt = 0;
force VD_AI_Equipper_Allow = true;
force VD_AI_Patrol_DelRange = 1500;
force VD_AI_Patrol_DistWP = 525;
force VD_AI_Patrol_GrpMaxSize = 4;
force VD_AI_Patrol_GrpMinSize = 5;
force VD_AI_Patrol_RespawnMaxRnd = 600;
force VD_AI_Patrol_RespawnMin = 600;
force VD_AI_Patrol_SpwnMaxDist = 1000;
force VD_AI_Patrol_SpwnMinDist = 500;
force VD_AI_Rvg_equipper = false;
force VD_AI_Stlk_RespawnMaxRnd = 1200;
force VD_AI_Stlk_RespawnMin = 600;
force VD_AIBackpackChance = 74.2297;
force VD_AIBinocularChance = 5;
force VD_AICustomItemChance = 66;
force VD_AICustomItems = "ACE_ATragMX,ACE_Cellphone,ACE_DAGR,ACE_Flashlight_MX991,ACE_HuntIR_monitor,ACE_microDAGR,FirstAidKit,ACE_Kestrel4500,ItemGPS,ACE_Banana,ACE_Can_Franta,Ace_Can_Spirit,ACE_Can_Redgull,ACE_SpraypaintBlue,ACE_Altimeter,ACE_WaterBottle";
force VD_AICustomItemsCount = 1;
force VD_AIExplosiveAmount = 1.41223;
force VD_AIExplosiveChance = 26.9608;
force VD_AIGrenadeAmount = 1.70402;
force VD_AIGrenadeChance = 32.7964;
force VD_AIHeadgearChance = 87.6517;
force VD_AIItemChance = 33;
force VD_AIItemsCount = 3;
force VD_AIMapChance = 5;
force VD_AIMoneyAmount = 0;
force VD_AIMoneyChance = 0;
force VD_AIPistolAmmo = 3.97993;
force VD_AIPistolAmmoAdd = 3;
force VD_AIPistolChance = 100;
force VD_AIPistolMuzzleChance = 24.043;
force VD_AIPistolOpticChance = 22.2923;
force VD_AIPistolPointerChance = 10;
force VD_AIRadioChance = 10;
force VD_AIRifleAmmo = 4.50513;
force VD_AIRifleAmmoAdd = 4.44678;
force VD_AIRifleChance = 80.9096;
force VD_AIRifleMuzzleChance = 29.295;
force VD_AIRifleOpticChance = 22.2923;
force VD_AIRiflePointerChance = 12.3716;
force VD_AIRifleUnderbarrelChance = 33.9636;
force VD_AIVestChance = 60.8077;
force VD_currencyArray = "";

// Vandeanson's Apocalypse - AI Skills
force VA_enableAISkill = true;
force VAAI_aimingAccuracy = 0.399202;
force VAAI_aimingShake = 0.2521;
force VAAI_aimingSpeed = 0.440792;
force VAAI_commanding = 0.903003;
force VAAI_courage = 0.869182;
force VAAI_reloadSpeed = 0.310457;
force VAAI_spotDistance = 0.412608;
force VAAI_spotTime = 0.384425;

// Vandeanson's Apocalypse - Basebuilding
force VABB_Enable = false;
force VABB_InvOpenKey = false;

// Vandeanson's Apocalypse - Bleeding
force VA_NoFAK = false;
force VABL_addRndFreq = 0;
force VABL_Bandage_Chance = 0;
force VABL_BaseFreq = 0;
force VABL_Bloodbag_Chance = 0;
force VABL_Chance = 0;
force VABL_Enable = false;
force VABL_GainFreq = 0;

// Vandeanson's Apocalypse - General
force VA_AllowEndLoadScr = true;
force VA_DebugHint = false;
force VA_DebugMrkrSites = false;
force VA_DisableVA = false;
force VA_MapMaxRadius = 0.8;
force VA_POI_Chance = 0;
force VD_Coast_Blacklist_Area = "";
force VD_Land_Blacklist_Area = "";
force VD_UptimeFix = 3600;
force VD_UptimeRnd = 500;
force VDA_ZEUS_Sleep = 0;

// Vandeanson's Apocalypse - HUD
force VA_HUD = false;

// Vandeanson's Apocalypse - Infection
force VA_InfectEnable = false;
force VAInf_BaseFreq = 0;
force VD_Infection_Chance = 0;
force VD_Infection_Injector_Chance = 0;
force VD_Infection_Pill_Chance = 0;
force VD_InfectionInstigator = "";

// Vandeanson's Apocalypse - Loot Economy - Additional Loot
force VA_eqBckpCivAdd = "";
force VA_eqBckpMilAdd = "";
force VA_eqFaceCivAdd = "";
force VA_eqFaceMilAdd = "";
force VA_eqHeadCivAdd = "";
force VA_eqHeadMilAdd = "";
force VA_eqHeadPolR = "";
force VA_eqItemCivAdd = "ACE_ATragMX,ACE_Cellphone,ACE_DAGR,ACE_Flashlight_MX991,ACE_HuntIR_monitor,ACE_microDAGR,ACE_Flashlight_Maglite_ML300L,ACE_UAVBattery,ACE_Flashlight_XL50,ACE_Flashlight_KSF1,ACE_Kestrel4500,ACE_WaterBottle";
force VA_eqMedicCivAdd = "ACE_adenosine,ACE_atropine,ACE_fieldDressing,ACE_elasticBandage,ACE_quikclot,ACE_bloodIV,ACE_bloodIV_250,ACE_bloodIV_500,ACE_bodyBag,ACE_epinephrine,ACE_packingBandage,ACE_plasmaIV,ACE_plasmaIV_250,ACE_plasmaIV_500,ACE_salineIV,ACE_salineIV_250,ACE_salineIV_500,ACE_surgicalKit,ACE_tourniquet,ACE_morphine,FirstAidKti";
force VA_eqUnifCivAdd = "";
force VA_eqUnifMilAdd = "";
force VA_eqUnifPolR = "";
force VA_eqVestCivAdd = "";
force VA_eqVestMilAdd = "";
force VA_eqVestPolR = "";
force VA_wpLaunCivAdd = "";
force VA_wpLaunMilAdd = "";
force VA_wpPistCivAdd = "ACE_Flashlight_Maglite_ML300L";
force VA_wpPistMilAdd = "";
force VA_wpPistPolR = "";
force VA_wpRiflCivAdd = "";
force VA_wpRiflMilAdd = "rhs_weap_ak74n,arifle_AKS_F,srifle_DMR_06_olive_F,rhs_weap_m24sws_wd,rhs_weap_mg42,SMG_03C_TR_camo";
force VA_wpRiflPolR = "rhs_weap_ak74n,arifle_AKS_F,srifle_DMR_06_olive_F,rhs_weap_m24sws_wd,rhs_weap_mg42,SMG_03C_TR_camo";

// Vandeanson's Apocalypse - Loot Economy - Blacklisting
force VA_EqBlItems = "eo_flashlight,VA_AVM_Pill_F,VA_AVM_Injector_F,VA_Bloodbag_F,VA_Bandage_F";
force VA_EqBlMedical = "VA_AVM_Pill_F,VA_AVM_Injector_F,VA_Bloodbag_F,VA_Bandage_F";
force VA_EqCivBlBackpacks = "";
force VA_EqCivBlGoggles = "";
force VA_EqCivBlHeadgears = "";
force VA_EqCivBlUniforms = "";
force VA_EqCivBlVests = "";
force VA_EqMilBlBackpacks = "";
force VA_EqMilBlGoggles = "";
force VA_EqMilBlHeadgears = "";
force VA_EqMilBlUniforms = "";
force VA_EqMilBlVests = "";
force VA_exclDLCGr = false;
force VA_exclDLCWp = false;
force VA_exclrvgGr = false;
force VA_exclRvgWp = false;
force VA_exclVanGr = false;
force VA_exclVanWp = false;
force VA_RvgGrPool = false;
force VA_WpCivBlLaunchers = "";
force VA_WpCivBlPistols = "eo_flashlight,hgun_Pistol_Signal_F,rhs_weap_rsp30_white,rhs_weap_rsp30_green,rhs_weap_rsp30_red,rhs_weap_tr8,ACE_VMH3,ACE_VMM3,hgun_esd_01_F";
force VA_WpCivBlRifles = "";
force VA_WpMilBlLaunchers = "";
force VA_WpMilBlPistols = "eo_flashlight,hgun_Pistol_Signal_F,rhs_weap_rsp30_white,rhs_weap_rsp30_green,rhs_weap_rsp30_red,rhs_weap_tr8,ACE_VMH3,ACE_VMM3,hgun_esd_01_F";
force VA_WpMilBlRifles = "";

// Vandeanson's Apocalypse - Loot Economy - General
force VALE_Allow = false;
force VALE_AllowServ = true;
force VALE_Backpack = 0;
force VALE_Bipod = 0;
force VALE_BuildingChnc = 50.0746;
force VALE_Explo = 0;
force VALE_Flashlight = 0;
force VALE_Goggles = 0;
force VALE_Grenades = 0;
force VALE_Headgear = 2.43506;
force VALE_Items = 8.6256;
force VALE_Launch = 0;
force VALE_LootChanceGen = 13;
force VALE_Mag = 0;
force VALE_Max = 0;
force VALE_Medical = 6.19;
force VALE_MilBackpack = 1;
force VALE_MilBipod = 2.5478;
force VALE_MilExplo = 1.92776;
force VALE_MilFlashlight = 1.81503;
force VALE_MilGoggles = 4.97159;
force VALE_MilGrenades = 2.15323;
force VALE_MilHeadgear = 3.56241;
force VALE_MilItems = 7.73358;
force VALE_MilLaunch = 1;
force VALE_MilMag = 4.01335;
force VALE_MilMax = 0;
force VALE_MilMedical = 8.35362;
force VALE_MilMuzz = 1.81503;
force VALE_MilOpt = 2.92273;
force VALE_MilPist = 1.36409;
force VALE_MilRifl = 1.30772;
force VALE_MilUnif = 4.85885;
force VALE_MilVest = 4.46428;
force VALE_Muzz = 0;
force VALE_offset = false;
force VALE_offsetZ = 0.5;
force VALE_Opt = 0;
force VALE_Pist = 0.843552;
force VALE_Rifl = 0.962361;
force VALE_SpwnRadius = 150;
force VALE_SpwnSaveZone = 19.9579;
force VALE_Unif = 6.3244;
force VALE_Vest = 0;

// Vandeanson's Apocalypse - Loot Economy - Whitelisting
force VA_eqBckpCivR = "";
force VA_eqBckpMilR = "";
force VA_eqFaceCivR = "";
force VA_eqFaceMilR = "";
force VA_eqHeadCivR = "H_PASGT_basic_black_F,H_PASGT_basic_blue_F,H_PASGT_basic_olive_F,H_PASGT_basic_white_F,rhs_altyn_visordown,rhs_altyn_novisor,rhs_altyn_novisor_ess,rhs_altyn,rhssaf_bandana_smb,H_Bandanna_gry,H_Bandanna_blu,H_Bandanna_cbr,H_Bandanna_khk,rhs_beanie,rhs_Booniehat_digi,rhs_Booniehat_flora,rhssaf_booniehat_digital,rhssaf_booniehat_md2camo,rhssaf_booniehat_woodland,H_Booniehat_mgrn,H_Booniehat_mcamo,H_Booniehat_oli,H_Booniehat_tan,H_Booniehat_taiga,H_Booniehat_tna_F,H_Booniehat_wdl,rhs_Booniehat_m81,H_Cap_blk,H_Cap_blu,H_Cap_grn,H_Cap_oli,H_Cap_red,H_Cap_surfer,H_Cap_tan,H_HelmetB,H_HelmetB_snakeskin,H_HelmetB_plain_wdl,eo_construction_1,eo_construction_2,eo_presshelmet_1,eo_presshelmet_2,eo_presshelmet_3,eo_racing_1,eo_racing_2,eo_racing_3,eo_racing_4,eo_racing_5,eo_safari_4,eo_safari_1,eo_safari_2,eo_safari_3,eo_skate_1,eo_skate_2,eo_skate_3,H_Construction_basic_black_F,H_Construction_earprot_black_F,H_Construction_basic_orange_F,H_Construction_earprot_orange_F,H_Construction_basic_red_F,H_Construction_earprot_red_F,H_Construction_basic_vrana_F,H_Construction_earprot_vrana_F,H_Construction_basic_white_F,H_Construction_earprot_white_F,H_Construction_basic_yellow_F,H_Construction_earprot_yellow_F,rhsusf_lwh_helmet_marpatwd,rhsusf_lwh_helmet_marpatwd_blk_ess,rhsusf_lwh_helmet_marpatwd_ess,rhsgref_helmet_M1_painted,rhsgref_helmet_M1_painted_alt01,rhsgref_hat_m1941cap,rhsgref_helmet_m1940_camo01,rhsgref_helmet_m1940,rhsgref_helmet_m1940_alt1,rhsgref_helmet_m1940_camo01_alt1,rhsgref_helmet_m1942,rhsgref_helmet_m1942_alt1,rhsgref_helmet_m1942_camo01,rhsgref_helmet_m1942_camo01_alt1,rhsgref_helmet_m1942_heergreycover,rhsgref_helmet_m1942_heersplintercover,rhsgref_helmet_m1942_heermarshcover,rhsgref_hat_m43cap_heer,rhsgref_hat_m43cap_heer1_tilted,rhssaf_helmet_m97_black_nocamo,rhssaf_helmet_m97_black_nocamo_black_ess,rhssaf_helmet_m97_black_nocamo_black_ess_bare,rhssaf_helmet_m97_nostrap_blue,rhssaf_helmet_m97_nostrap_blue_tan_ess,rhssaf_helmet_m97_nostrap_blue_tan_ess_bare,rhssaf_helmet_m97_digital,rhssaf_helmet_m97_digital_black_ess,rhssaf_helmet_m97_digital_black_ess_bare,rhssaf_helmet_m97_veil_digital,rhssaf_helmet_m97_md2camo_black_ess,rhssaf_helmet_m97_veil_md2camo,rhssaf_helmet_m97_oakleaf_black_ess,rhssaf_helmet_m97_veil_oakleaf,rhssaf_helmet_m97_olive_nocamo_black_ess_bare,rhssaf_helmet_m97_olive_nocamo_black_ess,rhssaf_helmet_m97_olive_nocamo,rhssaf_helmet_m97_woodland,rhssaf_helmet_m97_woodland_black_ess,rhssaf_helmet_m97_woodland_black_ess_bare,rhssaf_helmet_m97_veil_woodland,H_PASGT_basic_blue_press_F,H_PASGT_neckprot_blue_press_F,H_RacingHelmet_1_black_F,H_RacingHelmet_1_blue_F,H_RacingHelmet_2_F,H_RacingHelmet_1_F,H_RacingHelmet_1_green_F,H_RacingHelmet_1_orange_F,H_RacingHelmet_1_red_F,H_RacingHelmet_3_F,H_RacingHelmet_4_F,H_RacingHelmet_1_white_F,H_RacingHelmet_1_yellow_F,H_Hat_Safari_olive_F,H_Hat_Safari_sand_F,H_Shemag_olive,H_ShemagOpen_tan,H_Helmet_Skate";
force VA_eqHeadMilR = "H_PASGT_basic_black_F,H_PASGT_basic_blue_F,H_PASGT_basic_olive_F,H_PASGT_basic_white_F,rhs_altyn_visordown,rhs_altyn_novisor,rhs_altyn_novisor_ess,rhs_altyn,rhssaf_bandana_smb,H_Bandanna_gry,H_Bandanna_blu,H_Bandanna_cbr,H_Bandanna_khk,rhs_beanie,rhs_Booniehat_digi,rhs_Booniehat_flora,rhssaf_booniehat_digital,rhssaf_booniehat_md2camo,rhssaf_booniehat_woodland,H_Booniehat_mgrn,H_Booniehat_mcamo,H_Booniehat_oli,H_Booniehat_tan,H_Booniehat_taiga,H_Booniehat_tna_F,H_Booniehat_wdl,rhs_Booniehat_m81,H_Cap_blk,H_Cap_blu,H_Cap_grn,H_Cap_oli,H_Cap_red,H_Cap_surfer,H_Cap_tan,H_HelmetB,H_HelmetB_snakeskin,H_HelmetB_plain_wdl,eo_construction_1,eo_construction_2,eo_presshelmet_1,eo_presshelmet_2,eo_presshelmet_3,eo_racing_1,eo_racing_2,eo_racing_3,eo_racing_4,eo_racing_5,eo_safari_4,eo_safari_1,eo_safari_2,eo_safari_3,eo_skate_1,eo_skate_2,eo_skate_3,H_Construction_basic_black_F,H_Construction_earprot_black_F,H_Construction_basic_orange_F,H_Construction_earprot_orange_F,H_Construction_basic_red_F,H_Construction_earprot_red_F,H_Construction_basic_vrana_F,H_Construction_earprot_vrana_F,H_Construction_basic_white_F,H_Construction_earprot_white_F,H_Construction_basic_yellow_F,H_Construction_earprot_yellow_F,rhsusf_lwh_helmet_marpatwd,rhsusf_lwh_helmet_marpatwd_blk_ess,rhsusf_lwh_helmet_marpatwd_ess,rhsgref_helmet_M1_painted,rhsgref_helmet_M1_painted_alt01,rhsgref_hat_m1941cap,rhsgref_helmet_m1940_camo01,rhsgref_helmet_m1940,rhsgref_helmet_m1940_alt1,rhsgref_helmet_m1940_camo01_alt1,rhsgref_helmet_m1942,rhsgref_helmet_m1942_alt1,rhsgref_helmet_m1942_camo01,rhsgref_helmet_m1942_camo01_alt1,rhsgref_helmet_m1942_heergreycover,rhsgref_helmet_m1942_heersplintercover,rhsgref_helmet_m1942_heermarshcover,rhsgref_hat_m43cap_heer,rhsgref_hat_m43cap_heer1_tilted,rhssaf_helmet_m97_black_nocamo,rhssaf_helmet_m97_black_nocamo_black_ess,rhssaf_helmet_m97_black_nocamo_black_ess_bare,rhssaf_helmet_m97_nostrap_blue,rhssaf_helmet_m97_nostrap_blue_tan_ess,rhssaf_helmet_m97_nostrap_blue_tan_ess_bare,rhssaf_helmet_m97_digital,rhssaf_helmet_m97_digital_black_ess,rhssaf_helmet_m97_digital_black_ess_bare,rhssaf_helmet_m97_veil_digital,rhssaf_helmet_m97_md2camo_black_ess,rhssaf_helmet_m97_veil_md2camo,rhssaf_helmet_m97_oakleaf_black_ess,rhssaf_helmet_m97_veil_oakleaf,rhssaf_helmet_m97_olive_nocamo_black_ess_bare,rhssaf_helmet_m97_olive_nocamo_black_ess,rhssaf_helmet_m97_olive_nocamo,rhssaf_helmet_m97_woodland,rhssaf_helmet_m97_woodland_black_ess,rhssaf_helmet_m97_woodland_black_ess_bare,rhssaf_helmet_m97_veil_woodland,H_PASGT_basic_blue_press_F,H_PASGT_neckprot_blue_press_F,H_RacingHelmet_1_black_F,H_RacingHelmet_1_blue_F,H_RacingHelmet_2_F,H_RacingHelmet_1_F,H_RacingHelmet_1_green_F,H_RacingHelmet_1_orange_F,H_RacingHelmet_1_red_F,H_RacingHelmet_3_F,H_RacingHelmet_4_F,H_RacingHelmet_1_white_F,H_RacingHelmet_1_yellow_F,H_Hat_Safari_olive_F,H_Hat_Safari_sand_F,H_Shemag_olive,H_ShemagOpen_tan,H_Helmet_Skate";
force VA_eqUnifCivR = "";
force VA_eqUnifMilR = "";
force VA_eqUnifSpecR = "";
force VA_eqVestCivR = "V_Pocketed_black_F,V_Pocketed_coyote_F,V_Pocketed_olive_F,VTacChestrig_oli_F,V_TacChestrig_grn_F,V_TacChestrig_cbr_F";
force VA_eqVestMilR = "eo_platecarrier_1,eo_platecarrier_2,eo_platecarrier_3,eo_platecarrier_4,eo_platecarrier_5,eo_tacvest_1,eo_tacvest_2,eo_tacvest_3,eo_tacvest_4,eo_ravenvest_1,V_EOD_blue_F,V_EOD_olive_F,V_EOD_coyote_F";
force VA_eqVestSpecR = "";
force VA_wpLaunCivR = "";
force VA_wpLaunMilR = "";
force VA_wpPistCivR = "";
force VA_wpPistMilR = "";
force VA_wpRiflCivR = "rhs_weap_ak74n,arifle_AKS_F,rhs_weap_mg42,SMG_03C_TR_camo,rhs_weap_kar98k,sgun_HunterShotgun_01_F,sgun_HunterShotgun_01_sawedoff_F,rhs_weap_m1garand_sa43,srifle_DMR_06_hunter_F,rhs_weap_m3a1,rhs_weap_M590_8RD,rhs_weap_M590_5RD,rhs_weap_scorpion,rhs_weap_m92,rhs_weap_m38,rhs_weap_m38_rail,rhs_weap_MP44,rhs_weap_MP7A2,rhs_weap_pp2000,SMG_02_F";
force VA_wpRiflMilR = "rhs_weap_ak74n,arifle_AKS_F,rhs_weap_mg42,SMG_03C_TR_camo,rhs_weap_kar98k,sgun_HunterShotgun_01_F,sgun_HunterShotgun_01_sawedoff_F,rhs_weap_m1garand_sa43,srifle_DMR_06_hunter_F,rhs_weap_m3a1,rhs_weap_M590_8RD,rhs_weap_M590_5RD,rhs_weap_scorpion,rhs_weap_m92,rhs_weap_m38,rhs_weap_m38_rail,rhs_weap_MP44,rhs_weap_MP7A2,rhs_weap_pp2000,SMG_02_F";

// Vandeanson's Apocalypse - Player
force VA_EnableMR = false;
force VA_HealingAmt = 0.01;
force VA_HealingEnabled = false;
force VA_HealingFreq = 50;
force VA_noStam = true;
force VAPL_AimN = 1;
force VAPL_AimY = false;
force VAPL_AudibN = 1;
force VAPL_AudibY = false;
force VAPL_CamoN = 1;
force VAPL_CamoY = false;
force VAPL_loadCN = 1;
force VAPL_loadCY = false;
force VAPL_RecoilN = 1;
force VAPL_RecoilY = false;
force VAPL_SpeedN = 1;
force VAPL_SpeedY = false;
force VD_PL_Rvg_equipper = false;
force VD_PLBackpackChance = 10;
force VD_PLBinocularChance = 10;
force VD_PLCustomItemChance = 50;
force VD_PLCustomItems = "";
force VD_PLCustomItemsCount = 3;
force VD_PLExplosiveAmount = 1;
force VD_PLExplosiveChance = 10;
force VD_PLGrenadeAmount = 1;
force VD_PLGrenadeChance = 10;
force VD_PLHeadgearChance = 10;
force VD_PLItemChance = 50;
force VD_PLItemsCount = 3;
force VD_PLMapChance = 10;
force VD_PLMoneyAmount = 0;
force VD_PLMoneyChance = 0;
force VD_PLPistolAmmo = 1;
force VD_PLPistolAmmoAdd = 3;
force VD_PLPistolChance = 100;
force VD_PLPistolMuzzleChance = 10;
force VD_PLPistolOpticChance = 10;
force VD_PLPistolPointerChance = 10;
force VD_PLRadioChance = 10;
force VD_PLRifleAmmo = 1;
force VD_PLRifleAmmoAdd = 3;
force VD_PLRifleChance = 30;
force VD_PLRifleMuzzleChance = 10;
force VD_PLRifleOpticChance = 10;
force VD_PLRiflePointerChance = 10;
force VD_PLRifleUnderbarrelChance = 10;
force VD_PLVestChance = 10;
force VD_Rnd_LoadoutRespawn = false;
force VD_Rnd_Respawn_Pos = false;
force VD_Rnd_Respawn_range = 3000;

// Vandeanson's Apocalypse - Sites
force VA_BC_Dogchance = 0;
force VA_CS_Dogchance = 0;
force VA_HO_Dogchance = 0;
force VABC_Cnt = 5.40804;
force VABT_Cnt = 0;
force VACS_Cnt = 1.43558;
force VACS_UptimeFix = 600;
force VACS_UptimeRnd = 1200;
force VAHO_Cnt = 15;
force VAHS_Cnt = 0;
force VAHS_DistChk = 5250;
force VAPL_Cnt = 0;
force VASW_Cnt = 3;
force VATC_CustMrkr = "";
force VD_BC_DistanceCheck = 1500;
force VD_BC_Side = "red";
force VD_BC_Units = "B_G_Survivor_F";
force VD_Boats = "C_Rubberboat,C_Boat_Civil_01_F,C_Scooter_Transport_01_F,C_Boat_Transport_02_F,C_Boat_Civil_01_rescue_F,rhsgref_civ_canoe";
force VD_CS_AIchance = 100;
force VD_CS_Side = "red";
force VD_CS_spawnDistToOtherCS = 800;
force VD_Helicopters = "C_Heli_Light_01_Civil_F,EC135Vertlu,EC135Grislu,EC135ANlu,rhs_uh1h_idap,C_IDAP_Heli_Transport_02_F";
force VD_HO_DistanceCheck = 800;
force VD_HO_Side = "red";
force VD_PlaneMarkers = "";
force VD_Planes = "C_Plane_Civil_01_F";
force VD_SW_DistanceCheck = 1500;
force VD_SW_MaxDistance = 6000;
force VD_TC_DistanceCheck = 600;
force VD_TC_Side = "red";
force VD_TC_Spawn = 0;

// Vandeanson's Apocalypse - Temperature
force VATP_enable = false;
force VATP_light = "";
force VATP_mediumL = "";
force VATP_mediumW = "";
force VATP_vWarm = "";
force VATP_warm = "";
force VATP_WatRes = "";
force VATP_Wetsuit = "";

// VCOM DRIVING
force VCM_DRIVERLIMIT = 4;
force VCM_DrivingActivated = true;
force VCM_DrivingDelay = 0.75;
force VCM_DrivingDist = 10;

// VCOM SETTINGS
force VCM_ActivateAI = true;
force VCM_ADVANCEDMOVEMENT = true;
force VCM_AIDISTANCEVEHPATH = 100;
force VCM_AIHEALING = true;
force VCM_AIMagLimit = 2;
force VCM_ARTYDELAY = 300;
force VCM_ARTYENABLE = true;
force VCM_ARTYSIDES = [WEST,EAST];
force VCM_ARTYSPREAD = 400;
force VCM_Debug = false;
force VCM_ForceSpeed = true;
force VCM_FRMCHANGE = true;
force VCM_HEARINGDISTANCE = 800;
force VCM_LGARRISONCHANCE = 20;
force VCM_MINECHANCE = 25;
force VCM_RAGDOLL = true;
force VCM_RAGDOLLCHC = 50;
force VCM_SIDEENABLED = [WEST,EAST];
force VCM_STATICARMT = 300;
force VCM_StealVeh = false;
force VCM_WARNDELAY = 30;
force VCM_WARNDIST = 1000;

// VCOM SKILL SETTINGS
force VCM_AISKILL_AIMINGACCURACY_E = 0.25;
force VCM_AISKILL_AIMINGACCURACY_R = 0.25;
force VCM_AISKILL_AIMINGACCURACY_W = 0.25;
force VCM_AISKILL_AIMINGSHAKE_E = 0.15;
force VCM_AISKILL_AIMINGSHAKE_R = 0.15;
force VCM_AISKILL_AIMINGSHAKE_W = 0.15;
force VCM_AISKILL_AIMINGSPEED_E = 0.35;
force VCM_AISKILL_AIMINGSPEED_R = 0.35;
force VCM_AISKILL_AIMINGSPEED_W = 0.35;
force VCM_SIDESPECIFICSKILL = true;
force VCM_SKILLCHANGE = true;

// ACE Fortify
force ace_fortify_markObjectsOnMap = 0;
force ace_fortify_timeCostCoefficient = 1;
force ace_fortify_timeMin = 1.5;
acex_fortify_settingHint = 1;
