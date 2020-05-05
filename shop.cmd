action goto end when ^There is nothing to buy here
put #window open shopWindow
put #window show shopWindow
var altar 0
var armoir 0
var bale 0
var bar 0
var barn 0
var barrel 0
var basket 0
var bedroll 0
var bench 0
var belt 0
var bin 0
var block 0
var blossom 0
var boar 0
var board 0
var bookcase 0
var bookshelf 0
var bookshelves 0
var bookstand 0
var box 0
var branch 0
var breakfront 0
var broomstick 0
var bucket 0
var buffet 0
var bull 0
var bureau 0
var bust 0
var butterflies 0
var butterfly 0
var cabinet 0
var carpet 0
var cart 0
var carton 0
var case 0
var cask 0
var catak 0
var catalog 0
var cauldron 0
var chair 0
var chest 0
var closet 0
var cloud 0
var coffer 0
var column 0
var container 0
var cord 0
var cornucopia 0
var corral 0
var cot 0
var counter 0
var cradle 0
var crate 0
var cupboard 0
var cushion 0
var curio 0
var dais 0
var desk 0
var display 0
var drawer 0
var dresser 0
var drum 0
var dummies 0
var dummy 0
var easel 0
var endtable 0
var fence 0
var figure 0
var firepit 0
var footlocker 0
var footrest 0
var fountain 0
var framework 0
var garderobe 0
var goblin 0
var gourd 0
var grinder 0
var hand 0
var hanger 0
var hatstand 0
var hay 0
var head 0
var heap 0
var highboy 0
var hole 0
var holder 0
var hook 0
var hooks 0
var horse 0
var hutch 0
var jar 0
var keg 0
var lattice 0
var locker 0
var log 0
var lowboy 0
var mannequin 0
var mantel 0
var mantle 0
var monument 0
var moon 0
var net 0
var niche 0
var ogre 0
var pail 0
var palette 0
var pallet 0
var panel 0
var peccaries 0
var peccary 0
var pedestal 0
var peg 0
var pegboard 0
var pew 0
var pillow 0
var pile 0
var pipe 0
var pit 0
var plank 0
var planter 0
var platter 0
var plinth 0
var podium 0
var pole 0
var post 0
var pumpkin 0
var quilt 0
var rack 0
var rope 0
var rug 0
var salver 0
var sawhorse 0
var sculpture 0
var shelf 0
var shell 0
var shelves 0
var showcase 0
var sidebar 0
var sideboard 0
var skeleton 0
var skippet 0
var spittoon 0
var stable 0
var stand 0
var star 0
var statue 0
var stool 0
var stove 0
var stump 0
var sun 0
var table 0
var tentacle 0
var tomb 0
var tray 0
var tree 0
var trestle 0
var trough 0
var trunk 0
var turtle 0
var urn 0
var valet 0
var vanities 0
var vanity 0
var vat 0
var wall 0
var wardrobe 0
var waterwheel 0
var web 0
var webbing 0
var wheelbarrow 0
var workbench 0
var worktable 0

