#!/bin/bash

# SCRIPT INFORMATION
# ==============================================================================================
# NAME:
# VERSION:
# GITHUB (SOURCE): 
# LICENSE: 

# SCRIPT CONFIGURATION
# ==============================================================================================
# GET THE BASH PROCESS ID
ProcessID=$(echo $$)

# GET SCRIPT NAME INFORMATION
ScriptName=$(basename $0) # WITH ".SH"
ScriptNameRaw=$(basename $0 | sed 's/.sh//g') # WITHOUT ".SH" (FOR TEMP FILES)

# GET THE DIRECTORY THAT THE SCRIPT LIES IN
ScriptDir="$( cd "$( dirname "$0" )" && pwd )"

# GET THE DISTRO NAME (FOR LINUX; MAC SUPPORT MIGHT COME LATER)
DistroName=$(lsb_release -i | awk '{ for(i=3; i<=NF; ++i) printf $i""FS; print "" }'| sed 's/ *$//')

# TEMP DIR
TempDir=$(mktemp -d /tmp/$ScriptNameRaw.XXXXXXXXXX)

# COLOR VARIABLES
# ==============================================================================================
SystemBlack="\e[38;5;0m" #000
SystemMaroon="\e[38;5;1m" #001
SystemGreen="\e[38;5;2m" #002
SystemOlive="\e[38;5;3m" #003
SystemNavy="\e[38;5;4m" #004
SystemPurple="\e[38;5;5m" #005
SystemTeal="\e[38;5;6m" #006
SystemSilver="\e[38;5;7m" #007
SystemGrey="\e[38;5;8m" #008
SystemRed="\e[38;5;9m" #009
SystemLime="\e[38;5;10m" #010
SystemYellow="\e[38;5;11m" #011
SystemBlue="\e[38;5;12m" #012
SystemFuchsia="\e[38;5;13m" #013
SystemAqua="\e[38;5;14m" #014
SystemWhite="\e[38;5;15m" #015

