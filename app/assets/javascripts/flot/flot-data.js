

//Flot Pie Chart
$(function() {
    getCurrentAssests();

    function getCurrentAssests() {
        $.ajax({
            type: "GET",
            url: "/current_assets",
            data: {},
            success: function(json)
            {
                console.log("exito");
                data = json
                console.log(data[1]);

                var plotObj = $.plot($("#flot-pie-chart"), data, {
                    series: {
                        pie: {
                            show: true
                        }
                    },
                    grid: {
                        hoverable: true
                    },
                    tooltip: true,
                    tooltipOpts: {
                        content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                        shifts: {
                            x: 20,
                            y: 0
                        },
                        defaultTheme: false
                    }
                });
            }
        });
        
        return true;
    };

});