ACTION var altar 1 WHEN ^\s+(an?|some|the).+\baltare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var armoir 1 WHEN ^\s+(an?|some|the).+\barmoire?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bale 1 WHEN ^\s+(an?|some|the).+\bbalee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bar 1 WHEN ^\s+(an?|some|the).+\bbare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var barn 1 WHEN ^\s+(an?|some|the).+\bbarne?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var barrel 1 WHEN ^\s+(an?|some|the).+\bbarrele?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var basket 1 WHEN ^\s+(an?|some|the).+\bbaskete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bedroll 1 WHEN ^\s+(an?|some|the).+\bbedrolle?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bench 1 WHEN ^\s+(an?|some|the).+\bbenche?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var belt 1 WHEN ^\s+(an?|some|the).+\bbelt?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bin 1 WHEN ^\s+(an?|some|the).+\bbine?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var block 1 WHEN ^\s+(an?|some|the).+\bblocke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var blossom 1 WHEN ^\s+(an?|some|the).+\bblossome?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var boar 1 WHEN ^\s+(an?|some|the).+\bboare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var board 1 WHEN ^\s+(an?|some|the).+\bboarde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bookcase 1 WHEN ^\s+(an?|some|the).+\bbookcasee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bookshelf 1 WHEN ^\s+(an?|some|the).+\bbookshelfe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bookshelves 1 WHEN ^\s+(an?|some|the).+\bbookshelves\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bookstand 1 WHEN ^\s+(an?|some|the).+\bbookstande?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var box 1 WHEN ^\s+(an?|some|the).+\bboxe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var branch 1 WHEN ^\s+(an?|some|the).+\bbranche?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var breakfront 1 WHEN ^\s+(an?|some|the).+\bbreakfronte?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var broomstick 1 WHEN ^\s+(an?|some|the).+\bbroomsticke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bucket 1 WHEN ^\s+(an?|some|the).+\bbuckete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var buffet 1 WHEN ^\s+(an?|some|the).+\bbuffete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bull 1 WHEN ^\s+(an?|some|the).+\bbulle?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bureau 1 WHEN ^\s+(an?|some|the).+\bbureaue?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var bust 1 WHEN ^\s+(an?|some|the).+\bbuste?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var butterflies 1 WHEN ^\s+(an?|some|the).+\bbutterflies\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var butterfly 1 WHEN ^\s+(an?|some|the).+\bbutterflye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cabinet 1 WHEN ^\s+(an?|some|the).+\bcabinete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var carpet 1 WHEN ^\s+(an?|some|the).+\bcarpete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cart 1 WHEN ^\s+(an?|some|the).+\bcarte?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var carton 1 WHEN ^\s+(an?|some|the).+\bcartone?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var case 1 WHEN ^\s+(an?|some|the).+\bcasee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cask 1 WHEN ^\s+(an?|some|the).+\bcask?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var catak 1 WHEN ^\s+(an?|some|the).+\bcatak?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var catalog 1 WHEN ^\s+(an?|some|the).+\bcataloge?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cauldron 1 WHEN ^\s+(an?|some|the).+\bcauldrone?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var chair 1 WHEN ^\s+(an?|some|the).+\bchaire?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var chest 1 WHEN ^\s+(an?|some|the).+\bcheste?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var closet 1 WHEN ^\s+(an?|some|the).+\bclosete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cloud 1 WHEN ^\s+(an?|some|the).+\bcloude?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var coffer 1 WHEN ^\s+(an?|some|the).+\bcoffere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var container 1 WHEN ^\s+(an?|some|the).+\bcontainere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var column 1 WHEN ^\s+(an?|some|the).+\bcolumn?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cord 1 WHEN ^\s+(an?|some|the).+\bcorde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cornucopia 1 WHEN ^\s+(an?|some|the).+\bcornucopiae?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var corral 1 WHEN ^\s+(an?|some|the).+\bcorrale?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cot 1 WHEN ^\s+(an?|some|the).+\bcote?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var counter 1 WHEN ^\s+(an?|some|the).+\bcountere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cradle 1 WHEN ^\s+(an?|some|the).+\bcradlee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var crate 1 WHEN ^\s+(an?|some|the).+\bcratee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cupboard 1 WHEN ^\s+(an?|some|the).+\bcupboarde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var cushion 1 WHEN ^\s+(an?|some|the).+\bcushione?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var curio 1 WHEN ^\s+(an?|some|the).+\bcurio?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var dais 1 WHEN ^\s+(an?|some|the).+\bdais\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var desk 1 WHEN ^\s+(an?|some|the).+\bdisplaye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var display 1 WHEN ^\s+(an?|some|the).+\bdisplaye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var drawer 1 WHEN ^\s+(an?|some|the).+\bdrawere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var dresser 1 WHEN ^\s+(an?|some|the).+\bdressere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var drum 1 WHEN ^\s+(an?|some|the).+\bdrume?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var dummies 1 WHEN ^\s+(an?|some|the).+\bdummies\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var dummy 1 WHEN ^\s+(an?|some|the).+\bdummye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var easel 1 WHEN ^\s+(an?|some|the).+\beasele?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var endtable 1 WHEN ^\s+(an?|some|the).+\bendtablee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var fence 1 WHEN ^\s+(an?|some|the).+\bfencee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var figure 1 WHEN ^\s+(an?|some|the).+\bfigure?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var firepit 1 WHEN ^\s+(an?|some|the).+\bfirepite?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var footlocker 1 WHEN ^\s+(an?|some|the).+\bfootlockere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var footrest 1 WHEN ^\s+(an?|some|the).+\bfootreste?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var fountain 1 WHEN ^\s+(an?|some|the).+\bfountaine?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var framework 1 WHEN ^\s+(an?|some|the).+\bframeworke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var garderobe 1 WHEN ^\s+(an?|some|the).+\bgarderobee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var goblin 1 WHEN ^\s+(an?|some|the).+\bgobline?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var gourd 1 WHEN ^\s+(an?|some|the).+\bgourde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var grinder 1 WHEN ^\s+(an?|some|the).+\bgrindere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hand 1 WHEN ^\s+(an?|some|the).+\bhande?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hanger 1 WHEN ^\s+(an?|some|the).+\bhangere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hatstand 1 WHEN ^\s+(an?|some|the).+\bhatstande?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hay 1 WHEN ^\s+(an?|some|the).+\bhay?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var head 1 WHEN ^\s+(an?|some|the).+\bheade?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var heap 1 WHEN ^\s+(an?|some|the).+\bheap?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var highboy 1 WHEN ^\s+(an?|some|the).+\bhighboye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hole 1 WHEN ^\s+(an?|some|the).+\bholee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hook 1 WHEN ^\s+(an?|some|the).+\bhooks?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hooks 1 WHEN ^\s+(an?|some|the).+\bhooks\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var holder 1 WHEN ^\s+(an?|some|the).+\bholder?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var hutch 1 WHEN ^\s+(an?|some|the).+\bhutche?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var horse 1 WHEN ^\s+(an?|some|the).+\bhorsee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var jar 1 WHEN ^\s+(an?|some|the).+\bjare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var keg 1 WHEN ^\s+(an?|some|the).+\bkege?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var lattice 1 WHEN ^\s+(an?|some|the).+\blatticee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var locker 1 WHEN ^\s+(an?|some|the).+\blockere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var log 1 WHEN ^\s+(an?|some|the).+\blog?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var lowboy 1 WHEN ^\s+(an?|some|the).+\blowboye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var mannequin 1 WHEN ^\s+(an?|some|the).+\bmannequine?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var mantel 1 WHEN ^\s+(an?|some|the).+\bmantele?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var mantle 1 WHEN ^\s+(an?|some|the).+\bmantlee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var monument 1 WHEN ^\s+(an?|some|the).+\bmmonument?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var moon 1 WHEN ^\s+(an?|some|the).+\bmoone?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var net 1 WHEN ^\s+(an?|some|the).+\bnete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var niche 1 WHEN ^\s+(an?|some|the).+\bnichee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var ogre 1 WHEN ^\s+(an?|some|the).+\bogree?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pail 1 WHEN ^\s+(an?|some|the).+\bpaile?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var palette 1 WHEN ^\s+(an?|some|the).+\bpalette?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pallet 1 WHEN ^\s+(an?|some|the).+\bpallete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var panel 1 WHEN ^\s+(an?|some|the).+\bpanele?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var peccaries 1 WHEN ^\s+(an?|some|the).+\bpeccaries\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var peccary 1 WHEN ^\s+(an?|some|the).+\bpeccarye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pedestal 1 WHEN ^\s+(an?|some|the).+\bpedestale?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var peg 1 WHEN ^\s+(an?|some|the).+\bpege?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pegboard 1 WHEN ^\s+(an?|some|the).+\bpegboarde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pew 1 WHEN ^\s+(an?|some|the).+\bpewe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pillow 1 WHEN ^\s+(an?|some|the).+\bpillowe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pile 1 WHEN ^\s+(an?|some|the).+\bpile?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pipe 1 WHEN ^\s+(an?|some|the).+\bpipee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pit 1 WHEN ^\s+(an?|some|the).+\bpite?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var plank 1 WHEN ^\s+(an?|some|the).+\bplanke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var planter 1 WHEN ^\s+(an?|some|the).+\bplantere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var platter 1 WHEN ^\s+(an?|some|the).+\bplattere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var plinth 1 WHEN ^\s+(an?|some|the).+\bplinthe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var podium 1 WHEN ^\s+(an?|some|the).+\bpodiume?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pole 1 WHEN ^\s+(an?|some|the).+\bpolee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var post 1 WHEN ^\s+(an?|some|the).+\bposte?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var pumpkin 1 WHEN ^\s+(an?|some|the).+\bpumpkine?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var quilt 1 WHEN ^\s+(an?|some|the).+\bquilte?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var rack 1 WHEN ^\s+(an?|some|the).+\bracke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var rope 1 WHEN ^\s+(an?|some|the).+\bropee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var rug 1 WHEN ^\s+(an?|some|the).+\bruge?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var salver 1 WHEN ^\s+(an?|some|the).+\bsalvere?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var sawhorse 1 WHEN ^\s+(an?|some|the).+\bsawhorsee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var sculpture 1 WHEN ^\s+(an?|some|the).+\bsculpture?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var shelf 1 WHEN ^\s+(an?|some|the).+\bshelfe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var shell 1 WHEN ^\s+(an?|some|the).+\bshelle?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var shelves 1 WHEN ^\s+(an?|some|the).+\bshelves\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var showcase 1 WHEN ^\s+(an?|some|the).+\bshowcasee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var sidebar 1 WHEN ^\s+(an?|some|the).+\bsidebare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var sideboard 1 WHEN ^\s+(an?|some|the).+\bsideboarde?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var skeleton 1 WHEN ^\s+(an?|some|the).+\bskeletone?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var skippet 1 WHEN ^\s+(an?|some|the).+\bskippete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var spittoon 1 WHEN ^\s+(an?|some|the).+\bspittoone?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var stable 1 WHEN ^\s+(an?|some|the).+\bstablee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var stand 1 WHEN ^\s+(an?|some|the).+\bstande?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var star 1 WHEN ^\s+(an?|some|the).+\bstare?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var statue 1 WHEN ^\s+(an?|some|the).+\bstatues?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var stool 1 WHEN ^\s+(an?|some|the).+\bstoole?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var stove 1 WHEN ^\s+(an?|some|the).+\bstovee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var stump 1 WHEN ^\s+(an?|some|the).+\bstumpe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var sun 1 WHEN ^\s+(an?|some|the).+\bsune?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var table 1 WHEN ^\s+(an?|some|the).+\btablee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var tentacle 1 WHEN ^\s+(an?|some|the).+\btentacle?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var tomb 1 WHEN ^\s+(an?|some|the).+\btombe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var tray 1 WHEN ^\s+(an?|some|the).+\btraye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var tree 1 WHEN ^\s+(an?|some|the).+\btreee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var trestle 1 WHEN ^\s+(an?|some|the).+\btrestlee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var trough 1 WHEN ^\s+(an?|some|the).+\btroughe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var trunk 1 WHEN ^\s+(an?|some|the).+\btrunke?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var turtle 1 WHEN ^\s+(an?|some|the).+\bturtlee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var urn 1 WHEN ^\s+(an?|some|the).+\burne?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var valet 1 WHEN ^\s+(an?|some|the).+\bvalete?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var vanities 1 WHEN ^\s+(an?|some|the).+\bvanities\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var vanity 1 WHEN ^\s+(an?|some|the).+\bvanitye?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var vat 1 WHEN ^\s+(an?|some|the).+\bvate?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var wall 1 WHEN ^\s+(an?|some|the).+\bwalle?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var wardrobe 1 WHEN ^\s+(an?|some|the).+\bwardrobee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var waterwheel 1 WHEN ^\s+(an?|some|the).+\bwaterwheele?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var web 1 WHEN ^\s+(an?|some|the).+\bwebe?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var webbing 1 WHEN ^\s+(an?|some|the).+\bwebbinge?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var wheelbarrow 1 WHEN ^\s+(an?|some|the).+\bwheelbarrow?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var workbench 1 WHEN ^\s+(an?|some|the).+\bworkbenche?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))
ACTION var worktable 1 WHEN ^\s+(an?|some|the).+\bworktablee?s?\b(?!.+(Dokoras?|Kronars?|Lirums?))

