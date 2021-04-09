window.onload = function() 
{
    setTimeout(function() {
        var content = document.getElementById("content");
        for(let svg of svgs)
        {
            content.innerHTML += `<a href="svg/${svg}" class="svg"><img src="svg/${svg}" alt="${svg}" loading="lazy"><br><span class="caption">${svg}</span></a>`
        }
    }, 0);
}