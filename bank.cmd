#########################################
# BANK SCRIPT by Shroom 
# Start outside or in the lobby of any bank
if contains("$roomname", "First Provincial Bank") then goto Crossing
if contains("$roomname", "Shard, Moonstone Street") then goto Shard.Outside
if contains("$roomname", "The Crossing, Hodierna Way") then goto Crossing.Outside
if contains("$roomname", "Bank of Riverhaven") then goto Haven
if contains("$roomname", "Old Lata'arna Keep") then goto Muspar'i
if contains("$roomname", "Bank of Therenborough") then goto Theren
if contains("$roomname", "Traders' Guild Outpost, Foyer") then goto Rossman
if contains("$roomname", "Faldesu Exchequer, Foyer") then goto Throne
if contains("$roomname", "Bank of Raven's Point, Lobby") then goto Raven
if contains("$roomname", "Imperial Depository, Lobby" then goto Leth
if contains("$roomname", "First Bank of Ilithi, Teller's Windows") then goto Shard.Teller
if contains("$roomname", "Shard, First Bank of Ilithi") then goto Shard
if contains("$roomname", "First Bank of Ilithi, Coin Exchange") then goto Shard.Exch
if contains("$roomobjs", "the Travellers' Bank") then goto Dirge.Outside
if contains("$roomname", "Dirge, Traveller's Bank") then goto Dirge
if contains("$roomname", "Hibarnhvidar, Bank Foyer") then goto Hibar1
if contains("$roomname", "Second Provincial Bank of Hibarnhvid") then goto Hibar2
if contains("$roomname", "Chyolvea Tayeu'a" then goto Fortress
if contains("$roomdesc", "Sooty clay oil lamps hang from iron rings bolted") then goto HibaRanger
if contains("$roomname", "Lower Bank of Ratha,") then goto LowRatha
if contains("$roomname", "Sshoi-sson Palace") then goto UpperRatha
if contains("$roomname", "Tona Kertigen, Harti") then goto Aesry
if contains("$roomname", "Baron's Forset, Teller") then goto Enclave
if contains("$roomname", "Harti Clemois Bank") then goto Mer'Kesh
if contains("$roomname", "Mer'Kresh, Ship Circle") then goto Merk1
if contains("$roomname", "Strand Communal Center, Basement") then goto CrossingPremie
if contains("$roomname", "Riverhaven, Mansion Gate") then goto HavenPremie
if contains("$roomname", "Alydendael, Front Gardens") then goto Mer'KresPremie
if contains("$roomname", "First Council Banking, Vestibule") then goto Fang
echo
echo Not at a recognized bank location!
echo Start outside or in bank lobby
exit

KRO.TO.DOK:
var first kro
var second dok
goto EXCHANGE
KRO.TO.LIR:
var first kro
var second lir
goto EXCHANGE
LIR.TO.DOK:
var first lir
var second dok
goto EXCHANGE
LIR.TO.KRO:
var first lir
var second kro
goto EXCHANGE
DOK.TO.KRO:
var first dok
var second kro
goto EXCHANGE
DOK.TO.LIR:
var first dok
var second lir
goto EXCHANGE

EXCHANGE:
matchre EXCHANGE.100 I'd really rather not handle transactions larger
matchre RETURN hands you|But you don't|A transaction that small|The minimum|You count
put exchange all %first to %second
matchwait

EXCHANGE.100:
put exchange 100 plat %first to %second
pause 0.5
goto EXCHANGE

Deposit:
put wealth
waitforre Wealth:|You count
put dep all
put balance
waitforre current balance is|finally manage to locate the jar|You count|You find your jar
return

Shard.Outside:
move go bank
goto Shard
Shard.Teller:
move s
Shard:
move e
Shard.Exch:
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move w
move n
gosub Deposit
move s
move out
goto EXIT

Crossing.Outside:
move go bank
Crossing:
move go booth
gosub LIR.TO.KRO
gosub DOK.TO.KRO
move out
move go window
gosub Deposit
move out
move out
goto EXIT

Haven.Outside:
move go bank
Haven:
move go arch
move go door
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move go door
gosub Deposit
move go arch
move out
goto EXIT

Theren:
move w
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move e
move n
pause
gosub Deposit
move s
goto EXIT

Leth:
move up
move up
gosub LIR.TO.KRO
gosub DOK.TO.KRO
move down
gosub Deposit
move down
goto EXIT

LowRatha:
move go door
move go bursar
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move go atr
move go cash
gosub Deposit
move go atr
move go door
goto EXIT

UpperRatha:
move n
move n
move climb stair
move go door
move e
move e
gosub Deposit
move w
move w
move go door
move climb stair
move s
move s
echo
echo To exchange currency, you'll have to go to the First Tier Bank
echo
goto EXIT

Fang:
move clim ladder
gosub LIR.TO.DOK
gosub KRO.TO.DOK
move up
move go step
gosub Deposit
move up
move out
goto EXIT

Aesry:
move go door
move n
move w
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move e
gosub Deposit
move s
move go door
goto EXIT

Muspar'i:
move cli stair
move ne
move nw
move cli stai
move east
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move w
move w
gosub Deposit
move e
move cli stair
move sw
move se
move cli stair
goto EXIT

Fortress:
move ne
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move sw
move nw
gosub Deposit
move se
goto EXIT

Dirge.Outside:
move go bank
Dirge:
gosub LIR.TO.KRO
gosub DOK.TO.KRO
gosub Deposit
goto EXIT

Throne:
move s
move s
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move n
move ne
move e
gosub Deposit
move w
move w
goto EXIT

Enclave:
move go corner
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move e
gosub Deposit
goto EXIT

Merk1:
put go build
Mer'Kesh:
move climb stair
move se
move up
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move down
move n
move up
gosub Deposit
move d
move sw
move climb stair
move out
goto EXIT

Rossman:
move go vault
move go booth
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move out
move out
put weal
echo
echo Depositing will cost money. If you want to deposit, Go Vault.
echo
goto EXIT

Raven:
move e
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move w
move w
gosub Deposit
move e
goto EXIT

Hibar1:
move sw
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move ne
move nw
gosub Deposit
move se
goto EXIT

Hibar2:
move e
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move w
move w
gosub Deposit
move e
exit

HibarRanger:
move s
move e
move go door
move w
GOSUB KRO.TO.DOK
GOSUB LIR.TO.DOK
move e
gosub Deposit
move out
move w
move n
goto EXIT


CrossingPremie:
move go door
move go door
gosub LIR.TO.KRO
gosub DOK.TO.KRO
move out
gosub Deposit
move out
goto EXIT

HavenPremie:
move se
move climb stai
move go door
move e
move s
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move n
gosub Deposit
move w
move go door
move climb stai
move nw
goto EXIT

Mer'KeshPremie:
move up
move nw
move down
move go door
move nw
move go arch
move n
gosub DOK.TO.LIR
gosub KRO.TO.LIR
move s
gosub Deposit
move go arch
move se
move go door
move up
move se
move d
goto EXIT

EXIT:
put #parse DONE BANK!
put #parse BANK DONE
echo *** DONE BANK!
EXIT

RETURN:
return