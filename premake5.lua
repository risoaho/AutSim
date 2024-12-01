workspace "AutSim"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "AutSim"
	location "AutSim"
	kind "SharedLib"
	language "C++"

	targetdir	("bin/" .. outputdir .. "/%{prj.name}")
	objdir		("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include",
		"%{prj.name}/src" -- TOIVO ADD
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions "/utf-8"

		defines
		{
			"AUT_PLATFORM_WINDOWS",
			"AUT_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "AUT_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AUT_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "AUT_DIST"
		optimize "On"

	filter { "system:windows" } -- I hope this is right -Max
		buildoptions "/utf-8"
	

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir	("bin/" .. outputdir .. "/%{prj.name}")
	objdir		("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"AutSim/vendor/spdlog/include",
		"AutSim/src"
	}

	links
	{
		"AutSim",
		"AutSim/src" -- TOIVO ADD
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions "/utf-8"

		defines
		{
			"AUT_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "AUT_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AUT_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "AUT_DIST"
		optimize "On"	
		