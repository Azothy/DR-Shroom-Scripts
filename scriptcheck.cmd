#### Prime AFK Triggers
var target
var puppetstring ^(?!(?:\w+ (?:(?:\w+? )?says?, "|(?:\w+? )?exclaims?, "|(?:\w+? )?asks?, "|ponders?|whispers?, "|smiles |mutters something into the air about )|\(\b\w+).*$)(?:.*)
action var skillValue $1 when ^.*\:\s*(\d+)\s\d+\.\d+\%.*
action var skillValue $1 when \((\d+)\)
action var string $0;var action answer $1;goto action when %puppetstring(?:(?:(?<!\w)[a][_\W]+[n][_\W]+[s][_\W]+[w][_\W]+[e][_\W]+[r][_\W]+(?!\w)|(?<!\w)[A][_\W]*[n][_\W]*[S][_\W]*[w][_\W]*[E][_\W]*[r][_\W]*(?!\w)|(?<!\w)[a][_\W]*[N][_\W]*[s][_\W]*[W][_\W]*[e][_\W]*[R][_\W]*|[A][_\W]*[N][_\W]*[S][_\W]*[W][_\W]*[E][_\W]*[R](?!\w)[_\W]*)(\b\w+)).*
action var string $0;var action applaud;goto action when %puppetstring(?:(?:(?<!\w)[a][_\W]+[p][_\W]+[p][_\W]+[l][_\W]+[a][_\W]+[u][_\W]+[d](?!\w)|(?<!\w)[A][_\W]*[p][_\W]*[P][_\W]*[l][_\W]*[A][_\W]*[u][_\W]*[D](?!\w)|(?<!\w)[a][_\W]*[P][_\W]*[p][_\W]*[L][_\W]*[a][_\W]*[U][_\W]*[d](?!\w)|(?<!\w)[A][_\W]*[P][_\W]*[P][_\W]*[L][_\W]*[A][_\W]*[U][_\W]*[D](?!\w))).*
action var string $0;var action babble;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[a][_\W]+[b][_\W]+[b][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[B][_\W]*[a][_\W]*[B][_\W]*[b][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[b][_\W]*[A][_\W]*[b][_\W]*[B][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[B][_\W]*[A][_\W]*[B][_\W]*[B][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action bark;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[a][_\W]+[r][_\W]+[k](?!\w)|(?<!\w)[B][_\W]*[a][_\W]*[R][_\W]*[k](?!\w)|(?<!\w)[b][_\W]*[A][_\W]*[r][_\W]*[K](?!\w)|(?<!\w)[B][_\W]*[A][_\W]*[R][_\W]*[K](?!\w))).*
action var string $0;var action bask;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[a][_\W]+[s][_\W]+[k](?!\w)|(?<!\w)[B][_\W]*[a][_\W]*[S][_\W]*[k](?!\w)|(?<!\w)[b][_\W]*[A][_\W]*[s][_\W]*[K](?!\w)|(?<!\w)[B][_\W]*[A][_\W]*[S][_\W]*[K](?!\w))).*
action var string $0;var action bawl;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[a][_\W]+[w][_\W]+[l](?!\w)|(?<!\w)[B][_\W]*[a][_\W]*[W][_\W]*[l](?!\w)|(?<!\w)[b][_\W]*[A][_\W]*[w][_\W]*[L](?!\w)|(?<!\w)[B][_\W]*[A][_\W]*[W][_\W]*[L](?!\w))).*
action var string $0;var action beam;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[e][_\W]+[a][_\W]+[m](?!\w)|(?<!\w)[B][_\W]*[e][_\W]*[A][_\W]*[m](?!\w)|(?<!\w)[b][_\W]*[E][_\W]*[a][_\W]*[M](?!\w)|(?<!\w)[B][_\W]*[E][_\W]*[A][_\W]*[M](?!\w))).*
action var string $0;var action beckon;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[e][_\W]+[c][_\W]+[k][_\W]+[o][_\W]+[n](?!\w)[_\W]+|(?<!\w)[B][_\W]*[e][_\W]*[C][_\W]*[k][_\W]*[O][_\W]*[n](?!\w)[_\W]*|(?<!\w)[b][_\W]*[E][_\W]*[c][_\W]*[K][_\W]*[o][_\W]*[N](?!\w)[_\W]*|(?<!\w)[B][_\W]*[E][_\W]*[C][_\W]*[K][_\W]*[O][_\W]*[N][_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn](?!\w)[_\W]*)?(\b\w+)?).*
action var string $0;var action belch;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[e][_\W]+[l][_\W]+[c][_\W]+[h](?!\w)|(?<!\w)[B][_\W]*[e][_\W]*[L][_\W]*[c][_\W]*[H](?!\w)|(?<!\w)[b][_\W]*[E][_\W]*[l][_\W]*[C][_\W]*[h](?!\w)|(?<!\w)[B][_\W]*[E][_\W]*[L][_\W]*[C][_\W]*[H](?!\w))).*
action var string $0;var action blame;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[l][_\W]+[a][_\W]+[m][_\W]+[e](?!\w)[_\W]+|(?<!\w)[B][_\W]*[l][_\W]*[A][_\W]*[m][_\W]*[E](?!\w)[_\W]*|(?<!\w)[b][_\W]*[L][_\W]*[a][_\W]*[M][_\W]*[e](?!\w)[_\W]*|(?<!\w)[B][_\W]*[L][_\W]*[A][_\W]*[M][_\W]*[E][_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn](?!\w)[_\W]*)?(\b\w+)?).*
action var string $0;var action blink;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[l][_\W]+[i][_\W]+[n][_\W]+[k](?!\w)|(?<!\w)[B][_\W]*[l][_\W]*[I][_\W]*[n][_\W]*[K](?!\w)|(?<!\w)[b][_\W]*[L][_\W]*[i][_\W]*[N][_\W]*[k](?!\w)|(?<!\w)[B][_\W]*[L][_\W]*[I][_\W]*[N][_\W]*[K](?!\w))).*
action var string $0;var action bop;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[o][_\W]+[p](?!\w)[_\W]+|(?<!\w)[B][_\W]*[o][_\W]*[P](?!\w)[_\W]*|(?<!\w)(?<!\w)[b][_\W]*[O][_\W]*[p](?!\w)[_\W]*|(?<!\w)[B][_\W]*[O][_\W]*[P][_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn](?!\w)[_\W]*)?(\b\w+)?).*
action var string $0;var action bounce;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[o][_\W]+[u][_\W]+[n][_\W]+[c][_\W]+[e](?!\w)|(?<!\w)[B][_\W]*[o][_\W]*[U][_\W]*[n][_\W]*[C][_\W]*[e](?!\w)|(?<!\w)[b][_\W]*[O][_\W]*[u][_\W]*[N][_\W]*[c][_\W]*[E](?!\w)|(?<!\w)[B][_\W]*[O][_\W]*[U][_\W]*[N][_\W]*[C][_\W]*[E](?!\w))).*
action var string $0;var action bow;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[o][_\W]+[w](?!\w)|(?<!\w)[B][_\W]*[o][_\W]*[W](?!\w)|(?<!\w)[b][_\W]*[O][_\W]*[w](?!\w)|(?<!\w)[B][_\W]*[O][_\W]*[W](?!\w))).*
action var string $0;var action breathe;goto action when %puppetstring(?:(?:(?<!\w)[b][_\W]+[r][_\W]+[e][_\W]+[a][_\W]+[t][_\W]+[h][_\W]+[e](?!\w)|(?<!\w)[B][_\W]*[r][_\W]*[E][_\W]*[a][_\W]*[T][_\W]*[h][_\W]*[E](?!\w)|(?<!\w)[b][_\W]*[R][_\W]*[e][_\W]*[A][_\W]*[t][_\W]*[H][_\W]*[e](?!\w)|(?<!\w)[B][_\W]*[R][_\W]*[E][_\W]*[A][_\W]*[T][_\W]*[H][_\W]*[E](?!\w))).*
action var string $0;var action cackle;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[a][_\W]+[c][_\W]+[k][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[C][_\W]*[a][_\W]*[C][_\W]*[k][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[c][_\W]*[A][_\W]*[c][_\W]*[K][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[C][_\W]*[A][_\W]*[C][_\W]*[K][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action cheer;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[h][_\W]+[e][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[C][_\W]*[h][_\W]*[E][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[c][_\W]*[H][_\W]*[e][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[C][_\W]*[H][_\W]*[E][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action chirr;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[h][_\W]+[i][_\W]+[r][_\W]+[r](?!\w)|(?<!\w)[C][_\W]*[h][_\W]*[I][_\W]*[r][_\W]*[R](?!\w)|(?<!\w)[c][_\W]*[H][_\W]*[i][_\W]*[R][_\W]*[r](?!\w)|(?<!\w)[C][_\W]*[H][_\W]*[I][_\W]*[R][_\W]*[R](?!\w))).*
action var string $0;var action chortle;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[h][_\W]+[o][_\W]+[r][_\W]+[t][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[C][_\W]*[h][_\W]*[O][_\W]*[r][_\W]*[T][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[c][_\W]*[H][_\W]*[o][_\W]*[R][_\W]*[t][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[C][_\W]*[H][_\W]*[O][_\W]*[R][_\W]*[T][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action chuckle;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[h][_\W]+[u][_\W]+[c][_\W]+[k][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[C][_\W]*[h][_\W]*[U][_\W]*[c][_\W]*[K][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[c][_\W]*[H][_\W]*[u][_\W]*[C][_\W]*[k][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[C][_\W]*[H][_\W]*[U][_\W]*[C][_\W]*[K][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action clap;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[l][_\W]+[a][_\W]+[p](?!\w)|(?<!\w)[C][_\W]*[l][_\W]*[A][_\W]*[p](?!\w)|(?<!\w)[c][_\W]*[L][_\W]*[a][_\W]*[P](?!\w)|(?<!\w)[C][_\W]*[L][_\W]*[A][_\W]*[P](?!\w))).*
action var string $0;var action cough;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[o][_\W]+[u][_\W]+[g][_\W]+[h](?!\w)|(?<!\w)[C][_\W]*[o][_\W]*[U][_\W]*[g][_\W]*[H](?!\w)|(?<!\w)[c][_\W]*[O][_\W]*[u][_\W]*[G][_\W]*[h](?!\w)|(?<!\w)[C][_\W]*[O][_\W]*[U][_\W]*[G][_\W]*[H](?!\w))).*
action var string $0;var action cower;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[o][_\W]+[w][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[C][_\W]*[o][_\W]*[W][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[c][_\W]*[O][_\W]*[w][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[C][_\W]*[O][_\W]*[W][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action cringe;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[r][_\W]+[i][_\W]+[n][_\W]+[g][_\W]+[e](?!\w)|(?<!\w)[C][_\W]*[r][_\W]*[I][_\W]*[n][_\W]*[G][_\W]*[e](?!\w)|(?<!\w)[c][_\W]*[R][_\W]*[i][_\W]*[N][_\W]*[g][_\W]*[E](?!\w)|(?<!\w)[C][_\W]*[R][_\W]*[I][_\W]*[N][_\W]*[G][_\W]*[E](?!\w))).*
action var string $0;var action cry;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[r][_\W]+[y](?!\w)|(?<!\w)[C][_\W]*[r][_\W]*[Y](?!\w)|(?<!\w)[c][_\W]*[R][_\W]*[y](?!\w)|(?<!\w)[C][_\W]*[R][_\W]*[Y](?!\w))).*
action var string $0;var action curse;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[u][_\W]+[r][_\W]+[s][_\W]+[e](?!\w)|(?<!\w)[C][_\W]*[u][_\W]*[R][_\W]*[s][_\W]*[E](?!\w)|(?<!\w)[c][_\W]*[U][_\W]*[r][_\W]*[S][_\W]*[e](?!\w)|(?<!\w)[C][_\W]*[U][_\W]*[R][_\W]*[S][_\W]*[E](?!\w))).*
action var string $0;var action curtsy;goto action when %puppetstring(?:(?:(?<!\w)[c][_\W]+[u][_\W]+[r][_\W]+[t][_\W]+[s][_\W]+[y](?!\w)|(?<!\w)[C][_\W]*[u][_\W]*[R][_\W]*[t][_\W]*[S][_\W]*[y](?!\w)|(?<!\w)[c][_\W]*[U][_\W]*[r][_\W]*[T][_\W]*[s][_\W]*[Y](?!\w)|(?<!\w)[C][_\W]*[U][_\W]*[R][_\W]*[T][_\W]*[S][_\W]*[Y](?!\w))).*
action var string $0;var action dance;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[d][_\W]+[a][_\W]+[n][_\W]+[c][_\W]+[e](?!\w)|(?<!\w)[D][_\W]*[a][_\W]*[N][_\W]*[c][_\W]*[E](?!\w)|(?<!\w)[d][_\W]*[A][_\W]*[n][_\W]*[C][_\W]*[e](?!\w)|(?<!\w)[D][_\W]*[A][_\W]*[N][_\W]*[C][_\W]*[E](?!\w))(?! \()(?:[_\W]*[Ww][Ii][Tt][Hh]|[_\W]*[Aa][Tt])?[_\W]*(?:[_\W]*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|[_\W]*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action dance;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[d][_\W]+[a][_\W]+[n][_\W]+[c][_\W]+[E](?!\w)|(?<!\w)[D][_\W]*[a][_\W]*[N][_\W]*[c][_\W]*[E](?!\w)|(?<!\w)[d][_\W]*[A][_\W]*[n][_\W]*[C][_\W]*[e](?!\w)|(?<!\w)[D][_\W]*[A][_\W]*[N][_\W]*[C][_\W]*[E](?!\w))(?! \()([_\W]*[Gg][_\W]*[Rr][_\W]*[Aa][_\W]*[Cc][_\W]*[Ee][_\W]*[Ff][_\W]*[Uu][_\W]*[Ll]|[_\W]*[Hh][_\W]*[Aa][_\W]*[Pp][_\W]*[Pp][_\W]*[Yy]|[Ss][_\W]*[Ii][_\W]*[Ll][_\W]*[Ll][_\W]*[Yy]|[Aa][_\W]*[Nn][_\W]*[Gg][_\W]*[Rr][_\W]*[Yy])?).*
action var string $0;var action drool;goto action when %puppetstring(?:(?:(?<!\w)[d][_\W]+[r][_\W]+[o][_\W]+[o][_\W]+[l](?!\w)|(?<!\w)[D][_\W]*[r][_\W]*[O][_\W]*[o][_\W]*[L](?!\w)|(?<!\w)[d][_\W]*[R][_\W]*[o][_\W]*[O][_\W]*[l](?!\w)|(?<!\w)[D][_\W]*[R][_\W]*[O][_\W]*[O][_\W]*[L](?!\w))).*
action var string $0;var action duck;goto action when %puppetstring(?:(?:(?<!\w)[d][_\W]+[u][_\W]+[c][_\W]+[k](?!\w)|(?<!\w)[D][_\W]*[u][_\W]*[C][_\W]*[k](?!\w)|(?<!\w)[d][_\W]*[U][_\W]*[c][_\W]*[K](?!\w)|(?<!\w)[D][_\W]*[U][_\W]*[C][_\W]*[K](?!\w))).*
action var string $0;var action exhale;goto action when %puppetstring(?:(?:(?<!\w)[e][_\W]+[x][_\W]+[h][_\W]+[a][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[E][_\W]*[x][_\W]*[H][_\W]*[a][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[e][_\W]*[X][_\W]*[h][_\W]*[A][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[E][_\W]*[X][_\W]*[H][_\W]*[A][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action fidget;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[i][_\W]+[d][_\W]+[g][_\W]+[e][_\W]+[t](?!\w)|(?<!\w)[F][_\W]*[i][_\W]*[D][_\W]*[g][_\W]*[E][_\W]*[t](?!\w)|(?<!\w)[f][_\W]*[I][_\W]*[d][_\W]*[G][_\W]*[e][_\W]*[T](?!\w)|(?<!\w)[F][_\W]*[I][_\W]*[D][_\W]*[G][_\W]*[E][_\W]*[T](?!\w))).*
action var string $0;var action flail;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[l][_\W]+[a][_\W]+[i][_\W]+[l](?!\w)|(?<!\w)[F][_\W]*[l][_\W]*[A][_\W]*[i][_\W]*[L](?!\w)|(?<!\w)[f][_\W]*[L][_\W]*[a][_\W]*[I][_\W]*[l](?!\w)|(?<!\w)[F][_\W]*[L][_\W]*[A][_\W]*[I][_\W]*[L](?!\w))).*
action var string $0;var action flap;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[l][_\W]+[a][_\W]+[p](?!\w)|(?<!\w)[F][_\W]*[l][_\W]*[A][_\W]*[p](?!\w)|(?<!\w)[f][_\W]*[L][_\W]*[a][_\W]*[P](?!\w)|(?<!\w)[F][_\W]*[L][_\W]*[A][_\W]*[P](?!\w))).*
action var string $0;var action flinch;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[l][_\W]+[i][_\W]+[n][_\W]+[c][_\W]+[h](?!\w)|(?<!\w)[F][_\W]*[l][_\W]*[I][_\W]*[n][_\W]*[C][_\W]*[h](?!\w)|(?<!\w)[f][_\W]*[L][_\W]*[i][_\W]*[N][_\W]*[c][_\W]*[H](?!\w)|(?<!\w)[F][_\W]*[L][_\W]*[I][_\W]*[N][_\W]*[C][_\W]*[H](?!\w))).*
action var string $0;var action flirt;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[l][_\W]+[i][_\W]+[r][_\W]+[t](?!\w)|(?<!\w)[F][_\W]*[l][_\W]*[I][_\W]*[r][_\W]*[T](?!\w)|(?<!\w)[f][_\W]*[L][_\W]*[i][_\W]*[R][_\W]*[t](?!\w)|(?<!\w)[F][_\W]*[L][_\W]*[I][_\W]*[R][_\W]*[T](?!\w))).*
action var string $0;var action fluster;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[l][_\W]+[u][_\W]+[s][_\W]+[t][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[F][_\W]*[l][_\W]*[U][_\W]*[s][_\W]*[T][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[f][_\W]*[L][_\W]*[u][_\W]*[S][_\W]*[t][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[F][_\W]*[L][_\W]*[U][_\W]*[S][_\W]*[T][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action fret;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[r][_\W]+[e][_\W]+[t](?!\w)|(?<!\w)[F][_\W]*[r][_\W]*[E][_\W]*[t](?!\w)|(?<!\w)[f][_\W]*[R][_\W]*[e][_\W]*[T](?!\w)|(?<!\w)[F][_\W]*[R][_\W]*[E][_\W]*[T](?!\w))).*
action var string $0;var action frown;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[r][_\W]+[o][_\W]+[w][_\W]+[n](?!\w)|(?<!\w)[F][_\W]*[r][_\W]*[O][_\W]*[w][_\W]*[N](?!\w)|(?<!\w)[f][_\W]*[R][_\W]*[o][_\W]*[W][_\W]*[n](?!\w)|(?<!\w)[F][_\W]*[R][_\W]*[O][_\W]*[W][_\W]*[N](?!\w))).*
action var string $0;var action furrow;goto action when %puppetstring(?:(?:(?<!\w)[f][_\W]+[u][_\W]+[r][_\W]+[r][_\W]+[o][_\W]+[w](?!\w)|(?<!\w)[F][_\W]*[u][_\W]*[R][_\W]*[r][_\W]*[O][_\W]*[w](?!\w)|(?<!\w)[f][_\W]*[U][_\W]*[r][_\W]*[R][_\W]*[o][_\W]*[W](?!\w)|(?<!\w)[F][_\W]*[U][_\W]*[R][_\W]*[R][_\W]*[O][_\W]*[W](?!\w))).*
action var string $0;var action gasp;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[a][_\W]+[s][_\W]+[p](?!\w)|(?<!\w)[G][_\W]*[a][_\W]*[S][_\W]*[p](?!\w)|(?<!\w)[g][_\W]*[A][_\W]*[s][_\W]*[P](?!\w)|(?<!\w)[G][_\W]*[A][_\W]*[S][_\W]*[P](?!\w))).*
action var string $0;var action gawk;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[a][_\W]+[w][_\W]+[k](?!\w)|(?<!\w)[G][_\W]*[a][_\W]*[W][_\W]*[k](?!\w)|(?<!\w)[g][_\W]*[A][_\W]*[w][_\W]*[K](?!\w)|(?<!\w)[G][_\W]*[A][_\W]*[W][_\W]*[K](?!\w))).*
action var string $0;var action giggle;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[i][_\W]+[g][_\W]+[g][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[G][_\W]*[i][_\W]*[G][_\W]*[g][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[g][_\W]*[I][_\W]*[g][_\W]*[G][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[G][_\W]*[I][_\W]*[G][_\W]*[G][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action glare;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[l][_\W]+[a][_\W]+[r][_\W]+[e](?!\w)|(?<!\w)[G][_\W]*[l][_\W]*[A][_\W]*[r][_\W]*[E](?!\w)|(?<!\w)[g][_\W]*[L][_\W]*[a][_\W]*[R][_\W]*[e](?!\w)|(?<!\w)[G][_\W]*[L][_\W]*[A][_\W]*[R][_\W]*[E](?!\w))).*
action var string $0;var action glower;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[l][_\W]+[o][_\W]+[w][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[G][_\W]*[l][_\W]*[O][_\W]*[w][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[g][_\W]*[L][_\W]*[o][_\W]*[W][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[G][_\W]*[L][_\W]*[O][_\W]*[W][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action gnash;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[n][_\W]+[a][_\W]+[s][_\W]+[h](?!\w)|(?<!\w)[G][_\W]*[n][_\W]*[A][_\W]*[s][_\W]*[H](?!\w)|(?<!\w)[g][_\W]*[N][_\W]*[a][_\W]*[S][_\W]*[h](?!\w)|(?<!\w)[G][_\W]*[N][_\W]*[A][_\W]*[S][_\W]*[H](?!\w))).*
action var string $0;var action grieve;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[i][_\W]+[e][_\W]+[v][_\W]+[e](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[I][_\W]*[e][_\W]*[V][_\W]*[e](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[i][_\W]*[E][_\W]*[v][_\W]*[E](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[I][_\W]*[E][_\W]*[V][_\W]*[E](?!\w))).*
action var string $0;var action grimace;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[i][_\W]+[m][_\W]+[a][_\W]+[c][_\W]+[e](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[I][_\W]*[m][_\W]*[A][_\W]*[c][_\W]*[E](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[i][_\W]*[M][_\W]*[a][_\W]*[C][_\W]*[e](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[I][_\W]*[M][_\W]*[A][_\W]*[C][_\W]*[E](?!\w))).*
action var string $0;var action grin;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[i][_\W]+[n](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[I][_\W]*[n](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[i][_\W]*[N](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[I][_\W]*[N](?!\w))).*
action var string $0;var action groan;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[o][_\W]+[a][_\W]+[n](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[O][_\W]*[a][_\W]*[N](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[o][_\W]*[A][_\W]*[n](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[O][_\W]*[A][_\W]*[N](?!\w))).*
action var string $0;var action grovel;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[o][_\W]+[v][_\W]+[e][_\W]+[l](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[O][_\W]*[v][_\W]*[E][_\W]*[l](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[o][_\W]*[V][_\W]*[e][_\W]*[L](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[O][_\W]*[V][_\W]*[E][_\W]*[L](?!\w))).*
action var string $0;var action growl;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[o][_\W]+[w][_\W]+[l](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[O][_\W]*[w][_\W]*[L](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[o][_\W]*[W][_\W]*[l](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[O][_\W]*[W][_\W]*[L](?!\w))).*
action var string $0;var action grumble;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[u][_\W]+[m][_\W]+[b][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[U][_\W]*[m][_\W]*[B][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[u][_\W]*[M][_\W]*[b][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[U][_\W]*[M][_\W]*[B][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action grunt;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[r][_\W]+[u][_\W]+[n][_\W]+[t](?!\w)|(?<!\w)[G][_\W]*[r][_\W]*[U][_\W]*[n][_\W]*[T](?!\w)|(?<!\w)[g][_\W]*[R][_\W]*[u][_\W]*[N][_\W]*[t](?!\w)|(?<!\w)[G][_\W]*[R][_\W]*[U][_\W]*[N][_\W]*[T](?!\w))).*
action var string $0;var action gulp;goto action when %puppetstring(?:(?:(?<!\w)[g][_\W]+[u][_\W]+[l][_\W]+[p](?!\w)|(?<!\w)[G][_\W]*[u][_\W]*[L][_\W]*[p](?!\w)|(?<!\w)[g][_\W]*[U][_\W]*[l][_\W]*[P](?!\w)|(?<!\w)[G][_\W]*[U][_\W]*[L][_\W]*[P](?!\w))).*
action var string $0;var action hiccup;goto action when %puppetstring(?:(?:(?<!\w)[h][_\W]+[i][_\W]+[c][_\W]+[c][_\W]+[u][_\W]+[p](?!\w)|(?<!\w)[H][_\W]*[i][_\W]*[C][_\W]*[c][_\W]*[U][_\W]*[p](?!\w)|(?<!\w)[h][_\W]*[I][_\W]*[c][_\W]*[C][_\W]*[u][_\W]*[P](?!\w)|(?<!\w)[H][_\W]*[I][_\W]*[C][_\W]*[C][_\W]*[U][_\W]*[P](?!\w))).*
action var string $0;var action hiss;goto action when %puppetstring(?:(?:(?<!\w)[h][_\W]+[i][_\W]+[s][_\W]+[s](?!\w)|(?<!\w)[H][_\W]*[i][_\W]*[S][_\W]*[s](?!\w)|(?<!\w)[h][_\W]*[I][_\W]*[s][_\W]*[S](?!\w)|(?<!\w)[H][_\W]*[I][_\W]*[S][_\W]*[S](?!\w))).*
action var string $0;var action hoot;goto action when %puppetstring(?:(?:(?<!\w)[h][_\W]+[o][_\W]+[o][_\W]+[t](?!\w)|(?<!\w)[H][_\W]*[o][_\W]*[O][_\W]*[t](?!\w)|(?<!\w)[h][_\W]*[O][_\W]*[o][_\W]*[T](?!\w)|(?<!\w)[H][_\W]*[O][_\W]*[O][_\W]*[T](?!\w))).*
action var string $0;var action howl;goto action when %puppetstring(?:(?:(?<!\w)[h][_\W]+[o][_\W]+[w][_\W]+[l](?!\w)|(?<!\w)[H][_\W]*[o][_\W]*[W][_\W]*[l](?!\w)|(?<!\w)[h][_\W]*[O][_\W]*[w][_\W]*[L](?!\w)|(?<!\w)[H][_\W]*[O][_\W]*[W][_\W]*[L](?!\w))).*
action var string $0;var action hug;var target $1;goto action when %puppetstring(?!Usage: )(?:(?:(?<!\w)[h][_\W]+[u][_\W]+[g](?!\w)|(?<!\w)[H][_\W]*[u][_\W]*[G](?!\w)|(?<!\w)[h][_\W]*[U][_\W]*[g](?!\w)|(?<!\w)[H][_\W]*[U][_\W]*[G](?!\w))[_\W]*(?!\[)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action hum;goto action when %puppetstring(?:(?:(?<!\w)[h][_\W]+[u][_\W]+[m](?!\w)|(?<!\w)[H][_\W]*[u][_\W]*[M](?!\w)|(?<!\w)[h][_\W]*[U][_\W]*[m](?!\w)|(?<!\w)[H][_\W]*[U][_\W]*[M](?!\w))).*
action var string $0;var action ignore;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[i][_\W]+[g][_\W]+[n][_\W]+[o][_\W]+[r][_\W]+[e](?!\w)[_\W]+|(?<!\w)[I][_\W]*[g][_\W]*[N][_\W]*[o][_\W]*[R][_\W]*[e](?!\w)[_\W]*|(?<!\w)[i][_\W]*[G][_\W]*[n][_\W]*[O][_\W]*[r][_\W]*[E](?!\w)[_\W]*|(?<!\w)[I][_\W]*[G][_\W]*[N][_\W]*[O][_\W]*[R][_\W]*[E](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)?).*
action var string $0;var action inhale;goto action when %puppetstring(?:(?:(?<!\w)[i][_\W]+[n][_\W]+[h][_\W]+[a][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[I][_\W]*[n][_\W]*[H][_\W]*[a][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[i][_\W]*[N][_\W]*[h][_\W]*[A][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[I][_\W]*[N][_\W]*[H][_\W]*[A][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action jump;goto action when %puppetstring(?:(?:(?<!\w)[j][_\W]+[u][_\W]+[m][_\W]+[p](?!\w)|(?<!\w)[J][_\W]*[u][_\W]*[M][_\W]*[p](?!\w)|(?<!\w)[j][_\W]*[U][_\W]*[m][_\W]*[P](?!\w)|(?<!\w)[J][_\W]*[U][_\W]*[M][_\W]*[P](?!\w))).*
action var string $0;var action laugh;goto action when %puppetstring(?:(?:(?<!\w)[l][_\W]+[a][_\W]+[u][_\W]+[g][_\W]+[h](?!\w)|(?<!\w)[L][_\W]*[a][_\W]*[U][_\W]*[g][_\W]*[H](?!\w)|(?<!\w)[l][_\W]*[A][_\W]*[u][_\W]*[G][_\W]*[h](?!\w)|(?<!\w)[L][_\W]*[A][_\W]*[U][_\W]*[G][_\W]*[H](?!\w))).*
action var string $0;var action lean;goto action when %puppetstring(?:(?:(?<!\w)[l][_\W]+[e][_\W]+[a][_\W]+[n](?!\w)|(?<!\w)[L][_\W]*[e][_\W]*[A][_\W]*[n](?!\w)|(?<!\w)[l][_\W]*[E][_\W]*[a][_\W]*[N](?!\w)|(?<!\w)[L][_\W]*[E][_\W]*[A][_\W]*[N](?!\w))).*
action var string $0;var action leap;goto action when %puppetstring(?:(?:(?<!\w)[l][_\W]+[e][_\W]+[a][_\W]+[p](?!\w)|(?<!\w)[L][_\W]*[e][_\W]*[A][_\W]*[p](?!\w)|(?<!\w)[l][_\W]*[E][_\W]*[a][_\W]*[P](?!\w)|(?<!\w)[L][_\W]*[E][_\W]*[A][_\W]*[P](?!\w))).*
action var string $0;var action mark;goto action when %puppetstring(?:(?:(?<!\w)[m][_\W]+[a][_\W]+[r][_\W]+[k](?!\w)|(?<!\w)[M][_\W]*[a][_\W]*[R][_\W]*[k](?!\w)|(?<!\w)[m][_\W]*[A][_\W]*[r][_\W]*[K](?!\w)|(?<!\w)[M][_\W]*[A][_\W]*[R][_\W]*[K](?!\w))).*
action var string $0;var action meow;goto action when %puppetstring(?:(?:(?<!\w)[m][_\W]+[e][_\W]+[o][_\W]+[w](?!\w)|(?<!\w)[M][_\W]*[e][_\W]*[O][_\W]*[w](?!\w)|(?<!\w)[m][_\W]*[E][_\W]*[o][_\W]*[W](?!\w)|(?<!\w)[M][_\W]*[E][_\W]*[O][_\W]*[W](?!\w))).*
action var string $0;var action mumble;goto action when %puppetstring(?:(?:(?<!\w)[m][_\W]+[u][_\W]+[m][_\W]+[b][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[M][_\W]*[u][_\W]*[M][_\W]*[b][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[m][_\W]*[U][_\W]*[m][_\W]*[B][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[M][_\W]*[U][_\W]*[M][_\W]*[B][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action mutter;goto action when %puppetstring(?:(?:(?<!\w)[m][_\W]+[u][_\W]+[t][_\W]+[t][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[M][_\W]*[u][_\W]*[T][_\W]*[t][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[m][_\W]*[U][_\W]*[t][_\W]*[T][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[M][_\W]*[U][_\W]*[T][_\W]*[T][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action nag;goto action when %puppetstring(?:(?:(?<!\w)[n][_\W]+[a][_\W]+[g](?!\w)|(?<!\w)[N][_\W]*[a][_\W]*[G](?!\w)|(?<!\w)[n][_\W]*[A][_\W]*[g](?!\w)|(?<!\w)[N][_\W]*[A][_\W]*[G](?!\w))).*
action var string $0;var action nod;goto action when %puppetstring(?:(?:(?<!\w)[n][_\W]+[o][_\W]+[d](?!\w)|(?<!\w)[N][_\W]*[o][_\W]*[D](?!\w)|(?<!\w)[n][_\W]*[O][_\W]*[d](?!\w)|(?<!\w)[N][_\W]*[O][_\W]*[D](?!\w))).*
action var string $0;var action point;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[o][_\W]+[i][_\W]+[n][_\W]+[t](?!\w)[_\W]+|(?<!\w)[P][_\W]*[o][_\W]*[I][_\W]*[n][_\W]*[T](?!\w)[_\W]*|(?<!\w)[p][_\W]*[O][_\W]*[i][_\W]*[N][_\W]*[t](?!\w)(?!\w)[_\W]*|(?<!\w)[P][_\W]*[O][_\W]*[I][_\W]*[N][_\W]*[T][_\W]*)(?:.*[Ww][_\W]*[Aa][_\W]*[Yy][_\W]*|.*[Aa][_\W]*[Tt][_\W]*)?(\b\w+)?).*
action var string $0;var action pace;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[a][_\W]+[c][_\W]+[e](?!\w)|(?<!\w)[P][_\W]*[a][_\W]*[C][_\W]*[e](?!\w)|(?<!\w)[p][_\W]*[A][_\W]*[c][_\W]*[E](?!\w)|(?<!\w)[P][_\W]*[A][_\W]*[C][_\W]*[E](?!\w))).*
action var string $0;var action pat;var target $1;goto action when %puppetstring(?:((?<!\w)[p][_\W]+[a][_\W]+[t](?!\w)[_\W]+|(?<!\w)[P][_\W]*[a][_\W]*[T](?!\w)[_\W]*|(?<!\w)[p][_\W]*[A][_\W]*[t](?!\w)[_\W]*|(?<!\w)[P][_\W]*[A][_\W]*[T](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action pinch;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[i][_\W]+[n][_\W]+[c][_\W]+[h](?!\w)[_\W]+|(?<!\w)[P][_\W]*[i][_\W]*[N][_\W]*[c][_\W]*[H](?!\w)[_\W]*|(?<!\w)[p][_\W]*[I][_\W]*[n][_\W]*[C][_\W]*[h](?!\w)[_\W]*|(?<!\w)[P][_\W]*[I][_\W]*[N][_\W]*[C][_\W]*[H](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)?).*
action var string $0;var action ponder;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[o][_\W]+[n][_\W]+[d][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[P][_\W]*[o][_\W]*[N][_\W]*[d][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[p][_\W]*[O][_\W]*[n][_\W]*[D][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[P][_\W]*[O][_\W]*[N][_\W]*[D][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action pose;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[o][_\W]+[s][_\W]+[e](?!\w)|(?<!\w)[P][_\W]*[o][_\W]*[S][_\W]*[e](?!\w)|(?<!\w)[p][_\W]*[O][_\W]*[s][_\W]*[E](?!\w)|(?<!\w)[P][_\W]*[O][_\W]*[S][_\W]*[E](?!\w))).*
action var string $0;var action pout;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[o][_\W]+[u][_\W]+[t](?!\w)|(?<!\w)[P][_\W]*[o][_\W]*[U][_\W]*[t](?!\w)|(?<!\w)[p][_\W]*[O][_\W]*[u][_\W]*[T](?!\w)|(?<!\w)[P][_\W]*[O][_\W]*[U][_\W]*[T](?!\w))).*
action var string $0;var action preen;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[r][_\W]+[e][_\W]+[e][_\W]+[n](?!\w)|(?<!\w)[P][_\W]*[r][_\W]*[E][_\W]*[e][_\W]*[N](?!\w)|(?<!\w)[p][_\W]*[R][_\W]*[e][_\W]*[E][_\W]*[n](?!\w)|(?<!\w)[P][_\W]*[R][_\W]*[E][_\W]*[E][_\W]*[N](?!\w))).*
action var string $0;var action pucker;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[u][_\W]+[c][_\W]+[k][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[P][_\W]*[u][_\W]*[C][_\W]*[k][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[p][_\W]*[U][_\W]*[c][_\W]*[K][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[P][_\W]*[U][_\W]*[C][_\W]*[K][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action pull;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[u][_\W]+[l][_\W]+[l](?!\w)[_\W]+|(?<!\w)[P][_\W]*[u][_\W]*[L][_\W]*[l](?!\w)[_\W]*|(?<!\w)[p][_\W]*[U][_\W]*[l][_\W]*[L](?!\w)[_\W]*|(?<!\w)[P][_\W]*[U][_\W]*[L][_\W]*[L](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action purr;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[u][_\W]+[r][_\W]+[r](?!\w)|(?<!\w)[P][_\W]*[u][_\W]*[R][_\W]*[r](?!\w)|(?<!\w)[p][_\W]*[U][_\W]*[r][_\W]*[R](?!\w)|(?<!\w)[P][_\W]*[U][_\W]*[R][_\W]*[R](?!\w))).*
action var string $0;var action push;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[p][_\W]+[u][_\W]+[s][_\W]+[h](?!\w)[_\W]+|(?<!\w)[P][_\W]*[u][_\W]*[S][_\W]*[h](?!\w)[_\W]*|(?<!\w)[p][_\W]*[U][_\W]*[s][_\W]*[H](?!\w)[_\W]*|(?<!\w)[P][_\W]*[U][_\W]*[S][_\W]*[H](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action raise;var target $1;goto action when %puppetstring(?!Usage: )[R][_\W]*[A][_\W]*[I][_\W]*[S][_\W]*[E][_\W]*(?!(?:EYEBROW |VOICE )?[_\W]*\[)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(.*[Hh][_\W]*[Aa][_\W]*[Nn][_\W]*[Dd]|.*[Ee][_\W]*[Yy][_\W]*[Ee][_\W]*[Bb][_\W]*[Rr][_\W]*[Oo][_\W]*[Ww]|.*[Vv][_\W]*[Oo][_\W]*[Ii][_\W]*[Cc][_\W]*[Ee]).*
action var string $0;var action raspberry;goto action when %puppetstring(?:(?:(?<!\w)[r][_\W]+[a][_\W]+[s][_\W]+[p][_\W]+[b][_\W]+[e][_\W]+[r][_\W]+[r][_\W]+[y](?!\w)|(?<!\w)[R][_\W]*[a][_\W]*[S][_\W]*[p][_\W]*[B][_\W]*[e][_\W]*[R][_\W]*[r][_\W]*[Y](?!\w)|(?<!\w)[r][_\W]*[A][_\W]*[s][_\W]*[P][_\W]*[b][_\W]*[E][_\W]*[r][_\W]*[R][_\W]*[y](?!\w)|(?<!\w)[R][_\W]*[A][_\W]*[S][_\W]*[P][_\W]*[B][_\W]*[E][_\W]*[R][_\W]*[R][_\W]*[Y](?!\w))).*
action var string $0;var action rub;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[r][_\W]+[u][_\W]+[b](?!\w)[_\W]+|(?<!\w)[R][_\W]*[u][_\W]*[B](?!\w)[_\W]*|(?<!\w)[r][_\W]*[U][_\W]*[b](?!\w)[_\W]*|(?<!\w)[R][_\W]*[U][_\W]*[B](?!\w)[_\W]*)(?!\()(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)).*
action var string $0;var action salute;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[a][_\W]+[l][_\W]+[u][_\W]+[t][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[a][_\W]*[L][_\W]*[u][_\W]*[T][_\W]*[e](?!\w)|(?<!\w)[s][_\W]*[A][_\W]*[l][_\W]*[U][_\W]*[t][_\W]*[E](?!\w)|(?<!\w)[S][_\W]*[A][_\W]*[L][_\W]*[U][_\W]*[T][_\W]*[E](?!\w))).*
action var string $0;var action scoff;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[c][_\W]+[o][_\W]+[f][_\W]+[f](?!\w)|(?<!\w)[S][_\W]*[c][_\W]*[O][_\W]*[f][_\W]*[F](?!\w)|(?<!\w)[s][_\W]*[C][_\W]*[o][_\W]*[F][_\W]*[f](?!\w)|(?<!\w)[S][_\W]*[C][_\W]*[O][_\W]*[F][_\W]*[F](?!\w))).*
action var string $0;var action scratch $charactername;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[c][_\W]+[r][_\W]+[a][_\W]+[t][_\W]+[c][_\W]+[h](?!\w)|(?<!\w)i[_\W]+t[_\W]+c[_\W]+h(?!\w)|(?<!\w)[S][_\W]*[c][_\W]*[R][_\W]*[a][_\W]*[T][_\W]*[c][_\W]*[H](?!\w)|(?<!\w)I[_\W]*t[_\W]*C[_\W]*h(?!\w)|(?<!\w)[s][_\W]*[C][_\W]*[r][_\W]*[A][_\W]*[t][_\W]*[C][_\W]*[h](?!\w)|(?<!\w)i[_\W]*T[_\W]*c[_\W]*H(?!\w)|(?<!\w)[S][_\W]*[C][_\W]*[R][_\W]*[A][_\W]*[T][_\W]*[C][_\W]*[H](?!\w)|(?<!\w)I[_\W]*T[_\W]*C[_\W]*H(?!\w))).*
action var string $0;var action shake;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[h][_\W]+[a][_\W]+[k][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[h][_\W]*[A][_\W]*[k][_\W]*[E](?!\w)|(?<!\w)[s][_\W]*[H][_\W]*[a][_\W]*[K][_\W]*[e](?!\w)|(?<!\w)[S][_\W]*[H][_\W]*[A][_\W]*[K][_\W]*[E](?!\w))).*
action var string $0;var action shiver;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[h][_\W]+[i][_\W]+[v][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[S][_\W]*[h][_\W]*[I][_\W]*[v][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[s][_\W]*[H][_\W]*[i][_\W]*[V][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[S][_\W]*[H][_\W]*[I][_\W]*[V][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action scream;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[c][_\W]+[r][_\W]+[e][_\W]+[a][_\W]+[m](?!\w)|(?<!\w)[S][_\W]*[c][_\W]*[R][_\W]*[e][_\W]*[A][_\W]*[m](?!\w)|(?<!\w)[s][_\W]*[C][_\W]*[r][_\W]*[E][_\W]*[a][_\W]*[M](?!\w)|(?<!\w)[S][_\W]*[C][_\W]*[R][_\W]*[E][_\W]*[A][_\W]*[M](?!\w))).*
action var string $0;var action shun;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[h][_\W]+[u][_\W]+[n](?!\w)[_\W]+|(?<!\w)[S][_\W]*[h][_\W]*[U][_\W]*[n](?!\w)[_\W]*|(?<!\w)[s][_\W]*[H][_\W]*[u][_\W]*[N](?!\w)[_\W]*|(?<!\w)[S][_\W]*[H][_\W]*[U][_\W]*[N](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)?).*
action var string $0;var action shriek;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[h][_\W]+[r][_\W]+[i][_\W]+[e][_\W]+[k](?!\w)|(?<!\w)[S][_\W]*[h][_\W]*[R][_\W]*[i][_\W]*[E][_\W]*[k](?!\w)|(?<!\w)[s][_\W]*[H][_\W]*[r][_\W]*[I][_\W]*[e][_\W]*[K](?!\w)|(?<!\w)[S][_\W]*[H][_\W]*[R][_\W]*[I][_\W]*[E][_\W]*[K](?!\w))).*
action var string $0;var action sigh;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[i][_\W]+[g][_\W]+[h](?!\w)|(?<!\w)[S][_\W]*[i][_\W]*[G][_\W]*[h](?!\w)|(?<!\w)[s][_\W]*[I][_\W]*[g][_\W]*[H](?!\w)|(?<!\w)[S][_\W]*[I][_\W]*[G][_\W]*[H](?!\w))).*
action var string $0;var action slap;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[l][_\W]+[a][_\W]+[p](?!\w)[_\W]+|(?<!\w)[S][_\W]*[l][_\W]*[A][_\W]*[p](?!\w)[_\W]*|(?<!\w)[s][_\W]*[L][_\W]*[a][_\W]*[P](?!\w)[_\W]*|(?<!\w)[S][_\W]*[L][_\W]*[A][_\W]*[P](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)?).*
action var string $0;var action slink;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[l][_\W]+[i][_\W]+[n][_\W]+[k](?!\w)|(?<!\w)[S][_\W]*[l][_\W]*[I][_\W]*[n][_\W]*[K](?!\w)|(?<!\w)[S][_\W]*[l][_\W]*[I][_\W]*[n][_\W]*[K](?!\w)|(?<!\w)[S][_\W]*[L][_\W]*[I][_\W]*[N][_\W]*[K](?!\w))).*
action var string $0;var action smile;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[m][_\W]+[i][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[m][_\W]*[I][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[s][_\W]*[M][_\W]*[i][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[S][_\W]*[M][_\W]*[I][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action smirk;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[m][_\W]+[i][_\W]+[r][_\W]+[k](?!\w)|(?<!\w)[S][_\W]*[m][_\W]*[I][_\W]*[r][_\W]*[K](?!\w)|(?<!\w)[s][_\W]*[M][_\W]*[i][_\W]*[R][_\W]*[k](?!\w)|(?<!\w)[S][_\W]*[M][_\W]*[I][_\W]*[R][_\W]*[K](?!\w))).*
action var string $0;var action snap;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[a][_\W]+[p](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[A][_\W]*[p](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[a][_\W]*[P](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[A][_\W]*[P](?!\w))).*
action var string $0;var action snarl;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[a][_\W]+[r][_\W]+[l](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[A][_\W]*[r][_\W]*[L](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[a][_\W]*[R][_\W]*[l](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[A][_\W]*[R][_\W]*[L](?!\w))).*
action var string $0;var action sneer;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[e][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[E][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[e][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[E][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action sneeze;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[e][_\W]+[e][_\W]+[z][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[E][_\W]*[e][_\W]*[Z][_\W]*[e](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[e][_\W]*[E][_\W]*[z][_\W]*[E](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[E][_\W]*[E][_\W]*[Z][_\W]*[E](?!\w))).*
action var string $0;var action snicker;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[i][_\W]+[c][_\W]+[k][_\W]+[e][_\W]+[r](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[I][_\W]*[c][_\W]*[K][_\W]*[e][_\W]*[R](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[i][_\W]*[C][_\W]*[k][_\W]*[E][_\W]*[r](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[I][_\W]*[C][_\W]*[K][_\W]*[E][_\W]*[R](?!\w))).*
action var string $0;var action sniffle;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[n][_\W]+[i][_\W]+[f][_\W]+[f][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[n][_\W]*[I][_\W]*[f][_\W]*[F][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[s][_\W]*[N][_\W]*[i][_\W]*[F][_\W]*[f][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[S][_\W]*[N][_\W]*[I][_\W]*[F][_\W]*[F][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action sob;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[o][_\W]+[b](?!\w)|(?<!\w)[S][_\W]*[o][_\W]*[B](?!\w)|(?<!\w)[s][_\W]*[O][_\W]*[b](?!\w)|(?<!\w)[S][_\W]*[O][_\W]*[B](?!\w))).*
action var string $0;var action squint;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[q][_\W]+[u][_\W]+[i][_\W]+[n][_\W]+[t](?!\w)|(?<!\w)[S][_\W]*[q][_\W]*[U][_\W]*[i][_\W]*[N][_\W]*[t](?!\w)|(?<!\w)[s][_\W]*[Q][_\W]*[u][_\W]*[I][_\W]*[n][_\W]*[T](?!\w)|(?<!\w)[S][_\W]*[Q][_\W]*[U][_\W]*[I][_\W]*[N][_\W]*[T](?!\w))).*
action var string $0;var action squirm;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[q][_\W]+[u][_\W]+[i][_\W]+[r][_\W]+[m](?!\w)|(?<!\w)[S][_\W]*[q][_\W]*[U][_\W]*[i][_\W]*[R][_\W]*[m](?!\w)|(?<!\w)[s][_\W]*[Q][_\W]*[u][_\W]*[I][_\W]*[r][_\W]*[M](?!\w)|(?<!\w)[S][_\W]*[Q][_\W]*[U][_\W]*[I][_\W]*[R][_\W]*[M](?!\w))).*
action var string $0;var action stare;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[t][_\W]+[a][_\W]+[r][_\W]+[e](?!\w)|(?<!\w)[S][_\W]*[t][_\W]*[A][_\W]*[r][_\W]*[E](?!\w)|(?<!\w)[s][_\W]*[T][_\W]*[a][_\W]*[R][_\W]*[e](?!\w)|(?<!\w)[S][_\W]*[T][_\W]*[A][_\W]*[R][_\W]*[E](?!\w))).*
action var string $0;var action stretch;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[t][_\W]+[r][_\W]+[e][_\W]+[t][_\W]+[c][_\W]+[h](?!\w)|(?<!\w)[S][_\W]*[t][_\W]*[R][_\W]*[e][_\W]*[T][_\W]*[c][_\W]*[H](?!\w)|(?<!\w)[s][_\W]*[T][_\W]*[r][_\W]*[E][_\W]*[t][_\W]*[C][_\W]*[h](?!\w)|(?<!\w)[S][_\W]*[T][_\W]*[R][_\W]*[E][_\W]*[T][_\W]*[C][_\W]*[H](?!\w))).*
action var string $0;var action sulk;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[u][_\W]+[l][_\W]+[k](?!\w)|(?<!\w)[S][_\W]*[u][_\W]*[L][_\W]*[k](?!\w)|(?<!\w)[s][_\W]*[U][_\W]*[l][_\W]*[K](?!\w)|(?<!\w)[S][_\W]*[U][_\W]*[L][_\W]*[K](?!\w))).*
action var string $0;var action swear;goto action when %puppetstring(?:(?:(?<!\w)[s][_\W]+[w][_\W]+[e][_\W]+[a][_\W]+[r](?!\w)|(?<!\w)[S][_\W]*[w][_\W]*[E][_\W]*[a][_\W]*[R](?!\w)|(?<!\w)[s][_\W]*[W][_\W]*[e][_\W]*[A][_\W]*[r](?!\w)|(?<!\w)[S][_\W]*[W][_\W]*[E][_\W]*[A][_\W]*[R](?!\w))).*
action var string $0;var action tap;var target $1;goto action when %puppetstring(?:(?:(?<!\w)[t][_\W]+[a][_\W]+[p](?!\w)[_\W]+|(?<!\w)[T][_\W]*[a][_\W]*[P](?!\w)[_\W]*|(?<!\w)[t][_\W]*[A][_\W]*[p](?!\w)[_\W]*|(?<!\w)[T][_\W]*[A][_\W]*[P](?!\w)[_\W]*)(?:.*[Tt][_\W]*[Hh][_\W]*[Ee][_\W]*|.*[Aa][_\W]*|[Mm][_\W]*[Yy][_\W]*|.*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*|.*[Aa][_\W]*[Nn][_\W]*)?(\b\w+)?).*
action var string $0;var action wail;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[a][_\W]+[i][_\W]+[l](?!\w)|(?<!\w)[W][_\W]*[a][_\W]*[I][_\W]*[l](?!\w)|(?<!\w)[w][_\W]*[A][_\W]*[i][_\W]*[L](?!\w)|(?<!\w)[W][_\W]*[A][_\W]*[I][_\W]*[L](?!\w))).*
action var string $0;var action wait;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[a][_\W]+[i][_\W]+[t](?!\w)|(?<!\w)[W][_\W]*[a][_\W]*[I][_\W]*[t](?!\w)|(?<!\w)[w][_\W]*[A][_\W]*[i][_\W]*[T](?!\w)|(?<!\w)[W][_\W]*[A][_\W]*[I][_\W]*[T](?!\w))).*
action var string $0;var action wake;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[a][_\W]+[k][_\W]+[e](?!\w)|(?<!\w)[W][_\W]*[a][_\W]*[K][_\W]*[e](?!\w)|(?<!\w)[w][_\W]*[A][_\W]*[k][_\W]*[E](?!\w)|(?<!\w)[W][_\W]*[A][_\W]*[K][_\W]*[E](?!\w))).*
action var string $0;var action wave;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[a][_\W]+[v][_\W]+[e](?!\w)|(?<!\w)[W][_\W]*[a][_\W]*[V][_\W]*[e](?!\w)|(?<!\w)[w][_\W]*[A][_\W]*[v][_\W]*[E](?!\w)|(?<!\w)[W][_\W]*[A][_\W]*[V][_\W]*[E](?!\w))).*
action var string $0;var action wail;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[a][_\W]+[i][_\W]+[l](?!\w)|(?<!\w)[W][_\W]*[a][_\W]*[I][_\W]*[l](?!\w)|(?<!\w)[w][_\W]*[A][_\W]*[i][_\W]*[L](?!\w)|(?<!\w)[W][_\W]*[A][_\W]*[I][_\W]*[L](?!\w))).*
action var string $0;var action weep;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[e][_\W]+[e][_\W]+[p](?!\w)|(?<!\w)[W][_\W]*[e][_\W]*[E][_\W]*[p](?!\w)|(?<!\w)[w][_\W]*[E][_\W]*[e][_\W]*[P](?!\w)|(?<!\w)[W][_\W]*[E][_\W]*[E][_\W]*[P](?!\w))).*
action var string $0;var action whine;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[h][_\W]+[i][_\W]+[n][_\W]+[e](?!\w)|(?<!\w)[W][_\W]*[h][_\W]*[I][_\W]*[n][_\W]*[E](?!\w)|(?<!\w)[w][_\W]*[H][_\W]*[i][_\W]*[N][_\W]*[e](?!\w)|(?<!\w)[W][_\W]*[H][_\W]*[I][_\W]*[N][_\W]*[E](?!\w))).*
action var string $0;var action whistle;goto action when %puppetstring(?:(?:(?<!\w)[w][_\W]+[h][_\W]+[i][_\W]+[s][_\W]+[t][_\W]+[l][_\W]+[e](?!\w)|(?<!\w)[W][_\W]*[h][_\W]*[I][_\W]*[s][_\W]*[T][_\W]*[l][_\W]*[E](?!\w)|(?<!\w)[w][_\W]*[H][_\W]*[i][_\W]*[S][_\W]*[t][_\W]*[L][_\W]*[e](?!\w)|(?<!\w)[W][_\W]*[H][_\W]*[I][_\W]*[S][_\W]*[T][_\W]*[L][_\W]*[E](?!\w))).*
action var string $0;var action yawn;goto action when %puppetstring(?:(?:(?<!\w)[y][_\W]+[a][_\W]+[w][_\W]+[n](?!\w)|(?<!\w)[Y][_\W]*[a][_\W]*[W][_\W]*[n](?!\w)|(?<!\w)[y][_\W]*[A][_\W]*[w][_\W]*[N](?!\w)|(?<!\w)[Y][_\W]*[A][_\W]*[W][_\W]*[N](?!\w))).*

action var string $0;var action skill $1;goto action when %puppetstring(?:(?:(?<!\w)[T][_\W]*[E][_\W]*[L][_\W]*[L][_\W]*[M][_\W]*[E][_\W]*[Y][_\W]*[O][_\W]*[U][_\W]*[R]|S[_\W]*A[_\W]*Y|[S][_\W]*[P][_\W]*[E][_\W]*[A][_\W]*[K]|W[_\W]*H[_\W]*A[_\W]*T[_\W]*I[_\W]*S|[W][_\W]*[H][_\W]*[A][_\W]*[T][_\W]*[S]|T[_\W]*E[_\W]*L[_\W]*L[_\W]*M[_\W]*E)[_\W]*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*(.+)[_\W]*[Ss][_\W]*[Kk][_\W]*[Ii][_\W]*[Ll][_\W]*[Ll]).*
action var string $0;var action say $charactername;goto action when %puppetstring(?:(?:(?<!\w)[T][_\W]*[E][_\W]*[L][_\W]*[L][_\W]*[M][_\W]*[E][_\W]*[Y][_\W]*[O][_\W]*[U][_\W]*[R]|S[_\W]*A[_\W]*Y|[S][_\W]*[P][_\W]*[E][_\W]*[A][_\W]*[K]|W[_\W]*H[_\W]*A[_\W]*T[_\W]*I[_\W]*S|[W][_\W]*[H][_\W]*[A][_\W]*[T][_\W]*[S]|T[_\W]*E[_\W]*L[_\W]*L[_\W]*M[_\W]*E)[_\W]*[Yy][_\W]*[Oo][_\W]*[Uu][_\W]*[Rr][_\W]*[Nn][_\W]*[Aa][_\W]*[Mm][_\W]*[Ee]).*

action var string $0;var action $1;goto action when say your (\S+) stat
action var string $0;var action $1;goto action when SAY YOUR (.+) STAT
action var string $0;var action $1;goto action when SPEAK YOUR (\S+) STAT
action var string $0;var action $1;goto action when SPEAK YOUR (.+) STAT
action var string $0;var action $1;goto action when WHAT IS YOUR (\S+) STAT
action var string $0;var action $1;goto action when what is your (\S+) stat
action var string $0;var action $1;goto action when what's your (\S+) stat
action var string $0;var action $1;goto action when WHAT IS YOUR (.+) STAT
action var string $0;var action $1;goto action when WHAT'S YOUR (\S+) STAT
action var string $0;var action $1;goto action when WHAT'S YOUR (.+) STAT
action var string $0;var action $1;goto action when say your (.+) stat
action var string $0;var action $1;goto action when SAY YOUR (.+) STAT
action var string $0;var action $1;goto action when speak your (.+) stat
action var string $0;var action $1;goto action when TELL ME YOUR (.+) STAT
action var string $0;var action $1;goto action when tell me your (.+) stat
wait:
pause 3600
goto wait

action:
eval target replacere("%target", "[\W_]", "")
eval target tolower("%target")
put #echo
put #echo *** WARNING!!! WARNING!!! WARNING!!!! ***
put #echo *** GETTING SCRIPT CHECKED!!! ALERT!!! ***
put #echo
put #play PowerfulEnemy.wav
put #echo >Log Crimson ************************************************************
put #echo >Log Crimson *** RED ALERT!!! WARNING! WARNING!
put #echo >Log Gold *** AFK SCRIPT CHECK IN PROGRESS!!!!
put #echo >Log Gold *** ENTERING DEFCON 5 - ATTEMPTING TO AUTOMATE
put #echo >Log Gold *** Action: %action %target - Trigger: %string
put #script pause all;-1#script resume scriptcheck
wait
pause 2
var skillValue None
send 2 %action %target
put #echo Action: %action %target Trigger: %string
matchre expcheck Time Development Points
matchwait 10
expcheck:
put #log >scriptcheck.txt [$datetime] Script check! Did: %action %target Trigger: %string
if ("%skillValue"!="None") then put say %skillValue
put #script resume all
if ("%skillValue" !="None") then put #echo >Log Gold *** Action taken: Said- %skillValue
if ("%skillValue" ="None") then put #echo >Log Gold *** Action taken: %action
put #echo >Log Crimson ************************************************************
#goto wait
goto AFK.WAIT


AFK.WAIT:
pause 7
random 1 20
goto AFK.%r
AFK.1: 
pause 2
put 'funny..
goto AFK.Pause
AFK.2:
pause 2
put 'anything else?
goto AFK.Pause
AFK.3:
pause
put ponder
goto AFK.Pause
AFK.4:
pause 4
put 'you disturb my meditation 
goto AFK.Pause
AFK.5:
pause
put 'ello
goto AFK.Pause
AFK.6:
pause
put 'What are you doing?
goto AFK.Pause
AFK.7:
pause
put 'ok..
goto AFK.Pause
AFK.8:
pause
put 'go away
goto AFK.Pause
AFK.9:
pause
put 'leave me be
goto AFK.Pause
AFK.10:
pause
put 'mhmm
goto AFK.Pause
AFK.11:
pause
put 'shoo!
goto AFK.Pause
AFK.12:
pause
put glare
goto AFK.Pause
AFK.13:
pause
put hiss
goto AFK.Pause
AFK.14:
pause
put snort
goto AFK.Pause
AFK.15:
pause
put chortle
goto AFK.Pause
AFK.16:
pause
put cough
goto AFK.Pause
AFK.17:
pause
put blink
goto AFK.Pause
AFK.18:
pause
put mutter
goto AFK.Pause
AFK.19:
pause
put yawn
goto AFK.Pause
AFK.20:
pause
put 'go home
goto AFK.Pause
AFK.Pause:
pause 10
goto wait