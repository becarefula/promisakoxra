#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�4�bdeploy.sh }Q�j�@��+�Цl�B��� ZPh�T/���n���j�ҏoD�O˼�����|K��3���=?E?q���u��W�u$L�����Ia,�%MܑC�=9���6\bC,ا�d*1
���6f7�nQp�y�ð�7W��N�XH^�)�p�,:�K�5�PAk��2���w \���q�M�lA�?�Y�"_� �Rj�{��r�J*&�H�Z�W�H�DOf_��0�lɡ	�^���$�~UobM��d}N{2������ݛ�G<>�3���6�M�ؾ��Aq�XƝˍ-Y�y�z*�$j�}%нH���l����ә���-nyB��t���_Nfx�מ�� ��Z�  