# OTHER COLORS (16-255)
Black="\e[38;5;16m" #016
NavyBlue="\e[38;5;17m" #017
DarkBlue="\e[38;5;18m" #018
Blue3="\e[38;5;19m" #019
Blue2="\e[38;5;20m" #020
Blue1="\e[38;5;21m" #021
DarkGreen="\e[38;5;22m" #022
DeepSkyBlue7="\e[38;5;23m" #023
DeepSkyBlue6="\e[38;5;24m" #024
DeepSkyBlue5="\e[38;5;25m" #025
DodgerBlue3="\e[38;5;26m" #026
DodgerBlue2="\e[38;5;27m" #027
Green4="\e[38;5;28m" #028
SpringGreen6="\e[38;5;29m" #029
Turquoise2="\e[38;5;30m" #030
DeepSkyBlue4="\e[38;5;31m" #031
DeepSkyBlue3="\e[38;5;32m" #032
DodgerBlue1="\e[38;5;33m" #033
Green3="\e[38;5;34m" #034
SpringGreen5="\e[38;5;35m" #035
DarkCyan="\e[38;5;36m" #036
LightSeaGreen="\e[38;5;37m" #037
DeepSkyBlue2="\e[38;5;38m" #038
DeepSkyBlue1="\e[38;5;39m" #039
Green2="\e[38;5;40m" #040
SpringGreen4="\e[38;5;41m" #041
SpringGreen3="\e[38;5;42m" #042
Cyan3="\e[38;5;43m" #043
DarkTurquoise="\e[38;5;44m" #044
Turquoise1="\e[38;5;45m" #045
Green1="\e[38;5;46m" #046
SpringGreen2="\e[38;5;47m" #047
SpringGreen1="\e[38;5;48m" #048
MediumSpringGreen="\e[38;5;49m" #049
Cyan2="\e[38;5;50m" #050
Cyan1="\e[38;5;51m" #051
DarkRed2="\e[38;5;52m" #052
DeepPink8="\e[38;5;53m" #053
Purple5="\e[38;5;54m" #054
Purple4="\e[38;5;55m" #055
Purple3="\e[38;5;56m" #056
BlueViolet="\e[38;5;57m" #057
Orange4="\e[38;5;58m" #058
Grey30="\e[38;5;59m" #059
MediumPurple7="\e[38;5;60m" #060
SlateBlue3="\e[38;5;61m" #061
SlateBlue2="\e[38;5;62m" #062
RoyalBlue="\e[38;5;63m" #063
Chartreuse6="\e[38;5;64m" #064
DarkSeaGreen9="\e[38;5;65m" #065
PaleTurquoise2="\e[38;5;66m" #066
SteelBlue4="\e[38;5;67m" #067
SteelBlue3="\e[38;5;68m" #068
CornFlowerBlue="\e[38;5;69m" #069
Chartreuse5="\e[38;5;70m" #070
DarkSeaGreen8="\e[38;5;71m" #071
CadetBlue2="\e[38;5;72m" #072
CadetBlue1="\e[38;5;73m" #073
SkyBlue3="\e[38;5;74m" #074
SteelBlue2="\e[38;5;75m" #075
Chartreuse4="\e[38;5;76m" #076
PaleGreen4="\e[38;5;77m" #077
SeaGreen4="\e[38;5;78m" #078
Aquamarine3="\e[38;5;79m" #079
MediumTurquoise="\e[38;5;80m" #080
SteelBlue1="\e[38;5;81m" #081
Chartreuse3="\e[38;5;82m" #082
SeaGreen3="\e[38;5;83m" #083
SeaGreen2="\e[38;5;84m" #084
SeaGreen1="\e[38;5;85m" #085
Aquamarine2="\e[38;5;86m" #086
DarkSlateGray3="\e[38;5;87m" #087
DarkRed1="\e[38;5;88m" #088
DeepPink7="\e[38;5;89m" #089
DarkMagenta2="\e[38;5;90m" #090
DarkMagenta1="\e[38;5;91m" #091
DarkViolet2="\e[38;5;92m" #092
Purple2="\e[38;5;93m" #093
Orange3="\e[38;5;94m" #094
LightPink3="\e[38;5;95m" #095
Plum4="\e[38;5;96m" #096
MediumPurple6="\e[38;5;97m" #097
MediumPurple5="\e[38;5;98m" #098
SlateBlue1="\e[38;5;99m" #099
Yellow6="\e[38;5;100m" #100
Wheat2="\e[38;5;101m" #101
Grey29="\e[38;5;102m" #102
LightSlateGrey="\e[38;5;103m" #103
MediumPurple4="\e[38;5;104m" #104
LightSlateBlue="\e[38;5;105m" #105
Yellow5="\e[38;5;106m" #106
DarkOliveGreen6="\e[38;5;107m" #107
DarkSeaGreen7="\e[38;5;108m" #108
LightSkyBlue3="\e[38;5;109m" #109
LightSkyBlue2="\e[38;5;110m" #110
SkyBlue2="\e[38;5;111m" #111
Chartreuse2="\e[38;5;112m" #112
DarkOliveGreen5="\e[38;5;113m" #113
PaleGreen3="\e[38;5;114m" #114
DarkSeaGreen6="\e[38;5;115m" #115
DarkSlateGray2="\e[38;5;116m" #116
SkyBlue1="\e[38;5;117m" #117
Chartreuse1="\e[38;5;118m" #118
LightGreen2="\e[38;5;119m" #119
LightGreen1="\e[38;5;120m" #120
PaleGreen2="\e[38;5;121m" #121
Aquamarine1="\e[38;5;122m" #122
DarkSlateGray1="\e[38;5;123m" #123
Red3="\e[38;5;124m" #124
DeepPink6="\e[38;5;125m" #125
MediumVioletRed="\e[38;5;126m" #126
Magenta6="\e[38;5;127m" #127
DarkViolet1="\e[38;5;128m" #128
Purple1="\e[38;5;129m" #129
DarkOrange3="\e[38;5;130m" #130
IndianRed4="\e[38;5;131m" #131
HotPink5="\e[38;5;132m" #132
MediumOrchid4="\e[38;5;133m" #133
MediumOrchid3="\e[38;5;134m" #134
MediumPurple3="\e[38;5;135m" #135
DarkGoldenrod="\e[38;5;136m" #136
LightSalmon3="\e[38;5;137m" #137
RosyBrown="\e[38;5;138m" #138
Grey28="\e[38;5;139m" #139
MediumPurple2="\e[38;5;140m" #140
MediumPurple1="\e[38;5;141m" #141
Gold3="\e[38;5;142m" #142
DarkKhaki="\e[38;5;143m" #143
NavajoWhite2="\e[38;5;144m" #144
Grey27="\e[38;5;145m" #145
LightSteelBlue3="\e[38;5;146m" #146
LightSteelBlue2="\e[38;5;147m" #147
Yellow4="\e[38;5;148m" #148
DarkOliveGreen4="\e[38;5;149m" #149
DarkSeaGreen5="\e[38;5;150m" #150
DarkSeaGreen4="\e[38;5;151m" #151
LightCyan2="\e[38;5;152m" #152
LightSkyBlue1="\e[38;5;153m" #153
Greenyellow="\e[38;5;154m" #154
DarkOliveGreen3="\e[38;5;155m" #155
PaleGreen1="\e[38;5;156m" #156
DarkSeaGreen3="\e[38;5;157m" #157
DarkSeaGreen2="\e[38;5;158m" #158
PaleTurquoise1="\e[38;5;159m" #159
Red2="\e[38;5;160m" #160
DeepPink5="\e[38;5;161m" #161
DeepPink4="\e[38;5;162m" #162
Magenta5="\e[38;5;163m" #163
Magenta4="\e[38;5;164m" #164
Magenta3="\e[38;5;165m" #165
DarkOrange2="\e[38;5;166m" #166
IndianRed3="\e[38;5;167m" #167
HotPink4="\e[38;5;168m" #168
HotPink3="\e[38;5;169m" #169
Orchid3="\e[38;5;170m" #170
MediumOrchid2="\e[38;5;171m" #171
Orange2="\e[38;5;172m" #172
LightSalmon2="\e[38;5;173m" #173
LightPink2="\e[38;5;174m" #174
Pink2="\e[38;5;175m" #175
Plum3="\e[38;5;176m" #176
Violet="\e[38;5;177m" #177
Gold2="\e[38;5;178m" #178
LightGoldenrod5="\e[38;5;179m" #179
Tan="\e[38;5;180m" #180
MistyRose2="\e[38;5;181m" #181
Thistle2="\e[38;5;182m" #182
Plum2="\e[38;5;183m" #183
Yellow3="\e[38;5;184m" #184
Khaki2="\e[38;5;185m" #185
LightGoldenrod4="\e[38;5;186m" #186
LightYellow="\e[38;5;187m" #187
Grey26="\e[38;5;188m" #188
LightSteelBlue1="\e[38;5;189m" #189
Yellow2="\e[38;5;190m" #190
DarkOliveGreen2="\e[38;5;191m" #191
DarkOliveGreen1="\e[38;5;192m" #192
DarkSeaGreen1="\e[38;5;193m" #193
HoneyDewX="\e[38;5;194m" #194
LightCyan1="\e[38;5;195m" #195
Red1="\e[38;5;196m" #196
DeepPink3="\e[38;5;197m" #197
DeepPink2="\e[38;5;198m" #198
DeepPink1="\e[38;5;199m" #199
Magenta2="\e[38;5;200m" #200
Magenta1="\e[38;5;201m" #201
OrangeRed="\e[38;5;202m" #202
IndianRed2="\e[38;5;203m" #203
IndianRed1="\e[38;5;204m" #204
HotPink2="\e[38;5;205m" #205
HotPink1="\e[38;5;206m" #206
MediumOrchid1="\e[38;5;207m" #207
DarkOrange1="\e[38;5;208m" #208
Salmon="\e[38;5;209m" #209
LightCoral="\e[38;5;210m" #210
PaleVioletRed="\e[38;5;211m" #211
Orchid2="\e[38;5;212m" #212
Orchid1="\e[38;5;213m" #213
Orange1="\e[38;5;214m" #214
SandyBrown="\e[38;5;215m" #215
LightSalmon1="\e[38;5;216m" #216
LightPink1="\e[38;5;217m" #217
Pink1="\e[38;5;218m" #218
Plum1="\e[38;5;219m" #219
Gold1="\e[38;5;220m" #220
LightGoldenrod3="\e[38;5;221m" #221
LightGoldenrod2="\e[38;5;222m" #222
NavajoWhite1="\e[38;5;223m" #223
MistyRose1="\e[38;5;224m" #224
Thistle1="\e[38;5;225m" #225
Yellow1="\e[38;5;226m" #226
LightGoldenrod1="\e[38;5;227m" #227
Khaki1="\e[38;5;228m" #228
Wheat1="\e[38;5;229m" #229
CornSilk="\e[38;5;230m" #230
Grey25="\e[38;5;231m" #231
Grey24="\e[38;5;232m" #232
Grey23="\e[38;5;233m" #233
Grey22="\e[38;5;234m" #234
Grey21="\e[38;5;235m" #235
Grey20="\e[38;5;236m" #236
Grey19="\e[38;5;237m" #237
Grey18="\e[38;5;238m" #238
Grey17="\e[38;5;239m" #239
Grey16="\e[38;5;240m" #240
Grey15="\e[38;5;241m" #241
Grey14="\e[38;5;242m" #242
Grey13="\e[38;5;243m" #243
Grey12="\e[38;5;244m" #244
Grey11="\e[38;5;245m" #245
Grey10="\e[38;5;246m" #246
Grey9="\e[38;5;247m" #247
Grey8="\e[38;5;248m" #248
Grey7="\e[38;5;249m" #249
Grey6="\e[38;5;250m" #250
Grey5="\e[38;5;251m" #251
Grey4="\e[38;5;252m" #252
Grey3="\e[38;5;253m" #253
Grey2="\e[38;5;254m" #254
White="\e[38;5;255m" #255

