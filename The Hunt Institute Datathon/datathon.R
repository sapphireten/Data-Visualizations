library(plotly)
library(tidyverse)

''' A Plotly Interactive Pie Chart that was a part of a project to find evidence that 
supports the idea that access to adequete broadband internet access increases
post-secondary attainment rate.'''

data <- "/Users/brandonmiranda/Desktop/attain.csv"

content <- read.csv(data)

print(content)

colors <- c('rgb(211,94,96)','rgb(128,133,133)','rgb(144,103,167)','rgb(171,104,87)',
            'rgb(114,147,203)','rgb(195,229,57')
county = c('Durham','Mecklenburg','Wake','Duplin','Sampson','Wayne','Cumberland')

attainment = c('56','55','63','22','25','33','38')

pop = c('175027','603630','592681','29328','31485','62367','167386')

content_frame <- data.frame(county,
                            attainment,
                            pop)
t <- list(color = 'black')

new_frame <- content_frame[,c('county','pop')]
thon <- plot_ly(new_frame, labels = ~county, values = ~pop, type = 'pie',
                textposition = 'inside',
                texttemplate = "%{label} <br>%{value}<", 
                insidetextfont = list(color = 'black'),
                hoverinfo = 'text',
                text = ~paste(attainment,'%'),
                marker = list(colors = colors,
                              line = list(color='#FFFFFF',width = 1)),
                showlegend = TRUE)

thon <- thon %>% layout(title = 'Post-Secondary Attainment Rate by County For Ages 25-64',
                      
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
thon
"%{label}: %{value:$,s} <br>(%{percent})"

#  The following Visualization is a bar chart showing 3 community colleges within range of 3
#  rural counties(Wayne,Sampson,Duplin). It displays that over the years even in these rural areas 
# post-secondary cirriculum completion is rising as the years continue.
x = c(2017,2018,2019)
wayne <- c(15,35,57)
sampson <-c(14,33,58)
james <-c(12,31,59)

colors <- c('rgb(1,125,71)','rgb(78,253,177)','rgb(3,252,144)')

info <- data.frame(x,wayne,sampson,james)

bars <- plot_ly(info, x = ~x, y = ~wayne, type ='bar', name = 'WayneCC',
                marker = list(colors=colors))
bars <- bars %>% add_trace(y = ~sampson, name ='SampsonCC')
bars <- bars %>% add_trace(y = ~james, name='James Sprunt')
bars <- bars %>% layout(yaxis = list(title='Success Rate', ticksuffix = '%'), barmode = 'group',
                        title = "Curriculum Completion Rate by Term")

bars
