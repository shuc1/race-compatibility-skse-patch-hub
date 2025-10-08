-- set minimum xmake version
set_xmakever("2.9.9")

includes("@builtin/xpack")
includes("xmake-rules.lua")

project_name = "Race Compatibility SKSE - Patch Hub"

set_version("2.1.6")

-- build
for subdir, _ in pairs(get_papyrus_source_subdirs("patch/")) do
    -- print("Adding patch subdir: " .. subdir)
    target_name = path.basename(path.directory(path.directory(subdir)))
    target(target_name, function()
        add_rules("papyrus")

        add_files(subdir .. "/**.psc")
        potential_include = "include/" .. target_name
        -- print("Potential include: " .. potential_include)
        if os.exists(potential_include) then
            add_includedirs(potential_include)
        end
    end)
end

-- xpack
set_configdir("$(projectdir)")
add_configfiles("fomod/(**.xml.in)", {prefixdir = "fomod/"})
set_configvar("PROJECT_TITLE", project_name)
xpack("patch", function() 
    -- package
    set_formats("zip")
    set_basename(project_name .. "-$(version)")
    -- add fomod info and all files
    add_installfiles("patch/(**)")
    add_installfiles("(fomod/**)|**.in")
end)