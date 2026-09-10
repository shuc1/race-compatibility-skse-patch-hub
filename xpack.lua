-- xpack
includes("@builtin/xpack")

local projectname = projectname
local papyrusname = papyrusname

set_configdir("$(projectdir)")
add_configfiles("fomod/(**.xml.in)", {prefixdir = "fomod/"})
set_configvar("PROJECT_TITLE", projectname)
set_configvar("PAPYRUS_NAME", papyrusname)
add_configfiles("(extern/main/res/scripts/source/RaceCompatibility.psc.in)", {prefixdir = prefixdir})

xpack("release", function()
    set_formats("zip")

    on_load(function(package)
        import("core.project.project")

        package:set(
            "basename",
            projectname:gsub("%s+", "-") .. "-" .. project.version()
        )

        package:add("installfiles", "patch/(**)")
        package:add("installfiles", "(fomod/**)|**.in")
    end)

    after_package(function(package)
        local outfile = package:outputfile()
        local outdir = path.directory(outfile)
        local packdir = path.directory(outdir)

        os.mv(outfile, packdir)
        os.rmdir(outdir)

        import("core.base.json")
        print("[package]: " .. json.encode({
            filename = package:basename() .. package:extension(),
            name = projectname,
            file_id = 3210598,
            category = "optional",
            description = [[
Please check the description page for details.

Update the patch for Better Vampires v9.2.

If you find any issues caused by the patches, please report them here and don't bother the mod authors. Thanks!]],
        }))
    end)
end)

-- empty target for config file generation
target("config")
    set_kind("phony")