# SCRIPT FUNCTIONS
# ==============================================================================================
# BANNER FUNCTION
PrintBanner() {
    # REPLACE THIS BANNER WITH A CUSTOM BANNER.
    echo -e "${Cyan1}            __             __           _       _   ";
    echo -e "${Orange1}         /\ \ \___ _   _  / _\ ___ _ __(_)_ __ | |_ ";
    echo -e "${Green1}        /  \/ / _ \ | | | \ \ / __| '__| | '_ \| __|";
    echo -e "${Purple1}       / /\  /  __/ |_| | _\ \ (__| |  | | |_) | |_ ";
    echo -e "${Red1}       \_\ \/ \___|\__,_| \__/\___|_|  |_| .__/ \__|";
    echo -e "${Tan}==============================================================="
}

# CLEAN UP FUNCTION (FOR TRAP)
CleanUp() {
    echo -e "${Tan}Cleaning up..."
    rm -r $TempDir  # REMOVE TEMP DIRECTORY
}

# MAIN()
# ==============================================================================================

main() { 
    clear
    clear
    
    # REPLACE THE CODE HERE WITH YOUR SCRIPT CODE
    PrintBanner
    echo -e "${Cyan1}OS:${DarkOrange1} ${DistroName} ${Cyan1}PID:${DarkOrange1} ${ProcessID} ${Cyan1}TEMP:${DarkOrange1}${TempDir}"
    echo -e "${Tan}==============================================================="
    echo ""
    echo -e "${Cyan1}1)${DarkOrange1} REFRESH"
    echo -e "${Cyan1}2)${DarkOrange1} EXIT"
    echo ""
    read -p "> " OPTION
    case $OPTION in
        1)
            clear
            clear
            echo "Refreshing..."
            sleep 0.5
            main
            ;;
        2 | exit | quit)
            clear
            clear
            echo ""
            echo -e "${Cyan1}Option 2 Selected"
            echo ""
            CleanUp
            if [ ! -d "$TempDir" ]; then
                echo -e "${Green1}SUCCESS! ${DarkOrange1}TEMP DIRECTORY REMOVED."
                echo ""
                echo -e "${Yellow1}Exiting..."
                echo ""
                sleep 0.2
                exit
            else
                echo -e "${Yellow1}ERROR! ${DarkOrange1}COULD NOT REMOVE TEMP DIRECTORY."
                echo ""
                echo -e "${Tan}CHECK YOUR /tmp DIRECTORY FOR \"${TempDir}\""
                echo -e "DELETE IF NEEDED."
                echo ""
                sleep 2
                exit
            fi
            ;;
        *)
            echo "INVALID OPTION!"
            ;;
    esac

    echo ""
    

    # TRAP CONFIGURATIONS
    trap 'CleanUp' EXIT
}

main # RUN