send shop
waitforre ^The following items contain goods for sale:

startshop:
if %altar = 1 then gosub shopvar altar
if %armoir = 1 then gosub shopvar armoir
if %bale = 1 then gosub shopvar bale
if %bar = 1 then gosub shopvar bar
if %barn = 1 then gosub shopvar barn
if %barrel = 1 then gosub shopvar barrel
if %basket = 1 then gosub shopvar basket
if %bedroll = 1 then gosub shopvar bedroll
if %bench = 1 then gosub shopvar bench
if %belt = 1 then gosub shopvar belt
if %bin = 1 then gosub shopvar bin
if %block = 1 then gosub shopvar block
if %blossom = 1 then gosub shopvar blossom
if %boar = 1 then gosub shopvar boar
if %board = 1 then gosub shopvar board
if %bookcase = 1 then gosub shopvar bookcase
if %bookshelf = 1 then gosub shopvar bookshelf
if %bookshelves = 1 then gosub shopvar bookshelves
if %bookstand = 1 then gosub shopvar bookstand
if %box = 1 then gosub shopvar box
if %branch = 1 then gosub shopvar branch
if %breakfront = 1 then gosub shopvar breakfront
if %broomstick = 1 then gosub shopvar broomstick
if %bucket = 1 then gosub shopvar bucket
if %buffet = 1 then gosub shopvar buffet
if %bull = 1 then gosub shopvar bull
if %bureau = 1 then gosub shopvar bureau
if %bust = 1 then gosub shopvar bust
if %butterflies = 1 then gosub shopvar butterflies
if %butterfly = 1 then gosub shopvar butterfly
if %cabinet = 1 then gosub shopvar cabinet
if %carpet = 1 then gosub shopvar carpet
if %cart = 1 then gosub shopvar cart
if %carton = 1 then gosub shopvar carton
if %case = 1 then gosub shopvar case
if %cask = 1 then gosub shopvar cask
if %catak = 1 then gosub shopvar catak
if %catalog = 1 then gosub shopvar catalog
if %cauldron = 1 then gosub shopvar cauldron
if %chair = 1 then gosub shopvar chair
if %chest = 1 then gosub shopvar chest
if %closet = 1 then gosub shopvar closet
if %cloud = 1 then gosub shopvar cloud
if %coffer = 1 then gosub shopvar coffer
if %container = 1 then gosub shopvar container
if %column = 1 then gosub shopvar column
if %cord = 1 then gosub shopvar cord
if %cornucopia = 1 then gosub shopvar cornucopia
if %corral = 1 then gosub shopvar corral
if %cot = 1 then gosub shopvar cot
if %counter = 1 then gosub shopvar counter
if %cradle = 1 then gosub shopvar cradle
if %crate = 1 then gosub shopvar crate
if %cupboard = 1 then gosub shopvar cupboard
if %cushion = 1 then gosub shopvar cushion
if %curio = 1 then gosub shopvar curio
if %dais = 1 then gosub shopvar dais
if %desk = 1 then gosub shopvar desk
if %display = 1 then gosub shopvar display
if %drawer = 1 then gosub shopvar drawer
if %dresser = 1 then gosub shopvar dresser
if %drum = 1 then gosub shopvar drum
if %dummies = 1 then gosub shopvar dummies
if %dummy = 1 then gosub shopvar dummy
if %easel = 1 then gosub shopvar easel
if %endtable = 1 then gosub shopvar endtable
if %fence = 1 then gosub shopvar fence
if %figure = 1 then gosub shopvar figure
if %firepit = 1 then gosub shopvar firepit
if %footlocker = 1 then gosub shopvar footlocker
if %footrest = 1 then gosub shopvar footrest
if %fountain = 1 then gosub shopvar fountain
if %framework = 1 then gosub shopvar framework
if %garderobe = 1 then gosub shopvar garderobe
if %goblin = 1 then gosub shopvar goblin
if %gourd = 1 then gosub shopvar gourd
if %grinder = 1 then gosub shopvar grinder
if %hand = 1 then gosub shopvar hand
if %hanger = 1 then gosub shopvar hanger
if %hatstand = 1 then gosub shopvar hatstand
if %hay = 1 then gosub shopvar hay
if %head = 1 then gosub shopvar head
if %heap = 1 then gosub shopvar heap
if %highboy = 1 then gosub shopvar highboy
if %hole = 1 then gosub shopvar hole
if %holder = 1 then gosub shopvar holder
if %hook = 1 then gosub shopvar hook
if %hooks = 1 then gosub shopvar hooks
if %horse = 1 then gosub shopvar horse
if %hutch = 1 then gosub shopvar hutch
if %jar = 1 then gosub shopvar jar
if %keg = 1 then gosub shopvar keg
if %lattice = 1 then gosub shopvar lattice
if %locker = 1 then gosub shopvar locker
if %log = 1 then gosub shopvar log
if %lowboy = 1 then gosub shopvar lowboy
if %mannequin = 1 then gosub shopvar mannequin
if %mantel = 1 then gosub shopvar mantel
if %mantle = 1 then gosub shopvar mantle
if %monument = 1 then gosub shopvar monument
if %moon = 1 then gosub shopvar moon
if %net = 1 then gosub shopvar net
if %niche = 1 then gosub shopvar niche
if %ogre = 1 then gosub shopvar ogre
if %pail = 1 then gosub shopvar pail
if %palette = 1 then gosub shopvar palette
if %pallet = 1 then gosub shopvar pallet
if %panel = 1 then gosub shopvar panel
if %peccaries = 1 then gosub shopvar peccaries
if %peccary = 1 then gosub shopvar peccary
if %pedestal = 1 then gosub shopvar pedestal
if %peg = 1 then gosub shopvar peg
if %pegboard = 1 then gosub shopvar pegboard
if %pew = 1 then gosub shopvar pew
if %pillow = 1 then gosub shopvar pillow
if %pile = 1 then gosub shopvar pile
if %pipe = 1 then gosub shopvar pipe
if %pit = 1 then gosub shopvar pit
if %plank = 1 then gosub shopvar plank
if %planter = 1 then gosub shopvar planter
if %platter = 1 then gosub shopvar platter
if %plinth = 1 then gosub shopvar plinth
if %podium = 1 then gosub shopvar podium
if %pole = 1 then gosub shopvar pole
if %post = 1 then gosub shopvar post
if %pumpkin = 1 then gosub shopvar pumpkin
if %quilt = 1 then gosub shopvar quilt
if %rack = 1 then gosub shopvar rack
if %rope = 1 then gosub shopvar rope
if %rug = 1 then gosub shopvar rug
if %salver = 1 then gosub shopvar salver
if %sawhorse = 1 then gosub shopvar sawhorse
if %sculpture = 1 then gosub shopvar sculpture
if %shelf = 1 then gosub shopvar shelf
if %shell = 1 then gosub shopvar shell
if %shelves = 1 then gosub shopvar shelves
if %showcase = 1 then gosub shopvar showcase
if %sidebar = 1 then gosub shopvar sidebar
if %sideboard = 1 then gosub shopvar sideboard
if %skeleton = 1 then gosub shopvar skeleton
if %skippet = 1 then gosub shopvar skippet
if %spittoon = 1 then gosub shopvar spittoon
if %stable = 1 then gosub shopvar stable
if %stand = 1 then gosub shopvar stand
if %star = 1 then gosub shopvar star
if %statue = 1 then gosub shopvar statue
if %stool = 1 then gosub shopvar stool
if %stove = 1 then gosub shopvar stove
if %stump = 1 then gosub shopvar stump
if %sun = 1 then gosub shopvar sun
if %table = 1 then gosub shopvar table
if %tentacle = 1 then gosub shopvar tentacle
if %tomb = 1 then gosub shopvar tomb
if %tray = 1 then gosub shopvar tray
if %tree = 1 then gosub shopvar tree
if %trestle = 1 then gosub shopvar trestle
if %trough = 1 then gosub shopvar trough
if %trunk = 1 then gosub shopvar trunk
if %turtle = 1 then gosub shopvar turtle
if %urn = 1 then gosub shopvar urn
if %valet = 1 then gosub shopvar valet
if %vanities = 1 then gosub shopvar vanities
if %vanity = 1 then gosub shopvar vanity
if %vat = 1 then gosub shopvar vat
if %wall = 1 then gosub shopvar wall
if %wardrobe = 1 then gosub shopvar wardrobe
if %waterwheel = 1 then gosub shopvar waterwheel
if %web = 1 then gosub shopvar web
if %webbing = 1 then gosub shopvar webbing
if %wheelbarrow = 1 then gosub shopvar wheelbarrow
if %workbench = 1 then gosub shopvar workbench
if %worktable = 1 then gosub shopvar worktable
goto end

shopvar:
put #var shopper $0
goto shop1

shop1:
send shop first $shopper
matchre shop2 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop2 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop2:
send shop second $shopper
matchre shop3 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop3 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop3:
send shop third $shopper
matchre shop4 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop4 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop4:
send shop fourth $shopper
matchre shop5 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop5 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop5:
send shop fifth $shopper
matchre shop6 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop6 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop6:
send shop sixth $shopper
matchre shop7 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop7 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop7:
send shop seventh $shopper
matchre shop8 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop8 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop8:
send shop eighth $shopper
matchre shop9 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop9 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop9:
send shop ninth $shopper
matchre shop10 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop10 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop10:
send shop tenth $shopper
matchre shop11 ^\[Type SHOP \[GOOD\] to see some details about
matchre shop11 ^\[Type SHOP \[GOOD\] or click an item to see some details about
matchre return ^I could not find what you were referring to|^You can buy this item if you like
matchwait

shop11:
send shop eleventh $shopper
goto return

return:
return

end:
ECHO *** DONE! 
put #parse SCRIPT DONE
exit