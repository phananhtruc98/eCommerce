define("ace/snippets/lsl",["require","exports","module"],function(e,t,n){"use strict";t.snippetText="snippet @\n	@${1:label};\nsnippet CAMERA_ACTIVE\n	CAMERA_ACTIVE, ${1:integer isActive}, $0\nsnippet CAMERA_BEHINDNESS_ANGLE\n	CAMERA_BEHINDNESS_ANGLE, ${1:float degrees}, $0\nsnippet CAMERA_BEHINDNESS_LAG\n	CAMERA_BEHINDNESS_LAG, ${1:float seconds}, $0\nsnippet CAMERA_DISTANCE\n	CAMERA_DISTANCE, ${1:float meters}, $0\nsnippet CAMERA_FOCUS\n	CAMERA_FOCUS, ${1:vector position}, $0\nsnippet CAMERA_FOCUS_LAG\n	CAMERA_FOCUS_LAG, ${1:float seconds}, $0\nsnippet CAMERA_FOCUS_LOCKED\n	CAMERA_FOCUS_LOCKED, ${1:integer isLocked}, $0\nsnippet CAMERA_FOCUS_OFFSET\n	CAMERA_FOCUS_OFFSET, ${1:vector meters}, $0\nsnippet CAMERA_FOCUS_THRESHOLD\n	CAMERA_FOCUS_THRESHOLD, ${1:float meters}, $0\nsnippet CAMERA_PITCH\n	CAMERA_PITCH, ${1:float degrees}, $0\nsnippet CAMERA_POSITION\n	CAMERA_POSITION, ${1:vector position}, $0\nsnippet CAMERA_POSITION_LAG\n	CAMERA_POSITION_LAG, ${1:float seconds}, $0\nsnippet CAMERA_POSITION_LOCKED\n	CAMERA_POSITION_LOCKED, ${1:integer isLocked}, $0\nsnippet CAMERA_POSITION_THRESHOLD\n	CAMERA_POSITION_THRESHOLD, ${1:float meters}, $0\nsnippet CHARACTER_AVOIDANCE_MODE\n	CHARACTER_AVOIDANCE_MODE, ${1:integer flags}, $0\nsnippet CHARACTER_DESIRED_SPEED\n	CHARACTER_DESIRED_SPEED, ${1:float speed}, $0\nsnippet CHARACTER_DESIRED_TURN_SPEED\n	CHARACTER_DESIRED_TURN_SPEED, ${1:float speed}, $0\nsnippet CHARACTER_LENGTH\n	CHARACTER_LENGTH, ${1:float length}, $0\nsnippet CHARACTER_MAX_TURN_RADIUS\n	CHARACTER_MAX_TURN_RADIUS, ${1:float radius}, $0\nsnippet CHARACTER_ORIENTATION\n	CHARACTER_ORIENTATION, ${1:integer orientation}, $0\nsnippet CHARACTER_RADIUS\n	CHARACTER_RADIUS, ${1:float radius}, $0\nsnippet CHARACTER_STAY_WITHIN_PARCEL\n	CHARACTER_STAY_WITHIN_PARCEL, ${1:boolean stay}, $0\nsnippet CHARACTER_TYPE\n	CHARACTER_TYPE, ${1:integer type}, $0\nsnippet HTTP_BODY_MAXLENGTH\n	HTTP_BODY_MAXLENGTH, ${1:integer length}, $0\nsnippet HTTP_CUSTOM_HEADER\n	HTTP_CUSTOM_HEADER, ${1:string name}, ${2:string value}, $0\nsnippet HTTP_METHOD\n	HTTP_METHOD, ${1:string method}, $0\nsnippet HTTP_MIMETYPE\n	HTTP_MIMETYPE, ${1:string mimeType}, $0\nsnippet HTTP_PRAGMA_NO_CACHE\n	HTTP_PRAGMA_NO_CACHE, ${1:integer send_header}, $0\nsnippet HTTP_VERBOSE_THROTTLE\n	HTTP_VERBOSE_THROTTLE, ${1:integer noisy}, $0\nsnippet HTTP_VERIFY_CERT\n	HTTP_VERIFY_CERT, ${1:integer verify}, $0\nsnippet RC_DATA_FLAGS\n	RC_DATA_FLAGS, ${1:integer flags}, $0\nsnippet RC_DETECT_PHANTOM\n	RC_DETECT_PHANTOM, ${1:integer dectedPhantom}, $0\nsnippet RC_MAX_HITS\n	RC_MAX_HITS, ${1:integer maxHits}, $0\nsnippet RC_REJECT_TYPES\n	RC_REJECT_TYPES, ${1:integer filterMask}, $0\nsnippet at_rot_target\n	at_rot_target(${1:integer handle}, ${2:rotation targetrot}, ${3:rotation ourrot})\n	{\n		$0\n	}\nsnippet at_target\n	at_target(${1:integer tnum}, ${2:vector targetpos}, ${3:vector ourpos})\n	{\n		$0\n	}\nsnippet attach\n	attach(${1:key id})\n	{\n		$0\n	}\nsnippet changed\n	changed(${1:integer change})\n	{\n		$0\n	}\nsnippet collision\n	collision(${1:integer index})\n	{\n		$0\n	}\nsnippet collision_end\n	collision_end(${1:integer index})\n	{\n		$0\n	}\nsnippet collision_start\n	collision_start(${1:integer index})\n	{\n		$0\n	}\nsnippet control\n	control(${1:key id}, ${2:integer level}, ${3:integer edge})\n	{\n		$0\n	}\nsnippet dataserver\n	dataserver(${1:key query_id}, ${2:string data})\n	{\n		$0\n	}\nsnippet do\n	do\n	{\n		$0\n	}\n	while (${1:condition});\nsnippet else\n	else\n	{\n		$0\n	}\nsnippet email\n	email(${1:string time}, ${2:string address}, ${3:string subject}, ${4:string message}, ${5:integer num_left})\n	{\n		$0\n	}\nsnippet experience_permissions\n	experience_permissions(${1:key agent_id})\n	{\n		$0\n	}\nsnippet experience_permissions_denied\n	experience_permissions_denied(${1:key agent_id}, ${2:integer reason})\n	{\n		$0\n	}\nsnippet for\n	for (${1:start}; ${3:condition}; ${3:step})\n	{\n		$0\n	}\nsnippet http_request\n	http_request(${1:key request_id}, ${2:string method}, ${3:string body})\n	{\n		$0\n	}\nsnippet http_response\n	http_response(${1:key request_id}, ${2:integer status}, ${3:list metadata}, ${4:string body})\n	{\n		$0\n	}\nsnippet if\n	if (${1:condition})\n	{\n		$0\n	}\nsnippet jump\n	jump ${1:label};\nsnippet land_collision\n	land_collision(${1:vector pos})\n	{\n		$0\n	}\nsnippet land_collision_end\n	land_collision_end(${1:vector pos})\n	{\n		$0\n	}\nsnippet land_collision_start\n	land_collision_start(${1:vector pos})\n	{\n		$0\n	}\nsnippet link_message\n	link_message(${1:integer sender_num}, ${2:integer num}, ${3:string str}, ${4:key id})\n	{\n		$0\n	}\nsnippet listen\n	listen(${1:integer channel}, ${2:string name}, ${3:key id}, ${4:string message})\n	{\n		$0\n	}\nsnippet llAbs\n	llAbs(${1:integer val})\nsnippet llAcos\n	llAcos(${1:float val})\nsnippet llAddToLandBanList\n	llAddToLandBanList(${1:key agent}, ${2:float hours});\n	$0\nsnippet llAddToLandPassList\n	llAddToLandPassList(${1:key agent}, ${2:float hours});\n	$0\nsnippet llAdjustSoundVolume\n	llAdjustSoundVolume(${1:float volume});\n	$0\nsnippet llAgentInExperience\n	llAgentInExperience(${1:key agent})\nsnippet llAllowInventoryDrop\n	llAllowInventoryDrop(${1:integer add});\n	$0\nsnippet llAngleBetween\n	llAngleBetween(${1:rotation a}, ${2:rotation b})\nsnippet llApplyImpulse\n	llApplyImpulse(${1:vector force}, ${2:integer local});\n	$0\nsnippet llApplyRotationalImpulse\n	llApplyRotationalImpulse(${1:vector force}, ${2:integer local});\n	$0\nsnippet llAsin\n	llAsin(${1:float val})\nsnippet llAtan2\n	llAtan2(${1:float y}, ${2:float x})\nsnippet llAttachToAvatar\n	llAttachToAvatar(${1:integer attach_point});\n	$0\nsnippet llAttachToAvatarTemp\n	llAttachToAvatarTemp(${1:integer attach_point});\n	$0\nsnippet llAvatarOnLinkSitTarget\n	llAvatarOnLinkSitTarget(${1:integer link})\nsnippet llAvatarOnSitTarget\n	llAvatarOnSitTarget()\nsnippet llAxes2Rot\n	llAxes2Rot(${1:vector fwd}, ${2:vector left}, ${3:vector up})\nsnippet llAxisAngle2Rot\n	llAxisAngle2Rot(${1:vector axis}, ${2:float angle})\nsnippet llBase64ToInteger\n	llBase64ToInteger(${1:string str})\nsnippet llBase64ToString\n	llBase64ToString(${1:string str})\nsnippet llBreakAllLinks\n	llBreakAllLinks();\n	$0\nsnippet llBreakLink\n	llBreakLink(${1:integer link});\n	$0\nsnippet llCastRay\n	llCastRay(${1:vector start}, ${2:vector end}, ${3:list options});\n	$0\nsnippet llCeil\n	llCeil(${1:float val})\nsnippet llClearCameraParams\n	llClearCameraParams();\n	$0\nsnippet llClearLinkMedia\n	llClearLinkMedia(${1:integer link}, ${2:integer face});\n	$0\nsnippet llClearPrimMedia\n	llClearPrimMedia(${1:integer face});\n	$0\nsnippet llCloseRemoteDataChannel\n	llCloseRemoteDataChannel(${1:key channel});\n	$0\nsnippet llCollisionFilter\n	llCollisionFilter(${1:string name}, ${2:key id}, ${3:integer accept});\n	$0\nsnippet llCollisionSound\n	llCollisionSound(${1:string impact_sound}, ${2:float impact_volume});\n	$0\nsnippet llCos\n	llCos(${1:float theta})\nsnippet llCreateCharacter\n	llCreateCharacter(${1:list options});\n	$0\nsnippet llCreateKeyValue\n	llCreateKeyValue(${1:string k})\nsnippet llCreateLink\n	llCreateLink(${1:key target}, ${2:integer parent});\n	$0\nsnippet llCSV2List\n	llCSV2List(${1:string src})\nsnippet llDataSizeKeyValue\n	llDataSizeKeyValue()\nsnippet llDeleteCharacter\n	llDeleteCharacter();\n	$0\nsnippet llDeleteKeyValue\n	llDeleteKeyValue(${1:string k})\nsnippet llDeleteSubList\n	llDeleteSubList(${1:list src}, ${2:integer start}, ${3:integer end})\nsnippet llDeleteSubString\n	llDeleteSubString(${1:string src}, ${2:integer start}, ${3:integer end})\nsnippet llDetachFromAvatar\n	llDetachFromAvatar();\n	$0\nsnippet llDetectedGrab\n	llDetectedGrab(${1:integer number})\nsnippet llDetectedGroup\n	llDetectedGroup(${1:integer number})\nsnippet llDetectedKey\n	llDetectedKey(${1:integer number})\nsnippet llDetectedLinkNumber\n	llDetectedLinkNumber(${1:integer number})\nsnippet llDetectedName\n	llDetectedName(${1:integer number})\nsnippet llDetectedOwner\n	llDetectedOwner(${1:integer number})\nsnippet llDetectedPos\n	llDetectedPosl(${1:integer number})\nsnippet llDetectedRot\n	llDetectedRot(${1:integer number})\nsnippet llDetectedTouchBinormal\n	llDetectedTouchBinormal(${1:integer number})\nsnippet llDetectedTouchFace\n	llDetectedTouchFace(${1:integer number})\nsnippet llDetectedTouchNormal\n	llDetectedTouchNormal(${1:integer number})\nsnippet llDetectedTouchPos\n	llDetectedTouchPos(${1:integer number})\nsnippet llDetectedTouchST\n	llDetectedTouchST(${1:integer number})\nsnippet llDetectedTouchUV\n	llDetectedTouchUV(${1:integer number})\nsnippet llDetectedType\n	llDetectedType(${1:integer number})\nsnippet llDetectedVel\n	llDetectedVel(${1:integer number})\nsnippet llDialog\n	llDialog(${1:key agent}, ${2:string message}, ${3:list buttons}, ${4:integer channel});\n	$0\nsnippet llDie\n	llDie();\n	$0\nsnippet llDumpList2String\n	llDumpList2String(${1:list src}, ${2:string separator})\nsnippet llEdgeOfWorld\n	llEdgeOfWorld(${1:vector pos}, ${2:vector dir})\nsnippet llEjectFromLand\n	llEjectFromLand(${1:key agent});\n	$0\nsnippet llEmail\n	llEmail(${1:string address}, ${2:string subject}, ${3:string message});\n	$0\nsnippet llEscapeURL\n	llEscapeURL(${1:string url})\nsnippet llEuler2Rot\n	llEuler2Rot(${1:vector v})\nsnippet llExecCharacterCmd\n	llExecCharacterCmd(${1:integer command}, ${2:list options});\n	$0\nsnippet llEvade\n	llEvade(${1:key target}, ${2:list options});\n	$0\nsnippet llFabs\n	llFabs(${1:float val})\nsnippet llFleeFrom\n	llFleeFrom(${1:vector position}, ${2:float distance}, ${3:list options});\n	$0\nsnippet llFloor\n	llFloor(${1:float val})\nsnippet llForceMouselook\n	llForceMouselook(${1:integer mouselook});\n	$0\nsnippet llFrand\n	llFrand(${1:float mag})\nsnippet llGenerateKey\n	llGenerateKey()\nsnippet llGetAccel\n	llGetAccel()\nsnippet llGetAgentInfo\n	llGetAgentInfo(${1:key id})\nsnippet llGetAgentLanguage\n	llGetAgentLanguage(${1:key agent})\nsnippet llGetAgentList\n	llGetAgentList(${1:integer scope}, ${2:list options})\nsnippet llGetAgentSize\n	llGetAgentSize(${1:key agent})\nsnippet llGetAlpha\n	llGetAlpha(${1:integer face})\nsnippet llGetAndResetTime\n	llGetAndResetTime()\nsnippet llGetAnimation\n	llGetAnimation(${1:key id})\nsnippet llGetAnimationList\n	llGetAnimationList(${1:key agent})\nsnippet llGetAnimationOverride\n	llGetAnimationOverride(${1:string anim_state})\nsnippet llGetAttached\n	llGetAttached()\nsnippet llGetAttachedList\n	llGetAttachedList(${1:key id})\nsnippet llGetBoundingBox\n	llGetBoundingBox(${1:key object})\nsnippet llGetCameraPos\n	llGetCameraPos()\nsnippet llGetCameraRot\n	llGetCameraRot()\nsnippet llGetCenterOfMass\n	llGetCenterOfMass()\nsnippet llGetClosestNavPoint\n	llGetClosestNavPoint(${1:vector point}, ${2:list options})\nsnippet llGetColor\n	llGetColor(${1:integer face})\nsnippet llGetCreator\n	llGetCreator()\nsnippet llGetDate\n	llGetDate()\nsnippet llGetDisplayName\n	llGetDisplayName(${1:key id})\nsnippet llGetEnergy\n	llGetEnergy()\nsnippet llGetEnv\n	llGetEnv(${1:string name})\nsnippet llGetExperienceDetails\n	llGetExperienceDetails(${1:key experience_id})\nsnippet llGetExperienceErrorMessage\n	llGetExperienceErrorMessage(${1:integer error})\nsnippet llGetForce\n	llGetForce()\nsnippet llGetFreeMemory\n	llGetFreeMemory()\nsnippet llGetFreeURLs\n	llGetFreeURLs()\nsnippet llGetGeometricCenter\n	llGetGeometricCenter()\nsnippet llGetGMTclock\n	llGetGMTclock()\nsnippet llGetHTTPHeader\n	llGetHTTPHeader(${1:key request_id}, ${2:string header})\nsnippet llGetInventoryCreator\n	llGetInventoryCreator(${1:string item})\nsnippet llGetInventoryKey\n	llGetInventoryKey(${1:string name})\nsnippet llGetInventoryName\n	llGetInventoryName(${1:integer type}, ${2:integer number})\nsnippet llGetInventoryNumber\n	llGetInventoryNumber(${1:integer type})\nsnippet llGetInventoryPermMask\n	llGetInventoryPermMask(${1:string item}, ${2:integer mask})\nsnippet llGetInventoryType\n	llGetInventoryType(${1:string name})\nsnippet llGetKey\n	llGetKey()\nsnippet llGetLandOwnerAt\n	llGetLandOwnerAt(${1:vector pos})\nsnippet llGetLinkKey\n	llGetLinkKey(${1:integer link})\nsnippet llGetLinkMedia\n	llGetLinkMedia(${1:integer link}, ${2:integer face}, ${3:list params})\nsnippet llGetLinkName\n	llGetLinkName(${1:integer link})\nsnippet llGetLinkNumber\n	llGetLinkNumber()\nsnippet llGetLinkNumberOfSides\n	llGetLinkNumberOfSides(${1:integer link})\nsnippet llGetLinkPrimitiveParams\n	llGetLinkPrimitiveParams(${1:integer link}, ${2:list params})\nsnippet llGetListEntryType\n	llGetListEntryType(${1:list src}, ${2:integer index})\nsnippet llGetListLength\n	llGetListLength(${1:list src})\nsnippet llGetLocalPos\n	llGetLocalPos()\nsnippet llGetLocalRot\n	llGetLocalRot()\nsnippet llGetMass\n	llGetMass()\nsnippet llGetMassMKS\n	llGetMassMKS()\nsnippet llGetMaxScaleFactor\n	llGetMaxScaleFactor()\nsnippet llGetMemoryLimit\n	llGetMemoryLimit()\nsnippet llGetMinScaleFactor\n	llGetMinScaleFactor()\nsnippet llGetNextEmail\n	llGetNextEmail(${1:string address}, ${2:string subject});\n	$0\nsnippet llGetNotecardLine\n	llGetNotecardLine(${1:string name}, ${2:integer line})\nsnippet llGetNumberOfNotecardLines\n	llGetNumberOfNotecardLines(${1:string name})\nsnippet llGetNumberOfPrims\n	llGetNumberOfPrims()\nsnippet llGetNumberOfSides\n	llGetNumberOfSides()\nsnippet llGetObjectDesc\n	llGetObjectDesc()\nsnippet llGetObjectDetails\n	llGetObjectDetails(${1:key id}, ${2:list params})\nsnippet llGetObjectMass\n	llGetObjectMass(${1:key id})\nsnippet llGetObjectName\n	llGetObjectName()\nsnippet llGetObjectPermMask\n	llGetObjectPermMask(${1:integer mask})\nsnippet llGetObjectPrimCount\n	llGetObjectPrimCount(${1:key prim})\nsnippet llGetOmega\n	llGetOmega()\nsnippet llGetOwner\n	llGetOwner()\nsnippet llGetOwnerKey\n	llGetOwnerKey(${1:key id})\nsnippet llGetParcelDetails\n	llGetParcelDetails(${1:vector pos}, ${2:list params})\nsnippet llGetParcelFlags\n	llGetParcelFlags(${1:vector pos})\nsnippet llGetParcelMaxPrims\n	llGetParcelMaxPrims(${1:vector pos}, ${2:integer sim_wide})\nsnippet llGetParcelMusicURL\n	llGetParcelMusicURL()\nsnippet llGetParcelPrimCount\n	llGetParcelPrimCount(${1:vector pos}, ${2:integer category}, ${3:integer sim_wide})\nsnippet llGetParcelPrimOwners\n	llGetParcelPrimOwners(${1:vector pos})\nsnippet llGetPermissions\n	llGetPermissions()\nsnippet llGetPermissionsKey\n	llGetPermissionsKey()\nsnippet llGetPhysicsMaterial\n	llGetPhysicsMaterial()\nsnippet llGetPos\n	llGetPos()\nsnippet llGetPrimitiveParams\n	llGetPrimitiveParams(${1:list params})\nsnippet llGetPrimMediaParams\n	llGetPrimMediaParams(${1:integer face}, ${2:list params})\nsnippet llGetRegionAgentCount\n	llGetRegionAgentCount()\nsnippet llGetRegionCorner\n	llGetRegionCorner()\nsnippet llGetRegionFlags\n	llGetRegionFlags()\nsnippet llGetRegionFPS\n	llGetRegionFPS()\nsnippet llGetRegionName\n	llGetRegionName()\nsnippet llGetRegionTimeDilation\n	llGetRegionTimeDilation()\nsnippet llGetRootPosition\n	llGetRootPosition()\nsnippet llGetRootRotation\n	llGetRootRotation()\nsnippet llGetRot\n	llGetRot()\nsnippet llGetScale\n	llGetScale()\nsnippet llGetScriptName\n	llGetScriptName()\nsnippet llGetScriptState\n	llGetScriptState(${1:string script})\nsnippet llGetSimStats\n	llGetSimStats(${1:integer stat_type})\nsnippet llGetSimulatorHostname\n	llGetSimulatorHostname()\nsnippet llGetSPMaxMemory\n	llGetSPMaxMemory()\nsnippet llGetStartParameter\n	llGetStartParameter()\nsnippet llGetStaticPath\n	llGetStaticPath(${1:vector start}, ${2:vector end}, ${3:float radius}, ${4:list params})\nsnippet llGetStatus\n	llGetStatus(${1:integer status})\nsnippet llGetSubString\n	llGetSubString(${1:string src}, ${2:integer start}, ${3:integer end})\nsnippet llGetSunDirection\n	llGetSunDirection()\nsnippet llGetTexture\n	llGetTexture(${1:integer face})\nsnippet llGetTextureOffset\n	llGetTextureOffset(${1:integer face})\nsnippet llGetTextureRot\n	llGetTextureRot(${1:integer face})\nsnippet llGetTextureScale\n	llGetTextureScale(${1:integer face})\nsnippet llGetTime\n	llGetTime()\nsnippet llGetTimeOfDay\n	llGetTimeOfDay()\nsnippet llGetTimestamp\n	llGetTimestamp()\nsnippet llGetTorque\n	llGetTorque()\nsnippet llGetUnixTime\n	llGetUnixTime()\nsnippet llGetUsedMemory\n	llGetUsedMemory()\nsnippet llGetUsername\n	llGetUsername(${1:key id})\nsnippet llGetVel\n	llGetVel()\nsnippet llGetWallclock\n	llGetWallclock()\nsnippet llGiveInventory\n	llGiveInventory(${1:key destination}, ${2:string inventory});\n	$0\nsnippet llGiveInventoryList\n	llGiveInventoryList(${1:key target}, ${2:string folder}, ${3:list inventory});\n	$0\nsnippet llGiveMoney\n	llGiveMoney(${1:key destination}, ${2:integer amount})\nsnippet llGround\n	llGround(${1:vector offset})\nsnippet llGroundContour\n	llGroundContour(${1:vector offset})\nsnippet llGroundNormal\n	llGroundNormal(${1:vector offset})\nsnippet llGroundRepel\n	llGroundRepel(${1:float height}, ${2:integer water}, ${3:float tau});\n	$0\nsnippet llGroundSlope\n	llGroundSlope(${1:vector offset})\nsnippet llHTTPRequest\n	llHTTPRequest(${1:string url}, ${2:list parameters}, ${3:string body})\nsnippet llHTTPResponse\n	llHTTPResponse(${1:key request_id}, ${2:integer status}, ${3:string body});\n	$0\nsnippet llInsertString\n	llInsertString(${1:string dst}, ${2:integer pos}, ${3:string src})\nsnippet llInstantMessage\n	llInstantMessage(${1:key user}, ${2:string message});\n	$0\nsnippet llIntegerToBase64\n	llIntegerToBase64(${1:integer number})\nsnippet llJson2List\n	llJson2List(${1:string json})\nsnippet llJsonGetValue\n	llJsonGetValue(${1:string json}, ${2:list specifiers})\nsnippet llJsonSetValue\n	llJsonSetValue(${1:string json}, ${2:list specifiers}, ${3:string newValue})\nsnippet llJsonValueType\n	llJsonValueType(${1:string json}, ${2:list specifiers})\nsnippet llKey2Name\n	llKey2Name(${1:key id})\nsnippet llKeyCountKeyValue\n	llKeyCountKeyValue()\nsnippet llKeysKeyValue\n	llKeysKeyValue(${1:integer first}, ${2:integer count})\nsnippet llLinkParticleSystem\n	llLinkParticleSystem(${1:integer link}, ${2:list rules});\n	$0\nsnippet llLinkSitTarget\n	llLinkSitTarget(${1:integer link}, ${2:vector offset}, ${3:rotation rot});\n	$0\nsnippet llList2CSV\n	llList2CSV(${1:list src})\nsnippet llList2Float\n	llList2Float(${1:list src}, ${2:integer index})\nsnippet llList2Integer\n	llList2Integer(${1:list src}, ${2:integer index})\nsnippet llList2Json\n	llList2Json(${1:string type}, ${2:list values})\nsnippet llList2Key\n	llList2Key(${1:list src}, ${2:integer index})\nsnippet llList2List\n	llList2List(${1:list src}, ${2:integer start}, ${3:integer end})\nsnippet llList2ListStrided\n	llList2ListStrided(${1:list src}, ${2:integer start}, ${3:integer end}, ${4:integer stride})\nsnippet llList2Rot\n	llList2Rot(${1:list src}, ${2:integer index})\nsnippet llList2String\n	llList2String(${1:list src}, ${2:integer index})\nsnippet llList2Vector\n	llList2Vector(${1:list src}, ${2:integer index})\nsnippet llListen\n	llListen(${1:integer channel}, ${2:string name}, ${3:key id}, ${4:string msg})\nsnippet llListenControl\n	llListenControl(${1:integer handle}, ${2:integer active});\n	$0\nsnippet llListenRemove\n	llListenRemove(${1:integer handle});\n	$0\nsnippet llListFindList\n	llListFindList(${1:list src}, ${2:list test})\nsnippet llListInsertList\n	llListInsertList(${1:list dest}, ${2:list src}, ${3:integer start})\nsnippet llListRandomize\n	llListRandomize(${1:list src}, ${2:integer stride})\nsnippet llListReplaceList\n	llListReplaceList(${1:list dest}, ${2:list src}, ${3:integer start}, ${4:integer end})\nsnippet llListSort\n	llListSort(${1:list src}, ${2:integer stride}, ${3:integer ascending})\nsnippet llListStatistics\n	llListStatistics(${1:integer operation}, ${2:list src})\nsnippet llLoadURL\n	llLoadURL(${1:key agent}, ${2:string message}, ${3:string url});\n	$0\nsnippet llLog\n	llLog(${1:float val})\nsnippet llLog10\n	llLog10(${1:float val})\nsnippet llLookAt\n	llLookAt(${1:vector target}, ${2:float strength}, ${3:float damping});\n	$0\nsnippet llLoopSound\n	llLoopSound(${1:string sound}, ${2:float volume});\n	$0\nsnippet llLoopSoundMaster\n	llLoopSoundMaster(${1:string sound}, ${2:float volume});\n	$0\nsnippet llLoopSoundSlave\n	llLoopSoundSlave(${1:string sound}, ${2:float volume});\n	$0\nsnippet llManageEstateAccess\n	llManageEstateAccess(${1:integer action}, ${2:key agent})\nsnippet llMapDestination\n	llMapDestination(${1:string simname}, ${2:vector pos}, ${3:vector look_at});\n	$0\nsnippet llMD5String\n	llMD5String(${1:string src}, ${2:integer nonce})\nsnippet llMessageLinked\n	llMessageLinked(${1:integer link}, ${2:integer num}, ${3:string str}, ${4:key id});\n	$0\nsnippet llMinEventDelay\n	llMinEventDelay(${1:float delay});\n	$0\nsnippet llModifyLand\n	llModifyLand(${1:integer action}, ${2:integer brush});\n	$0\nsnippet llModPow\n	llModPow(${1:integer a}, ${2:integer b}, ${3:integer c})\nsnippet llMoveToTarget\n	llMoveToTarget(${1:vector target}, ${2:float tau});\n	$0\nsnippet llNavigateTo\n	llNavigateTo(${1:vector pos}, ${2:list options});\n	$0\nsnippet llOffsetTexture\n	llOffsetTexture(${1:float u}, ${2:float v}, ${3:integer face});\n	$0\nsnippet llOpenRemoteDataChannel\n	llOpenRemoteDataChannel();\n	$0\nsnippet llOverMyLand\n	llOverMyLand(${1:key id})\nsnippet llOwnerSay\n	llOwnerSay(${1:string msg});\n	$0\nsnippet llParcelMediaCommandList\n	llParcelMediaCommandList(${1:list commandList});\n	$0\nsnippet llParcelMediaQuery\n	llParcelMediaQuery(${1:list query})\nsnippet llParseString2List\n	llParseString2List(${1:string src}, ${2:list separators}, ${3:list spacers})\nsnippet llParseStringKeepNulls\n	llParseStringKeepNulls(${1:string src}, ${2:list separators}, ${3:list spacers})\nsnippet llParticleSystem\n	llParticleSystem(${1:list rules});\n	$0\nsnippet llPassCollisions\n	llPassCollisions(${1:integer pass});\n	$0\nsnippet llPassTouches\n	llPassTouches(${1:integer pass});\n	$0\nsnippet llPatrolPoints\n	llPatrolPoints(${1:list patrolPoints}, ${2:list options});\n	$0\nsnippet llPlaySound\n	llPlaySound(${1:string sound}, ${2:float volume});\n	$0\nsnippet llPlaySoundSlave\n	llPlaySoundSlave(${1:string sound}, ${2:float volume});\n	$0\nsnippet llPow\n	llPow(${1:float base}, ${2:float exponent})\nsnippet llPreloadSound\n	llPreloadSound(${1:string sound});\n	$0\nsnippet llPursue\n	llPursue(${1:key target}, ${2:list options});\n	$0\nsnippet llPushObject\n	llPushObject(${1:key target}, ${2:vector impulse}, ${3:vector ang_impulse}, ${4:integer local});\n	$0\nsnippet llReadKeyValue\n	llReadKeyValue(${1:string k})\nsnippet llRegionSay\n	llRegionSay(${1:integer channel}, ${2:string msg});\n	$0\nsnippet llRegionSayTo\n	llRegionSayTo(${1:key target}, ${2:integer channel}, ${3:string msg});\n	$0\nsnippet llReleaseControls\n	llReleaseControls();\n	$0\nsnippet llReleaseURL\n	llReleaseURL(${1:string url});\n	$0\nsnippet llRemoteDataReply\n	llRemoteDataReply(${1:key channel}, ${2:key message_id}, ${3:string sdata}, ${4:integer idata});\n	$0\nsnippet llRemoteLoadScriptPin\n	llRemoteLoadScriptPin(${1:key target}, ${2:string name}, ${3:integer pin}, ${4:integer running}, ${5:integer start_param});\n	$0\nsnippet llRemoveFromLandBanList\n	llRemoveFromLandBanList(${1:key agent});\n	$0\nsnippet llRemoveFromLandPassList\n	llRemoveFromLandPassList(${1:key agent});\n	$0\nsnippet llRemoveInventory\n	llRemoveInventory(${1:string item});\n	$0\nsnippet llRemoveVehicleFlags\n	llRemoveVehicleFlags(${1:integer flags});\n	$0\nsnippet llRequestAgentData\n	llRequestAgentData(${1:key id}, ${2:integer data})\nsnippet llRequestDisplayName\n	llRequestDisplayName(${1:key id})\nsnippet llRequestExperiencePermissions\n	llRequestExperiencePermissions(${1:key agent}, ${2:string name})\nsnippet llRequestInventoryData\n	llRequestInventoryData(${1:string name})\nsnippet llRequestPermissions\n	llRequestPermissions(${1:key agent}, ${2:integer permissions})\nsnippet llRequestSecureURL\n	llRequestSecureURL()\nsnippet llRequestSimulatorData\n	llRequestSimulatorData(${1:string region}, ${2:integer data})\nsnippet llRequestURL\n	llRequestURL()\nsnippet llRequestUsername\n	llRequestUsername(${1:key id})\nsnippet llResetAnimationOverride\n	llResetAnimationOverride(${1:string anim_state});\n	$0\nsnippet llResetLandBanList\n	llResetLandBanList();\n	$0\nsnippet llResetLandPassList\n	llResetLandPassList();\n	$0\nsnippet llResetOtherScript\n	llResetOtherScript(${1:string name});\n	$0\nsnippet llResetScript\n	llResetScript();\n	$0\nsnippet llResetTime\n	llResetTime();\n	$0\nsnippet llReturnObjectsByID\n	llReturnObjectsByID(${1:list objects})\nsnippet llReturnObjectsByOwner\n	llReturnObjectsByOwner(${1:key owner}, ${2:integer scope})\nsnippet llRezAtRoot\n	llRezAtRoot(${1:string inventory}, ${2:vector position}, ${3:vector velocity}, ${4:rotation rot}, ${5:integer param});\n	$0\nsnippet llRezObject\n	llRezObject(${1:string inventory}, ${2:vector pos}, ${3:vector vel}, ${4:rotation rot}, ${5:integer param});\n	$0\nsnippet llRot2Angle\n	llRot2Angle(${1:rotation rot})\nsnippet llRot2Axis\n	llRot2Axis(${1:rotation rot})\nsnippet llRot2Euler\n	llRot2Euler(${1:rotation quat})\nsnippet llRot2Fwd\n	llRot2Fwd(${1:rotation q})\nsnippet llRot2Left\n	llRot2Left(${1:rotation q})\nsnippet llRot2Up\n	llRot2Up(${1:rotation q})\nsnippet llRotateTexture\n	llRotateTexture(${1:float angle}, ${2:integer face});\n	$0\nsnippet llRotBetween\n	llRotBetween(${1:vector start}, ${2:vector end})\nsnippet llRotLookAt\n	llRotLookAt(${1:rotation target_direction}, ${2:float strength}, ${3:float damping});\n	$0\nsnippet llRotTarget\n	llRotTarget(${1:rotation rot}, ${2:float error})\nsnippet llRotTargetRemove\n	llRotTargetRemove(${1:integer handle});\n	$0\nsnippet llRound\n	llRound(${1:float val})\nsnippet llSameGroup\n	llSameGroup(${1:key group})\nsnippet llSay\n	llSay(${1:integer channel}, ${2:string msg});\n	$0\nsnippet llScaleByFactor\n	llScaleByFactor(${1:float scaling_factor})\nsnippet llScaleTexture\n	llScaleTexture(${1:float u}, ${2:float v}, ${3:integer face});\n	$0\nsnippet llScriptDanger\n	llScriptDanger(${1:vector pos})\nsnippet llScriptProfiler\n	llScriptProfiler(${1:integer flags});\n	$0\nsnippet llSendRemoteData\n	llSendRemoteData(${1:key channel}, ${2:string dest}, ${3:integer idata}, ${4:string sdata})\nsnippet llSensor\n	llSensor(${1:string name}, ${2:key id}, ${3:integer type}, ${4:float range}, ${5:float arc});\n	$0\nsnippet llSensorRepeat\n	llSensorRepeat(${1:string name}, ${2:key id}, ${3:integer type}, ${4:float range}, ${5:float arc}, ${6:float rate});\n	$0\nsnippet llSetAlpha\n	llSetAlpha(${1:float alpha}, ${2:integer face});\n	$0\nsnippet llSetAngularVelocity\n	llSetAngularVelocity(${1:vector force}, ${2:integer local});\n	$0\nsnippet llSetAnimationOverride\n	llSetAnimationOverride(${1:string anim_state}, ${2:string anim})\nsnippet llSetBuoyancy\n	llSetBuoyancy(${1:float buoyancy});\n	$0\nsnippet llSetCameraAtOffset\n	llSetCameraAtOffset(${1:vector offset});\n	$0\nsnippet llSetCameraEyeOffset\n	llSetCameraEyeOffset(${1:vector offset});\n	$0\nsnippet llSetCameraParams\n	llSetCameraParams(${1:list rules});\n	$0\nsnippet llSetClickAction\n	llSetClickAction(${1:integer action});\n	$0\nsnippet llSetColor\n	llSetColor(${1:vector color}, ${2:integer face});\n	$0\nsnippet llSetContentType\n	llSetContentType(${1:key request_id}, ${2:integer content_type});\n	$0\nsnippet llSetDamage\n	llSetDamage(${1:float damage});\n	$0\nsnippet llSetForce\n	llSetForce(${1:vector force}, ${2:integer local});\n	$0\nsnippet llSetForceAndTorque\n	llSetForceAndTorque(${1:vector force}, ${2:vector torque}, ${3:integer local});\n	$0\nsnippet llSetHoverHeight\n	llSetHoverHeight(${1:float height}, ${2:integer water}, ${3:float tau});\n	$0\nsnippet llSetKeyframedMotion\n	llSetKeyframedMotion(${1:list keyframes}, ${2:list options});\n	$0\nsnippet llSetLinkAlpha\n	llSetLinkAlpha(${1:integer link}, ${2:float alpha}, ${3:integer face});\n	$0\nsnippet llSetLinkCamera\n	llSetLinkCamera(${1:integer link}, ${2:vector eye}, ${3:vector at});\n	$0\nsnippet llSetLinkColor\n	llSetLinkColor(${1:integer link}, ${2:vector color}, ${3:integer face});\n	$0\nsnippet llSetLinkMedia\n	llSetLinkMedia(${1:integer link}, ${2:integer face}, ${3:list params});\n	$0\nsnippet llSetLinkPrimitiveParams\n	llSetLinkPrimitiveParams(${1:integer link}, ${2:list rules});\n	$0\nsnippet llSetLinkPrimitiveParamsFast\n	llSetLinkPrimitiveParamsFast(${1:integer link}, ${2:list rules});\n	$0\nsnippet llSetLinkTexture\n	llSetLinkTexture(${1:integer link}, ${2:string texture}, ${3:integer face});\n	$0\nsnippet llSetLinkTextureAnim\n	llSetLinkTextureAnim(${1:integer link}, ${2:integer mode}, ${3:integer face}, ${4:integer sizex}, ${5:integer sizey}, ${6:float start}, ${7:float length}, ${8:float rate});\n	$0\nsnippet llSetLocalRot\n	llSetLocalRot(${1:rotation rot});\n	$0\nsnippet llSetMemoryLimit\n	llSetMemoryLimit(${1:integer limit})\nsnippet llSetObjectDesc\n	llSetObjectDesc(${1:string description});\n	$0\nsnippet llSetObjectName\n	llSetObjectName(${1:string name});\n	$0\nsnippet llSetParcelMusicURL\n	llSetParcelMusicURL(${1:string url});\n	$0\nsnippet llSetPayPrice\n	llSetPayPrice(${1:integer price}, [${2:integer price_button_a}, ${3:integer price_button_b}, ${4:integer price_button_c}, ${5:integer price_button_d}]);\n	$0\nsnippet llSetPhysicsMaterial\n	llSetPhysicsMaterial(${1:integer mask}, ${2:float gravity_multiplier}, ${3:float restitution}, ${4:float friction}, ${5:float density});\n	$0\nsnippet llSetPos\n	llSetPos(${1:vector pos});\n	$0\nsnippet llSetPrimitiveParams\n	llSetPrimitiveParams(${1:list rules});\n	$0\nsnippet llSetPrimMediaParams\n	llSetPrimMediaParams(${1:integer face}, ${2:list params});\n	$0\nsnippet llSetRegionPos\n	llSetRegionPos(${1:vector position})\nsnippet llSetRemoteScriptAccessPin\n	llSetRemoteScriptAccessPin(${1:integer pin});\n	$0\nsnippet llSetRot\n	llSetRot(${1:rotation rot});\n	$0\nsnippet llSetScale\n	llSetScale(${1:vector size});\n	$0\nsnippet llSetScriptState\n	llSetScriptState(${1:string name}, ${2:integer run});\n	$0\nsnippet llSetSitText\n	llSetSitText(${1:string text});\n	$0\nsnippet llSetSoundQueueing\n	llSetSoundQueueing(${1:integer queue});\n	$0\nsnippet llSetSoundRadius\n	llSetSoundRadius(${1:float radius});\n	$0\nsnippet llSetStatus\n	llSetStatus(${1:integer status}, ${2:integer value});\n	$0\nsnippet llSetText\n	llSetText(${1:string text}, ${2:vector color}, ${3:float alpha});\n	$0\nsnippet llSetTexture\n	llSetTexture(${1:string texture}, ${2:integer face});\n	$0\nsnippet llSetTextureAnim\n	llSetTextureAnim(${1:integer mode}, ${2:integer face}, ${3:integer sizex}, ${4:integer sizey}, ${5:float start}, ${6:float length}, ${7:float rate});\n	$0\nsnippet llSetTimerEvent\n	llSetTimerEvent(${1:float sec});\n	$0\nsnippet llSetTorque\n	llSetTorque(${1:vector torque}, ${2:integer local});\n	$0\nsnippet llSetTouchText\n	llSetTouchText(${1:string text});\n	$0\nsnippet llSetVehicleFlags\n	llSetVehicleFlags(${1:integer flags});\n	$0\nsnippet llSetVehicleFloatParam\n	llSetVehicleFloatParam(${1:integer param}, ${2:float value});\n	$0\nsnippet llSetVehicleRotationParam\n	llSetVehicleRotationParam(${1:integer param}, ${2:rotation rot});\n	$0\nsnippet llSetVehicleType\n	llSetVehicleType(${1:integer type});\n	$0\nsnippet llSetVehicleVectorParam\n	llSetVehicleVectorParam(${1:integer param}, ${2:vector vec});\n	$0\nsnippet llSetVelocity\n	llSetVelocity(${1:vector force}, ${2:integer local});\n	$0\nsnippet llSHA1String\n	llSHA1String(${1:string src})\nsnippet llShout\n	llShout(${1:integer channel}, ${2:string msg});\n	$0\nsnippet llSin\n	llSin(${1:float theta})\nsnippet llSitTarget\n	llSitTarget(${1:vector offset}, ${2:rotation rot});\n	$0\nsnippet llSleep\n	llSleep(${1:float sec});\n	$0\nsnippet llSqrt\n	llSqrt(${1:float val})\nsnippet llStartAnimation\n	llStartAnimation(${1:string anim});\n	$0\nsnippet llStopAnimation\n	llStopAnimation(${1:string anim});\n	$0\nsnippet llStopHover\n	llStopHover();\n	$0\nsnippet llStopLookAt\n	llStopLookAt();\n	$0\nsnippet llStopMoveToTarget\n	llStopMoveToTarget();\n	$0\nsnippet llStopSound\n	llStopSound();\n	$0\nsnippet llStringLength\n	llStringLength(${1:string str})\nsnippet llStringToBase64\n	llStringToBase64(${1:string str})\nsnippet llStringTrim\n	llStringTrim(${1:string src}, ${2:integer type})\nsnippet llSubStringIndex\n	llSubStringIndex(${1:string source}, ${2:string pattern})\nsnippet llTakeControls\n	llTakeControls(${1:integer controls}, ${2:integer accept}, ${3:integer pass_on});\n	$0\nsnippet llTan\n	llTan(${1:float theta})\nsnippet llTarget\n	llTarget(${1:vector position}, ${2:float range})\nsnippet llTargetOmega\n	llTargetOmega(${1:vector axis}, ${2:float spinrate}, ${3:float gain});\n	$0\nsnippet llTargetRemove\n	llTargetRemove(${1:integer handle});\n	$0\nsnippet llTeleportAgent\n	llTeleportAgent(${1:key agent}, ${2:string landmark}, ${3:vector position}, ${4:vector look_at});\n	$0\nsnippet llTeleportAgentGlobalCoords\n	llTeleportAgentGlobalCoords(${1:key agent}, ${2:vector global_coordinates}, ${3:vector region_coordinates}, ${4:vector look_at});\n	$0\nsnippet llTeleportAgentHome\n	llTeleportAgentHome(${1:key agent});\n	$0\nsnippet llTextBox\n	llTextBox(${1:key agent}, ${2:string message}, ${3:integer channel});\n	$0\nsnippet llToLower\n	llToLower(${1:string src})\nsnippet llToUpper\n	llToUpper(${1:string src})\nsnippet llTransferLindenDollars\n	llTransferLindenDollars(${1:key destination}, ${2:integer amount})\nsnippet llTriggerSound\n	llTriggerSound(${1:string sound}, ${2:float volume});\n	$0\nsnippet llTriggerSoundLimited\n	llTriggerSoundLimited(${1:string sound}, ${2:float volume}, ${3:vector top_north_east}, ${4:vector bottom_south_west});\n	$0\nsnippet llUnescapeURL\n	llUnescapeURL(${1:string url})\nsnippet llUnSit\n	llUnSit(${1:key id});\n	$0\nsnippet llUpdateCharacter\n	llUpdateCharacter(${1:list options})\nsnippet llUpdateKeyValue\n	llUpdateKeyValue(${1:string k}, ${2:string v}, ${3:integer checked}, ${4:string ov})\nsnippet llVecDist\n	llVecDist(${1:vector vec_a}, ${2:vector vec_b})\nsnippet llVecMag\n	llVecMag(${1:vector vec})\nsnippet llVecNorm\n	llVecNorm(${1:vector vec})\nsnippet llVolumeDetect\n	llVolumeDetect(${1:integer detect});\n	$0\nsnippet llWanderWithin\n	llWanderWithin(${1:vector origin}, ${2:vector dist}, ${3:list options});\n	$0\nsnippet llWater\n	llWater(${1:vector offset});\n	$0\nsnippet llWhisper\n	llWhisper(${1:integer channel}, ${2:string msg});\n	$0\nsnippet llWind\n	llWind(${1:vector offset});\n	$0\nsnippet llXorBase64\n	llXorBase64(${1:string str1}, ${2:string str2})\nsnippet money\n	money(${1:key id}, ${2:integer amount})\n	{\n		$0\n	}\nsnippet object_rez\n	object_rez(${1:key id})\n	{\n		$0\n	}\nsnippet on_rez\n	on_rez(${1:integer start_param})\n	{\n		$0\n	}\nsnippet path_update\n	path_update(${1:integer type}, ${2:list reserved})\n	{\n		$0\n	}\nsnippet remote_data\n	remote_data(${1:integer event_type}, ${2:key channel}, ${3:key message_id}, ${4:string sender}, ${5:integer idata}, ${6:string sdata})\n	{\n		$0\n	}\nsnippet run_time_permissions\n	run_time_permissions(${1:integer perm})\n	{\n		$0\n	}\nsnippet sensor\n	sensor(${1:integer index})\n	{\n		$0\n	}\nsnippet state\n	state ${1:name}\nsnippet touch\n	touch(${1:integer index})\n	{\n		$0\n	}\nsnippet touch_end\n	touch_end(${1:integer index})\n	{\n		$0\n	}\nsnippet touch_start\n	touch_start(${1:integer index})\n	{\n		$0\n	}\nsnippet transaction_result\n	transaction_result(${1:key id}, ${2:integer success}, ${3:string data})\n	{\n		$0\n	}\nsnippet while\n	while (${1:condition})\n	{\n		$0\n	}\n",t.scope="lsl"});
                (function() {
                    window.require(["ace/snippets/lsl"], function(m) {
                        if (typeof module == "object" && typeof exports == "object" && module) {
                            module.exports = m;
                        }
                    });
                })();

