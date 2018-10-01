-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

require "string"
local test = require "test_verify_message"

local messages = {
    {Logger = "telemetry", Type = "telemetry", Hostname = "example.com", Fields = {
            ["payload.childPayloads"] = {value = '[{"chromeHangs":{"annotations":[],"durations":[],"firefoxUptime":[],"memoryMap":[],"stacks":[],"systemUptime":[]},"log":[],"simpleMeasurements":{"firstLoadURI":2028,"js":{"customIter":0,"setProto":19},"main":0,"maximalNumberOfConcurrentThreads":36,"startupInterrupted":0,"totalTime":44178,"uptime":736},"threadHangStats":[{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{}},"hangs":[],"name":""},{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":15,"3":0}},"hangs":[],"name":"ImageBridgeChild"},{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":13,"3":0}},"hangs":[],"name":"ProcessHangMonitor"}],"ver":4,"webrtc":{"IceCandidatesStats":{"loop":{},"webrtc":{}}}}]', value_type = 1, representation = "json"},
            ["appUpdateChannel"] = "beta",
            ["sourceVersion"] = 4,
            ["telemetryEnabled"] = true,
            ["os"] = "Darwin",
            ["normalizedOSVersion"] = "14.5.0",
            ["environment.partner"] = {value = '{"distributionId":null,"distributionVersion":null,"distributor":null,"distributorChannel":null,"partnerId":null,"partnerNames":[]}', value_type = 1, representation = "json"},
            ["appVendor"] = "Mozilla",
            ["submissionDate"] = "19700101",
            ["appVersion"] = "45.0",
            ["DNT"] = "1",
            ["payload.chromeHangs"] = {value = '{"annotations":[],"durations":[],"firefoxUptime":[],"memoryMap":[],"stacks":[],"systemUptime":[]}', value_type = 1, representation = "json"},
            ["creationTimestamp"] = 1.446686743312e+18,
            ["appBuildId"] = "20151103030248",
            ["environment.system"] = {value = '{"cpu":{"cores":4,"count":8,"extensions":["hasMMX","hasSSE","hasSSE2","hasSSE3","hasSSSE3","hasSSE4_1","hasSSE4_2"],"family":6,"l2cacheKB":256,"l3cacheKB":6144,"model":70,"speedMHz":2800,"stepping":1,"vendor":"GenuineIntel"},"gfx":{"D2DEnabled":null,"DWriteEnabled":null,"adapters":[{"GPUActive":true,"RAM":null,"description":null,"deviceID":"0x6821","driver":null,"driverDate":null,"driverVersion":null,"subsysID":null,"vendorID":"0x1002"}],"features":{"compositor":"none"},"monitors":[{"scale":2,"screenHeight":900,"screenWidth":1440}]},"hdd":{"binary":{"model":null,"revision":null},"profile":{"model":null,"revision":null},"system":{"model":null,"revision":null}},"memoryMB":16384,"os":{"locale":"en-US","name":"Darwin","version":"14.5.0"},"virtualMaxMB":null}', value_type = 1, representation = "json"},
            ["environment.experiments"] = {value = '{"test_id123":{"branch":"brunch"}}', value_type = 1, representation = "json"},
            ["payload.info"] = {value = '{"addons":"masspasswordreset%40johnathan.nightingale:1.05.1-signed,foxyproxy%40eric.h.jung:4.5.5,eliteproxyswitcher%40my-proxy.com:1.2.0.2.1-signed,%7B972ce4c6-7e08-4474-a285-3208198ce6fd%7D:45.0,fxos_2_1_simulator%40mozilla.org:2.1.20141223.1-signed,fxos_1_4_simulator%40mozilla.org:1.4.20140506.1-signed,adbhelper%40mozilla.org:0.8.5,fxdevtools-adapters%40mozilla.org:0.3.3","asyncPluginInit":false,"flashVersion":"19.0.0.226","previousBuildId":"20151102030241","previousSessionId":"3f4b8574-44f5-4173-a2fe-fbf1939ec516","previousSubsessionId":"f2af8461-80c2-4560-8131-bfc313f3d0fa","profileSubsessionCounter":197,"reason":"shutdown","revision":"https://hg.mozilla.org/mozilla-central/rev/bb4d614a0b09","sessionId":"a472b0c5-1498-4cd0-a953-954bbd474317","sessionLength":44180,"sessionStartDate":"2015-11-03T00:00:00.0-08:00","subsessionCounter":2,"subsessionId":"6e52dd1f-408a-483a-9406-d43d8c39e3a4","subsessionLength":38376,"subsessionStartDate":"2015-11-04T00:00:00.0-08:00","timezoneOffset":-480}', value_type = 1, representation = "json"},
            ["appName"] = "Firefox",
            ["submission"] = {value = '{"application":{"architecture":"x86-64","buildId":"20151103030248","channel":"beta","name":"Firefox","platformVersion":"45.0","vendor":"Mozilla","version":"45.0","displayVersion":"45.0b6","xpcomAbi":"x86_64-gcc3"},"clientId":"6fd3eb50-8bec-4b9c-8778-59406171312a","creationDate":"2015-11-05T01:25:43.312Z","environment":{},"id":"0055FAC4-8A1A-4FCA-B380-EBFDC8571A01","payload":{"processes":{"parent":{"scalars":{"telemetry.test.unsigned_int_kind":2,"telemetry.test.string_kind":"I\'m a cool test string.","telemetry.test.boolean_kind":true},"keyedScalars":{"telemetry.test.keyed_unsigned_int":{"search_enter":1,"some_key":37},"telemetry.test.keyed_boolean_kind":{"key1":false,"key2":true}},"events":[[12141232,"navigation","search","searchbar","enter",{"engine":"google"}],[12144813,"navigation","search","searchbar","oneoff",{"engine":"amazondotcom"}],[12152377,"navigation","search","urlbar","enter",{"engine":"google"}]]},"content":{"histograms":{"YOUTUBE_EMBED_SEEN":{"bucket_count":3,"histogram_type":3,"range":[1,2],"sum":0,"sum_squares_hi":0,"sum_squares_lo":0,"values":{"0":1,"1":0}}},"keyedHistograms":{"WEAVE_STORAGE_AUTH_ERRORS":{}}},"gpu":{"histograms":{"A11Y_INSTANTIATED_FLAG":{"bucket_count":3,"histogram_type":3,"range":[1,2],"sum":0,"sum_squares_hi":0,"sum_squares_lo":0,"values":{"0":1,"1":0}}},"keyedHistograms":{"ADDON_SHIM_USAGE":{}}}},"webrtc":{"IceCandidatesStats":{"loop":{},"webrtc":{}}},"ver":4},"type":"saved-session","version":4}', value_type = 1, representation = "json"},
            ["payload.log"] = {value = '[["EXPERIMENT_ACTIVATION",1430,"REJECTED","e10s-enabled-aurora-20151020@experiments.mozilla.org","endTime"],["EXPERIMENT_ACTIVATION",16393806,"REJECTED","e10s-enabled-aurora-20151020@experiments.mozilla.org","endTime"]]', value_type = 1, representation = "json"},
            ["Date"] = "Wed, 30 Aug 2017 20:43:39 GMT",
            ["sampleId"] = 50,
            ["reason"] = "shutdown",
            ["normalizedChannel"] = "beta",
            ["payload.lateWrites"] = {value = '{"memoryMap":[],"stacks":[]}', value_type = 1, representation = "json"},
            ["environment.addons"] = {value = '{"activeAddons":{"adbhelper@mozilla.org":{"appDisabled":false,"blocklisted":false,"description":"An addon to ease connecting to Firefox OS devices.","foreignInstall":false,"hasBinaryComponents":false,"installDay":16232,"name":"ADB Helper","scope":1,"signedState":1,"type":"extension","updateDay":16729,"userDisabled":false,"version":"0.8.5"}},"activeExperiment":{},"activeGMPlugins":{"gmp-gmpopenh264":{"applyBackgroundUpdates":1,"userDisabled":false,"version":"1.4"}},"activePlugins":[{"blocklisted":false,"clicktoplay":true,"description":"Version 5.41.0.0","disabled":false,"mimeTypes":["application/googletalk"],"name":"Google Talk Plugin","updateDay":16520,"version":"5.41.0.0"}],"persona":null,"theme":{"appDisabled":false,"blocklisted":false,"description":"The default theme.","foreignInstall":false,"hasBinaryComponents":false,"id":"{972ce4c6-7e08-4474-a285-3208198ce6fd}","installDay":15937,"name":"Default","scope":4,"updateDay":16742,"userDisabled":false,"version":"45.0"}}', value_type = 1, representation = "json"},
            ["payload.threadHangStats"] = {value = '[{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":2285595,"1023":1,"127":334,"15":82830,"2047":0,"255":200,"3":68207,"31":19816,"511":19,"63":4295,"7":74255}},"hangs":[{"histogram":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"127":0,"255":1,"511":0}},"stack":["Startup::XRE_Main","EventDispatcher::Dispatch","browser/content/hiddenWindow.xul:1","nsBrowserGlue.js:282","gre/modules/XPCOMUtils.jsm:197","gre/modules/XPCOMUtils.jsm:271","/modules/CustomizationTabPreloader.jsm:9"]}],"name":"Gecko"},{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":5058912,"127":37,"15":33710,"2047":2,"255":6,"3":42286,"31":17226,"4095":0,"63":1035,"7":38624}},"hangs":[{"histogram":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"127":0,"255":1,"511":0}},"stack":["IPDL::PCompositor::RecvFlushRendering","CompositorParent::ForceComposeToTarget","CompositorParent::Composite","LayerManagerComposite::Render","LayerManagerComposite::EndFrame","CompositorOGL::EndFrame","GLContextCGL::SwapBuffers"]}],"name":"Compositor"},{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":13,"3":0}},"hangs":[],"name":"ImageBridgeChild"},{"activity":{"bucket_count":33,"histogram_type":0,"log_sum":0,"log_sum_squares":0,"range":[1,0],"sum":0,"values":{"0":0,"1":20,"15":1,"3":1,"31":0}},"hangs":[],"name":"ProcessHangMonitor"}]', value_type = 1, representation = "json"},
            ["payload.slowSQL"] = {value = '{"mainThread":{},"otherThreads":{"COMMIT TRANSACTION /* cookies.sqlite */":[1,1137],"SELECT :query_type, h.url, h.title, f.url, EXISTS(SELECT 1 FROM moz_bookmarks WHERE fk = h.id) AS bookmarked,\\n   ( SELECT title FROM moz_bookmarks WHERE fk = h.id AND title NOTNULL\\n     ORDER BY lastModified DESC LIMIT 1\\n   ) AS btitle,\\n   ( SELECT GROUP_CONCAT(t.title, :private)\\n     FROM moz_bookmarks b\\n     JOIN moz_bookmarks t ON t.id = +b.parent AND t.parent = :parent\\n     WHERE b.fk = h.id\\n   ) AS tags,\\n            h.visit_count, h.typed, h.id, t.open_count, h.frecency\\n     FROM moz_places h\\n     LEFT JOIN moz_favicons f ON f.id = h.favicon_id\\n     LEFT JOIN moz_openpages_temp t ON t.url = h.url\\n     WHERE h.frecency <> 0\\n       AND AUTOCOMPLETE_MATCH(:searchString, h.url,\\n                              IFNULL(btitle, h.title), tags,\\n                              h.visit_count, h.typed,\\n                              bookmarked, t.open_count,\\n                              :matchBehavior, :searchBehavior)\\n       \\n     ORDER BY h.frecency DESC, h.id DESC\\n     LIMIT :maxResults /* places.sqlite */":[80,9995],"UPDATE moz_cookies SET lastAccessed = :lastAccessed WHERE name = :name AND host = :host AND path = :path /* cookies.sqlite */":[3,1551],"UPDATE moz_places SET frecency = CALCULATE_FRECENCY(id) WHERE frecency < 0 /* places.sqlite */":[1,102]}}', value_type = 1, representation = "json"},
            ["payload.simpleMeasurements"] = {value = '{"AMI_startup_begin":544,"AMI_startup_end":895,"UITelemetry":{"UITour":{"seenPageIDs":["australis-29-release-no-tour"]},"contextmenu":{},"toolbars":{"addonToolbars":1,"bookmarksBarEnabled":true,"countableEvents":{"__DEFAULT__":{"click-bookmarks-bar":{"chevron":{"left":1}},"click-builtin-item":{"alltabs-button":{"left":2},"new-tab-button":{"left":1},"tabbrowser-tabs":{"left":25}},"search":{"urlbar":6}}},"currentSearchEngine":"Google","defaultKept":["edit-controls","zoom-controls","new-window-button","privatebrowsing-button","save-page-button","print-button","history-panelmenu","fullscreen-button","find-button","preferences-button","add-ons-button","developer-button","urlbar-container","search-container","bookmarks-menu-button","pocket-button","downloads-button","home-button","social-share-button","tabbrowser-tabs","new-tab-button","alltabs-button","personal-bookmarks"],"defaultMoved":[],"defaultRemoved":[],"durations":{"customization":[]},"hiddenTabs":[0,0],"menuBarEnabled":false,"nondefaultAdded":["tabview-button"],"sizemode":"normal","titleBarEnabled":false,"visibleTabs":[46,21]}},"XPI_bootstrap_addons_begin":749,"XPI_bootstrap_addons_end":889,"XPI_finalUIStartup":1156,"XPI_startup_begin":557,"XPI_startup_end":889,"activeTicks":1034,"addonManager":{"XPIDB_parseDB_MS":2,"XPIDB_saves_late":0,"XPIDB_saves_overlapped":0,"XPIDB_saves_total":2,"XPIDB_startup_load_reasons":["directoryState"],"XPIDB_syncRead_MS":1,"default_providers":true},"createTopLevelWindow":1244,"debuggerAttached":0,"delayedStartupFinished":1959,"delayedStartupStarted":1927,"firstLoadURI":2223,"firstPaint":1881,"js":{"customIter":23,"setProto":0},"main":133,"maximalNumberOfConcurrentThreads":45,"pingsOverdue":0,"profileBeforeChange":44180512,"quitApplication":44179631,"savedPings":0,"selectProfile":447,"sessionRestoreInit":1157,"sessionRestoreInitialized":1197,"sessionRestoreRestoring":1966,"sessionRestored":2481,"shutdownDuration":1476,"start":0,"startupCrashDetectionBegin":540,"startupCrashDetectionEnd":31951,"startupInterrupted":0,"totalTime":79083,"uptime":1318}', value_type = 1, representation = "json"},
            ["environment.profile"] = {value = '{"creationDate":15987}', value_type = 1, representation = "json"},
            ["sourceName"] = "telemetry",
            ["payload.UIMeasurements"] = {value = '[]', value_type = 1, representation = "json"},
            ["clientId"]= "6fd3eb50-8bec-4b9c-8778-59406171312a",
            ["payload.keyedHistograms"] = {value = '{"WEAVE_STORAGE_AUTH_ERRORS":{}}', value_type = 1, representation = "json"},
            ["payload.histograms"] = {value = '{"YOUTUBE_EMBED_SEEN":{"bucket_count":3,"histogram_type":3,"range":[1,2],"sum":0,"sum_squares_hi":0,"sum_squares_lo":0,"values":{"0":1,"1":0}}}', value_type = 1, representation = "json"},
            ["payload.fileIOReports"] = {value = '{}', value_type = 1, representation = "json"},
            ["payload.addonDetails"] = {value = '{"GMP":{"gmp-eme-adobe":{"applyBackgroundUpdates":1,"userDisabled":false,"version":null},"gmp-gmpopenh264":{"applyBackgroundUpdates":1,"userDisabled":false,"version":"1.4"}},"XPI":{"adbhelper@mozilla.org":{"creator":"Mozilla & Android Open Source Project","location":"app-profile","name":"ADB Helper","scan_MS":3,"scan_items":23,"shutdown_MS":6,"startup_MS":44}}}', value_type = 1, representation = "json"},
            ["environment.settings"] = {value = '{"addonCompatibilityCheckEnabled":true,"attribution":{"source":"google.com","medium":"organic","campaign":"(not set)","content":"(not set)"},"blocklistEnabled":true,"defaultSearchEngine":"google","defaultSearchEngineData":{"loadPath":"jar:[app]/omni.ja!browser/google.xml","name":"Google","submissionURL":"https://www.google.com/search?q=&ie=utf-8&oe=utf-8","origin":"default"},"e10sEnabled":true,"e10sCohort":"unknown","isDefaultBrowser":true,"isInOptoutSample":false,"locale":"en-US","telemetryEnabled":true,"update":{"autoDownload":true,"channel":"beta","enabled":true},"userPrefs":{"browser.cache.disk.capacity":358400,"browser.newtabpage.enhanced":true,"browser.startup.page":3,"browser.urlbar.suggest.searches":true,"browser.urlbar.userMadeSearchSuggestionsChoice":true,"devtools.chrome.enabled":true}}', value_type = 1, representation = "json"},
            ["documentId"] = "0055FAC4-8A1A-4FCA-B380-EBFDC8571A01",
            ["docType"] = "saved-session",
            ["geoCountry"] = "US",
            ["Host"] = "incoming.telemetry.mozilla.org",
            ["environment.build"] = {value = '{"applicationId":"{ec8030f7-c20a-464f-9b0e-13a3a9e97384}","applicationName":"Firefox","architecture":"x86-64","architecturesInBinary":"i386-x86_64","buildId":"20151103030248","hotfixVersion":"20150225.01","platformVersion":"45.0","vendor":"Mozilla","version":"45.0","xpcomAbi":"x86_64-gcc3"}', value_type = 1, representation = "json"},
            ["X-PingSender-Version"] = "1.0",
            ["geoCity"] = "Milton",
            ["geoSubdivision1"] = "WA"
        }
    },
    {Logger = "telemetry", Type = "telemetry.duplicate", Hostname = "integration_test", Fields = {
        documentId = "0055FAC4-8A1A-4FCA-B380-EBFDC8571A01",
        docType = "saved-session",
        geoCity = "Milton",
        geoSubdivision1 = "WA",
        geoCountry = "US",
        duplicateDelta = {value = 0, value_type = 2, representation = "1m"},
        appUpdateChannel = "beta",
        appBuildId = "20151103030248",
        appVersion = "45.0",
        appName = "Firefox"
        }
    },
    {Logger = "telemetry", Type = "telemetry.error", Hostname = "example.com", Fields = {
        Host = "incoming.telemetry.mozilla.org",
        content = "",
        DNT = "1",
        Date = "Wed, 30 Aug 2017 20:43:39 GMT",
        ["X-PingSender-Version"] = "1.0",
        uri = "/submit/telemetry/0055FAC4-8A1A-4FCA-B380-EBFDC8571A02/saved-session/Firefox/45.0/beta/20151103030248",
        DecodeErrorType = "json",
        DecodeError = "invalid submission: failed to parse offset:0 Invalid value.",
        submissionDate = "19700101",
        sourceName = "telemetry",
        appUpdateChannel = "beta",
        documentId = "0055FAC4-8A1A-4FCA-B380-EBFDC8571A02",
        docType = "saved-session",
        geoCity = "Milton",
        geoSubdivision1 = "WA",
        geoCountry = "US",
        normalizedChannel = "beta",
        appBuildId = "20151103030248",
        appVersion = "45.0",
        appName = "Firefox",
    }
    },
    {Logger = "telemetry", Type = "telemetry", Hostname = "example.com", Fields = {
        ["appUpdateChannel"] = "release",
        ["sourceVersion"] = "9",
        ["normalizedOs"] = "Android",
        ["normalizedAppName"] = "Fennec",
        ["submissionDate"] = "19700101",
        ["appVersion"] = "62.0.2",
        ["DNT"] = "1",
        ["appBuildId"] = "20180920131237",
        ["appName"] = "Fennec",
        ["submission"] = {value = '{"sessions":1,"clientId":"7cac7c8f-6c0f-4a33-b1f9-e4c2519f53cb","os":"Android","created":"2018-09-29","tz":330,"defaultSearch":null,"experiments":["leanplum-start","custom-tabs","top-addons-menu","process-background-telemetry","download-content-catalog-sync","hls-video-playback","bookmark-history-menu"],"accessibilityServices":["com.symantec.mobilesecurity/.appadvisor.ScanAccessibilityService"],"locale":"en-IN","flashUsage":0,"defaultBrowser":false,"v":9,"displayVersion":"62.0.2","profileDate":17795,"durations":32,"arch":"arm64-v8a","osversion":"27","device":"10or-E","seq":13}', value_type = 1, representation = "json"},
        ["Date"] = "Sat, 29 Sep 2018 10:43:39 GMT",
        ["sampleId"] = 46,
        ["normalizedChannel"] = "release",
        ["sourceName"] = "telemetry",
        ["clientId"]= "7cac7c8f-6c0f-4a33-b1f9-e4c2519f53cb",
        ["documentId"] = "3a6f7d87-6c10-40d9-b341-852c005c673d",
        ["docType"] = "core",
        ["geoCountry"] = "US",
        ["Host"] = "incoming.telemetry.mozilla.org",
        ["geoCity"] = "Milton",
        ["geoSubdivision1"] = "WA"
    }
    },
}

local cnt = 0
function process_message()
    cnt = cnt + 1
    local received = decode_message(read_message("raw"))
    test.fields_array_to_hash(received)
    test.verify_msg(messages[cnt], received, cnt)
    return 0
end

function timer_event(ns)
    assert(cnt == #messages, string.format("%d of %d tests ran", cnt, #messages))
end
