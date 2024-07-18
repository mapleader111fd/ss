if Sound == 'other' then
    if IsDuplicityVersion() then
        function playerUrlPos(source, name, url, vol, pos, loop, options)
            -- trigger your events or w/e
        end
    
        function pauseMusic(source, name)
            -- trigger your events or w/e
        end
        
        function resumeMusic(source, name)
            -- trigger your events or w/e
        end
        
        function stopMusic(source, name)
            -- trigger your events or w/e
        end
        
        function stateSound(source, name, pos)
            -- trigger your events or w/e
        end
        
        function setVolume(source, name, volume)
            -- trigger your events or w/e
        end
    else
        function soundExists(name)

            return true -- make your edits and return a boolean.
        end

        function isPlaying(currentPlaying)
            
            return true -- make your edits and return a boolean.
        end

        function isPaused(currentPlaying)

            return true -- make your edits and return a boolean.
        end
    end
end