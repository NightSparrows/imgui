project "imgui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
  
	files 
	{
		"imgui.cpp",
		"imgui_widgets.cpp",
		"imgui_tables.cpp",
		"imgui_draw.cpp",
		"imgui_demo.cpp"
	}
	
	filter "system:windows"
		systemversion "latest"
		buildoptions { "/utf-8" }
		flags { "MultiProcessorCompile" }		-- Parallel compiling

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "On"
