#/bin/bash

##
##  Rapid7 Orchestrator self-extracting installer
##

INTERACTIVE=${INTERACTIVE:=1}
TMPDIR=`mktemp -d /tmp/r7orchestrator.extract.XXXXXX`
ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`

# set the default region configuration URLs 
export ICON_API_URL="${ICON_API_URL:=https://us.api.connect.insight.rapid7.com/}"
export ICON_PLUGIN_REGISTRY_URL="${ICON_PLUGIN_REGISTRY_URL:=https://pulluser_7iymfaloyvf0j9bewmugpekzy:n5s80jr6sq848jkwvc8vy6yzm721dg0yjmkkyjn20kgjk4v9dx@us.plugins.connect.insight.rapid7.com}"

hi(){
  printf -- "$(tput setaf 3)$*$(tput sgr0)\n"
}

help(){
  echo "----"
  hi "Command: $0"
  echo "Installation script for the Rapid7 Orchestrator"
  echo ""
  echo "Useful environment variable flags:"
  echo ""

  hi "INTERACTIVE=[0|1], default is 1"
  echo ""
  echo -e "\tSet to 0 to disable interactive mode (automatic install for configuration management or other scripting)"
  echo -e "\texample: INTERACTIVE=0 $0"
  echo ""

  hi "DEFAULT_R7_PASSWORD=<string, default is changeme>"
  echo ""
  echo -e "\tSets the default password for the rapid7 user created on installation."
  echo ""
}

main(){
  CDIR=`pwd`
  hi "-> Welcome to the Rapid7 Orchestrator Self-Extracting Installer."
  hi "-> Extracting to ${TMPDIR}"
  tail -n+$ARCHIVE $0 | tar xz -C $TMPDIR
  cd $TMPDIR
  INTERACTIVE=${INTERACTIVE} CHECK_DEPS=1 ./install.sh  2>&1 | tee /tmp/r7install.log
  ret=${PIPESTATUS[0]}

  if [[ "$ret" -ne "0" ]]; then
    # tell the user where the install log can be found.
    hi "-> Contact Rapid7 support and include the error message and installation log."
    hi "-> The full install log can be found at /tmp/r7install.log."
  fi

  cd $CDIR
  rm -rf $TMPDIR

  exit 0
}

if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  help
fi

main
__ARCHIVE_BELOW__
� �` �<ks۶���
��✐��L�Q�qm%�4�=~����"!�1E� iE�}~����(�NҤw����X,����v�������\_�j��n������Q{���[+�U�o�������=z����<�@�?s��V������Ys/(�\j���}�1nY��V{����m("�/�������{>}�|eq?�Ĳ���4���;�^��DA��>����m�M���|��/=�mM?�1i7�1qx؃��;n�_ނ�j�i@cN�X1wX�aB���M��;b�C�? gg�;�t�=|�t�Kޟ���["�޽$�Ц4� 1O���#!�����X=���N0��	�q�`����?>�~���}����z*��#����`�>�zJDE���#@�#����69a�W�AT��D�1D��]u=���RA�Δ��1f�?��K �!����q�R���q0�S���x4��GCק�6�Jpp:AZ�6A�zt<���D�@��H8��0'c���Cz8�%������`�Dx ���K2L���@���7�0�j�b*b:FB�)�J�a� +�ɉE���Nf��/}���a����6�wGT� �qc�3w�x��p��\<=G/0�	��,T́j�0�1b�M�d(&�iL�����zoly��P���V�5i�#:f��p��r�Y�'pI�̠�[Y�U
e��
����FL��ԂX�[j����QGb����$���J��@�&%��ti3��4��=�Q��D(	+H�~�y���i�Z>����4i�6���!loԽ҆�v��)�N0���a�pN���f���9M�Tt$ӹq@P��R���NH��kI����H�6������6���e�c������XH;1ņԐԗ�hิ��jU�s��a|km��|��nr)�,VAVyNL�1��/0�m���z�b�m��W쿯�<�����f�#�pGC����x�:W
Q���@���ʔ̲hPku���ruml�M���)K@ӢQ�t5(cЮCv�R��{�|e�"?i!�n'�s��1p'��푄�����0��w���c6��ϱ��A+G�5�����h�Y�I��hsl���p�z��<��1�#'�2�@��kks��*l�����Xy��_�9;����K��}igtN��'�`��#�R8�c�.b�1����6��e������4Ykk9L���pe��Ի_G�L�p��0u����qľF"�a��4����o��Mm�~Y�O�Y��W66W�����z��_�)���N����N�v;��U���"�A��4v~������c�����O�G�;'{���W�����>}s�;��n�~p���j��:��c*aJ�	֟w��R�Vg��f�����6��1�򩘤�!f�	�E����~o�p�wz��c�'�+�Id�1�"�m_�6�L�"�26�d��Z<��sp)̬�H�R���VhWj �YvZq'<Tި{��l��s������t�o��D��O:���ere<�eĺ`���G/�ad���U�u/z�T�K�����b��y+;�N�{���L.O��P���A��2�A8c�-���N��G>1����&����/�[�	��o�m����
��91z��^D鍀�����׶'�ę\�ƕZ(3�y��^&7�eG�G�S�F���ʐjf����y���������τ�:B�ƿ�~����4�꘢��x"!�1o�Y,���zEv�P׆�?2��,C���!,�fe��)PE��t9:KW��F��̳l��0�����1�,T�4�W�A-iav�tU�Uo��V���!� ��Z���m�fʖ0���{�y��~vC
mRLKmo
4#���ŋ�i���1�*��O��U
�N�r� J�(]�5>G�ݟ�Oz��:���N4��K^XN�%�����=
�g�M��i�)
���nq���c�(&��f)�:�.�^@B�S��m�R�$����{�]��T�':[�֔Q��p4����K8peH�ԅ"�
-���Q#����'Ay��f1�g������P�V�PH�E�FV1J�K�7A�j��-�_�Y��Ҍ�A���0�k₺�<�X��B�s,h/� AK�4�T�r��.�.�ay���D\�Q��.yl$.�Q�c�]��L��,	����N3KC4K,�j�Z˝���X��'���^�)���z���ϟ$���&�Y�;i�#�֝��ĺ)P�Xzu�����k�Ե��1�e�I��� D�1	O���O�8���f8=��:���8���hx�~B�#Q�0���CΒH1�w�*+I�,Z��HW>9X�$6i�z��6�u�
�t�-����LF���r���7�u�1�x��=?,��:�� v�e�� a�naM�_Õ �=�0�𔳲��֚�Hq��q:��1�u AB��7q�d&��$��VF��k&���I�"����nn�2�Q��N���zOj�v}y�e�Y�,#w��VE+VzR	���W��n��Q�E� �9@#S�߫�6��*h���0D�+jɢ�v��3����9k�&�l�pl�H� k����7Eݮ���DQ��R�9�jTL��騙5�mu$q��dD&(��D��`=�����>g!:�lr�"�b�R[��:� k8S4:���+��p.����rI��b����S�s@w��@�d�a�E��XN��y�S������U�}��(,��:�ǜ��H�;'&0d	! 8A�Q!��Ӑ�d�4X�@	 (l�S@��;M7� �����댇�Z�,������$(L��$���?g�s������2=�=���̼X���D7I3\z��7ς!����B���o�N��g>gE�4_C����Tlq"��{��){*�����m�q���P
�\�#�4H9�Ӗ��w��On�w%U�f����|h�$�	e���M�	�3�]����H�p m/�P2�с�!�P�+�-	��jlbM@ZĶ]�و��wu�R��AA�i���� �����p�g�� �/�3�i,��w�%f��A�^+������z\�?{/��W�)��0T���V��� ����vTǫ�
�׺K6)�r���@����Z�ܹ��E�k�ݡ��t�J���Q�Yc�cg]s�ң�G���
����<$JN��L8!����?e3XNl�~��o�`�Z0�%�ɐf�������@+��'ʹ�~ 
�����_�B�@2��CPdc}}u�,U���՟��&G�)XBS�\c?�鎊`�(u��G�P.�"�1xw%T�@2P�&�柮h�[��;�N����UBn�/dv�y����p��/K���H=��� �f|،�~!4�`���q�v�P�6��Eý&��v���K�[�V�0R�)�N&� 	R+���ҙa����ԷK9��(��S)��>DG	���MZ�0������g�X ��c@7�"v#/G$;��N��E��0`}' Y��T�Q/���-ﰆl������1�W'�8Ar1�rW �Hx��YxQOd�x�tf��J��g�8U٣!�H-E��>7�F�L��B�#�c����=�оT�s��E9��?�TB'���#]�i�\L��Y��>s�Z���t�𹩊B#8��'�_��n��a���)-z�3�=Xl7�@�>���c4AC���=�� H�ͧx5'LSg.��q��y#��L�R�1f�'��@`�3P��`{�()2�� Ȋ�Es��3QzR���Lr����yS�\��J!��Ib&y$C����i����ŕ�v~��?��B����]Q%�E�Pڤ@UpO�Q�;X<Pn�h��f�*�VK�ʐh�iZ{��nnҀ�a�;R�e]�0d��""ȋF�vA^\b�`����h���0�)od�*���=O����N
�ԳQ�E�&�%�/��Ϝ=u��l�{cS�)�����%�����t��JPB?J�z�\���TB��H
8:L�9��������)�]<�c�휳�}�8.���Q���@��5��0��k�1Z��)�AP;�vȢDPg��Y,c@�>�;cy�K���V�,j����	�-9���\U��D�ݓ����$���tB�i�!��+�̅��b ��xJTN��}?���s����O'�K�=�1��9�u{��}�����|�K5"Mq}�����s�l?[�>oW�6ɢ�\Jq�7e�H�oN_��������O��ޟ`u �L<�C���'X"�W��}	r�AY*��G)O#ک�^��:�v�,W^��JQ�J����I�y7�d%-R�c�Tc�5�j �.? W��:5Ҍ/)=@q�[�0R�/��u)�u�9�6�g�>���韉�uR�����Z~׺��+��^���
�b}�QQ��W�m���na�����f��y�<����%���M����reLO&�j킝u&M�k4կ�������6,���A�ÆG%�� �eIoI>���4�ީ�1 ��t���d������g93���XG�s�~LG��{BX���!�xz�T�ޱVڧϠ�1�8a��1� ?ȸi��A�H�B�m���n���ߘc~�����m>|��k<u!�/=�m��Zk+��_[o��|�m<]`yܿ���"f�y ��[c�����ܴ�/8�-�ޮ���v{�a����Mdw8D������ӣuގ�Ĕ����Tɢ���ނ&*=��-��p��$��,�W9e�/�HOb�Ϯ�f�)��+L%�t�F��`�1x4V�9��#Xq��fL��aƊ�
0����o�X��]j>��Ȕr%�}�gW��2j i����� 1����\�'S�������;�=�KB���I-<(Ɠ�أR˟i)~`�~,Ge��XtRz�'$M�WG�ym�v�ĭ`��m�g~�}��ς��� �?�m���jU�o��<�_婹�_s���������8;V����(��g�E�b���e��Sq?����~`���^o�l���+k��k<���Ix
1���tٸ���N�#:1(���:��z��r��d��Ksh��c�Z$��G��̑�3(�-K��2}������d+��NKm61ё��ۥ���x�n����0�C�f`�'��9�ǘ���������Oh_�1��+�~�,�l��%�0ѓ�Yz�nf�
���>G��&������s������z� ��a�c��ѳ�O)9���$�}�����F~��E!�RB$T93W��d���]p�
�Q~�p^&qn���ژ�9tEY@b��+4"�d{-b���&���m
\���O�m&nL���%i���
e5�N��8��]�obW�u9,�����~�oS�������Rw�%	�һ�= ��
/��VpD@kn��lo���Xٜ�7�˕w�̐�C]D��R�p��
�O��\ޙ��S�h�7б���>��,�xz�v����p�aj�Y��D_��x	:
�N�P\���Fyxf�9�=��D��9��t���H��p��𥼃�����a���?�ب�;`�Z�M�qDUS?�>71�3�Q����𵉿��_����b��?���En�^���6拈�m�ڛ۶���ҧ@h��\K��6m�U3^[��^?2v�����R%��+|TQ'�g�� @���(v�۹�L�����<p���}��K�e/�F�	k6a���f�Kؒl��^N����6:S��\���U 4V[���qH�W�,��i��:�>~��ܲ
V4�0hj� <1�SY
��K�f���M2��^����r�(�z�	ٝDS6����܉��ׅ��K+�֝|��F��Ĵ՗}�W)�bX�F�єn�ì�Õx��� �8 ���&V�;XZ~�|6�-� ����.sN<���b��z��?��b�_��N�-�Gy�H��k�}�p�ǨKWMV�!,7 �1xC�FT<�\��84,����b�����R2w/_���!#�<��t[ ��|�*W(*��y�b�����&$��l��y�95��?P������%7~���,��3��kK��obu[��/��tO��K��$��*�!��/��l�_y��Vw�O���i����JU �a���n���kV���o[v,�5�F�FТ�u+^g�|���OoY���_�I�7X�|;c�2�H�pj mD`ٓKx��`g�8hCOҎ̺���K�T�Đ�����gع��Rs����7I�v��٩j�çM3F����Z ���/?�baQ�ٵ������BS�!�}|k��:O��iQ��xi��!u�tYх��/�4�.g�����f'�9MY*��Ҟ{NlR_�s+>���V��_w�!t�O#�nw�]�WxۻM�Ƕ�	m0���۔�0�P��)�_�p�����	a�@b�zx5����?���X5�(����]yn����s?��?���L �%��h��#Ey�����e�w���|����I��IZڍJ�̊S�xW�A�sUC[V�g������^֖��}�m����>o�!p�^�|w��pc��8Y{�3���]��u������=ٻe� W���<ǩ]�����t�p5�קW�j���<����tiSC����h9��ܯE�Qgx%&��<\��D�|a	n�+�e��[�^+d����5�O�P���4���M�^N y U���I%?M�h��Ɏ��zq�jF��n?Z��fh�_2�C���Ԣ����K�"���P�H��1� ���K�4e���ݻ떠z ����t�c?��Uf�g�h.'��3Of��^/	E�I���)�gCC�"�-SJ��c?��N��w�����J*���������B�[��o��-���
�o���L��8�B��࿕X���Ws��7<���^��w�7�*~�t>��ל�/��U5=P1*��_N�Z����I������
=p�.�����z�B\聋�wK����������}�������˟���7�et�-��C��)�_��&á���<ùH?4�(ފ����.$�a�
y� F!�s���>��x- <%N>~���H��d��թn�ȋ�6 ʁ'u��c,?�3��,��z9�'���J�q���vK�ܮ��6�ԟ~o�/^w�Y>��RzA�(�b���g�%A��Nz����R��j
&��J>��d1�=�E��)��ϧ��yC)�rF��ҏH��T�S�%��'ݣ�s�Bvj�jL��9F��yP3F�I�2���s���������տ������N�?|�{<��j�����鷽a����i�k=�OJK�c6̀0�B��Q�w���J���)J��� )n��8�ZYy�D����O�t��Y��A�)CJ�I��[E�Wo�/ޞ�^���s���5��ZeU�j���켺�89�N��̪t&���J�0���A00 �����o��(�:��^^��/�;Q�"Ĺ�e��R��Si90��R�^�rj�$�t*����a�?�=���`U@JYU�-������c�M���S��헹lQ�����{.Z� �����e�Pn��p⯸��9�aå|��a�����߀�S�!SpWa�7��LIԏ�y�s��0�����xd��P�X���) q�`�\b	&��'�v���V��x�v�>��Q�]J<{&��[�����l�k���b=��n�������b�cώs��U�����l�}��b�F�M��
�|���;�.;G��O.΅�;�%Rk�k�VvE���e��l���w�<;�!�AM$lB�*^
B�Mɣ5��&e a��s�����&�+_���[:���Hy���q�#�kv�G+Xe	m��+�f���%����I��"�7��%�\��Z��Q[e;c
��9��ccx�J�6]��&��Lx�E̀^Phϧj)&\ �g}N�״�=�7�S(I5B��"��ɪ�E0��zP��1ƅ;�=5}�n���%����κ��ǃ�J��M�ɜ���z4��t��N7�	K�*�����
�#�8z��=�N�pxH�E�d�z�@9��mB���J8���C��6
�N°�qj���W��x�a�PH�iVB�RĊ�����~�/�IU�!Ǭ
oH�O�Z�q�;�6�"gZ�
(�7j٪؋*K3��2�$�p"y(��0�?��'� �B	yE����<q�����?�Q�\�pv�g���C\Ϯ��q��#��$�X���7��-Y��㢢��IƧjC������\&�]ҷ�ć��Gs��Z�X ߂�b����T��cT�=�s�RMeE�_�K؄օI�.QX�)v��p8)V��xN�[����~�(U�V�rݻ�Վd���)�x�"۔�G���K��FyP�E���fa�"������4����0��a�Ⱦ����u�#��Lb�[�D��r�(�A��4t�9�����L�=�ǷY��d.9� ���y^>�|��	����b�ݞ�@��= ѻ@^��%1��j��0�b�j�`��?���4�C��x|���H�	&ˬL�FMR!����UO��o�P�}���0����oֳ/�*�2�r\K%)ͭ?mRU�&�"0
��"lXJ�u�%�#c"��gc�W�����W	 �������[��4�P��N�4 ��Y�i_��5�@
-��b��T��d����uDGT��6f��AC&������T����������'�`�l�aZ7o2�n4+%�
�@̆����4db��Y;�^n��b�%g.QΊ2�pڷs�`\\�!eť,�����U7�˷�A������q�f�ѣTY�az�'zA �D�]����NS����P���F̪bh�%���W��
{1л�`��������8������V���j���`0���Yk9�?�p�7��^�A(�'�G���W_5v~�B��L>٪�ۆ��~����Yy+��a��_}����	�B^nޕ����-#|�<*��1Y�R~v *Y�_k1�^��KB��y��E�̮����EK���..�oI�qvrο��t*�ŕb��P�go�`��K�<�#����[�����s��g}��2ͅ.�[{w�H�~�z)T���f!-5~	�}ޡ�����)�c���*cH"��0@f$xl�6�6Yk]}0�O�_�J4�X�r���)l���]is����ǁf�o(�g�A�}bΙ��x�ŉ�'���MW�o>T-� �>n}��ɳ�&���Vn��7��%��Grv�a������S`n$C��S�!��i�k�2Q��j����[6)�� �ՉF���`޻�Ҡ���S%������C� ����un3�|�m���J6?t� L��'��S�m�g�5���!�Fq�o�t�ឲHQF=eU�P�6�a�����d-�)��̼�����
�m��p,��jY��ê�I��!�f�r*�6 6���%d>�~������G$� �I@�>KU"+����x��6���<��K)�)Ţ�_�о�i�#wȋ�lǌ�-IC}��TP_I.��|[��#�J� �(Mr�7��^kc��	|EZ�k���%L��Қ�[�'���+N��Tw^w�^w� ?�����ȤGR�c/��(ø���ϗh͠J�W&��V:���Z.�&g
�u $BGJ�7N��?i�I���*`4��QnMb�O�*����&�9Hn�1Pd��H�m�(f�С�Yi��F6{"2=�8�'�$tܡp�FC "�!��QA�,�td|0ָx=,�h�inF˜?��40g���G�/�}��2��'W��vzr������<�zL�}�r���eY�L%S�Db�@2�"��  9/�D�LV�$@Q��y{����������,${|�u;G�op����`.�f��Ș��c��}`H<�_f��=��^�L�C��#7菟|k��J�6�Q�2���Y�,r{���:uF� ��f�ĊC�9Z�rn�������b4�i�Nt��U$�7p~7�$�#<������4�2R��a�^h{�j[�<P2�J� ��2�L�H����H�[���w�yrx�}qyq��s~ܞ�g�@( %@Y�q�K�')�1�5�j��[�	�q�p���Vt�먯+[���L\��:O�(���6!�l7���$���.Kꑑ5�ϕ�h��\,|67�\���4�,#1�M�X��]��Th�$��IGl��o��k� ��&ŊC�3�w�1<AJ��g�4<dA%Mg�J���ʘpP��N�D���}�8tG��&=�5v�{�J��q�t�e��w����(L�6Z�Y�m§c`�E��/_WZm���g�D&����Ize�r�U��ȳAۇ���8W�%}M�BMkUN5��t�#9��v�Ƞ�I���ˋ��>���<FF~:��`*�
6�D��S��A������A'�bvU�y��W����"�*�_ �᎘�5
wD%����)�r��y���#�	1I5-5법k�1F@S�u�F��v��y���Ϯ�rK��*����/�K�w~4����w�+�uZ��X:�0�g���Eɽ*"u5.�S�KJ"����%�����)$Ɲ�gR���!�i�	󅰣��Z��]IĻÉ;j;�O�4�TG^D��(�ɜ	:�:�I<�u �e 9lo����3�gQ�>���Qtļ�e���1~|{���tw���l?���>�1AWA��@)�T��0�A&�l�lmh�z0i��KD�EW�Fˠ;���̇�ho}?:��7��FH�R��C�d���B� �uK؛��r/&���p�E��eG,ו�߫�ϰPv@6�����ݓ�%N�J���]�a <�z��M��ͮ40�O�ə2,T�.���A����IC��n�<Gkd&`M��R��;2�rE�^�Yyu����_S�=�ז&�lx	�D����s��-$�Z�Lq�����3Ж��m���
K6�iknm������_����+�$<�<�n[��ͅ�2�m��1l]�k]xrW �%��K��BR�3��ε	3i�I�]R��IoH�i����>�7v'l�Et��1^�;���_}?�HE*R��T�"�HE*R��T�"�HE*R��T�"�HE*R��T�"�HE*R��T�"e���gk �  