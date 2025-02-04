PGDMP     #                    y            Tienda #   12.7 (Ubuntu 12.7-0ubuntu0.20.10.1) #   12.7 (Ubuntu 12.7-0ubuntu0.20.10.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    Tienda    DATABASE     z   CREATE DATABASE "Tienda" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
    DROP DATABASE "Tienda";
                postgres    false            �            1259    16395    clientes    TABLE     �   CREATE TABLE public.clientes (
    ci_cliente integer NOT NULL,
    nombre_cliente character varying(30),
    apellidos_cliente character varying(30),
    direccion_cliente character varying(30)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16410    factura    TABLE     �   CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    id_cliente integer NOT NULL,
    fecha_factura date,
    total_venta numeric(10,2)
);
    DROP TABLE public.factura;
       public         heap    postgres    false            �            1259    16408    factura_id_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.factura_id_factura_seq;
       public          postgres    false    204            �           0    0    factura_id_factura_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.factura_id_factura_seq OWNED BY public.factura.id_factura;
          public          postgres    false    203            �            1259    16436    producto    TABLE     �   CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre_producto character varying(30),
    tipo_producto character varying(30),
    precio_producto numeric(10,2)
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16434    producto_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.producto_id_producto_seq;
       public          postgres    false    206            �           0    0    producto_id_producto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;
          public          postgres    false    205            �            1259    24640    venta    TABLE     w   CREATE TABLE public.venta (
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer
);
    DROP TABLE public.venta;
       public         heap    postgres    false            e           2604    16413    factura id_factura    DEFAULT     x   ALTER TABLE ONLY public.factura ALTER COLUMN id_factura SET DEFAULT nextval('public.factura_id_factura_seq'::regclass);
 A   ALTER TABLE public.factura ALTER COLUMN id_factura DROP DEFAULT;
       public          postgres    false    203    204    204            f           2604    16439    producto id_producto    DEFAULT     |   ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);
 C   ALTER TABLE public.producto ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    206    205    206            �          0    16395    clientes 
   TABLE DATA           d   COPY public.clientes (ci_cliente, nombre_cliente, apellidos_cliente, direccion_cliente) FROM stdin;
    public          postgres    false    202   �       �          0    16410    factura 
   TABLE DATA           U   COPY public.factura (id_factura, id_cliente, fecha_factura, total_venta) FROM stdin;
    public          postgres    false    204   t"       �          0    16436    producto 
   TABLE DATA           `   COPY public.producto (id_producto, nombre_producto, tipo_producto, precio_producto) FROM stdin;
    public          postgres    false    206   �1       �          0    24640    venta 
   TABLE DATA           B   COPY public.venta (id_factura, id_producto, cantidad) FROM stdin;
    public          postgres    false    207   �2       �           0    0    factura_id_factura_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.factura_id_factura_seq', 1, true);
          public          postgres    false    203            �           0    0    producto_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.producto_id_producto_seq', 18, true);
          public          postgres    false    205            h           2606    16399    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (ci_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    202            j           2606    16415    factura factura_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    204            l           2606    16441    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    206            m           2606    16416    factura factura_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(ci_cliente) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_cliente_fkey;
       public          postgres    false    2920    202    204            n           2606    24643    venta venta_id_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura) ON UPDATE CASCADE;
 E   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_factura_fkey;
       public          postgres    false    207    2922    204            o           2606    24648    venta venta_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto) ON UPDATE CASCADE;
 F   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_producto_fkey;
       public          postgres    false    2924    207    206            �   �  x�uW]n�8~�O�,��>��6h�.�.��}a!U!ˁlhn��S�b�I")�V y�d83��L��$������K�7w��؎���8�	�~��ck���5w����]8����!�_���k�Ί����ݱ�ЎCۗ9�нهS�)"o���s�ӱo�������;�~'�{�l�w��q�9%�uN����r��1��^Y#���u����[J�0	������r�=� �be�L�^y���ԌR�أ�in��;|�UFVl�y�9��&+�#e�����ǟ��sw:�y��6���J$;/=�Çv�=;6�%g׆s���E����T<�R;Ɇr���x�-�<VJKl�������(m�AA�}��Oݡ*y+����Ͼ��8�<�2����x3�aD�A=ݾ�&<���T���މ�Oh,�o(�Re1��2���R[���g�] �>\Z��<�5�	G^e��Y�un���X����D�ZT��iB�\RE����M�碡����m���K"*OK�:E���$�w	�zHlXC*V@*I	a�f�O]=��V��g#����gߒ�������
�	{�$IP$Z�k��	�)�Za[K����
WŲ�·��B�1^�9`K{nR���!IyZL�K(U�Yh�A	��bB9v���j��2;4�Qz�u2�M2A(��/8Wo�Eu$�7��VS�-{�+�N-�%/�HX(��}�OW�>�������Cs%�c={�7�2zQ9֙&<A,��h�# �e'�����$�T�G��/�k^�X�
'�n�
|�CC���	���¾�z�뀦���X޶Z�\obe��	�1�0��4N{�lr����=�`�����[�gz�P.g�=�/Um�C���fa(�8���X��2cV�i����[� 6�4�Ȩ�P�X'���%:' �	�f��K�0��:y\���Ӑ��kKA�xr��ɤg�2.�zE�����B�k�Z�j�rj�R�S:L�I���"2W�d�<�;y���	)��T���(S͑�8j�R�Sl|��5��SD~\�[�j���|���Z�N�9�����/)�׶�HV9 ��Y�;Yx1 mе�\�#.�|�G�2 ��t7�$��F
�uWQ�!��O��M),Z&ƂV������!�c�ZEřVb��H8�EYt}Ģ-
r3�1S��zp��#�f!���n���P`�      �     x�m[k�f�
���^jB_{��_�p�#&��ѣI&X�G���$���2�ZJ���~���X��/�_NsX!ܣ����A�UHc�^���Zt��`��KIg]������[E�Gǜ��vA��i��~s��l*���]�g�d*��6[7��1��gK����?ʹQ��?���3[��Tmn�K<c�E����i&�<�R�n;�_�9ʆ�)�4h�[�����/�G��y���3do3�5��U[��}a��5:~��ch>�����?(�1����������i_��Rg'i׉y���G{m��>���Q�_����C:�Z�\Pk��p��
��JsT��G���`�{,�{���zjl�kn2s�Q�`�{�s��B�=
)�Rj>+�����i�Gc�@�=�<��b� �kU�4Nߪ���go�M��r�T�M�����Xަ�1��߃��w8�w��.� �\�k��X�7�F��a^,J	�l�[ܑ��PmW��J���nc�a�l�,X�XTx�T
峴X׾����v R�(��~ �mIP� �q���Zxt�S��r=�dci�.!Q�K(�L�e_^�\�/{�\叏���`0�{�k�'#�|/�)�]��ͮ�t���L67xW���{f췍�\�#-cr2$;/=ۚP��5�M�#q�~�J���hǭS,�)p%lw{TP Pgjs�b%&�������Sv���D��Q����J�I�頔�Y:�g
���l��2r�L�Z9�`x��jÜ�� ���k��9���#l��AZ� ��6N
��ԭ{���L�F�<7�E>���\P;��8�z�j0���}����A�e����b������%� '�u�ζa�ii_��&��C,�+�s��Q�k����� ���W��2'Y�l�TF��r�G�{�W�d�����!������0�{�v���(�6���4�|�R?l2�E0�Е�ٯW��^|^��L�//��:FV'��pdV���'�P��/7�lFp�j�[��b*�:�U!.b���\��fA������e+�5�>s�"���'�I�9�ꃍ~yÔ��,ܞ#z����o�Q�"9r�l��96�<o%٦Kh2���n�4� q��T:�v�S��۵^L��}�;�����}�!��:�X|�؆��cva�)5F�K�4����[��]��Fx�*����N���g{k�. ���֪���l�������ٖ%�<���.��}��٭�����C�#���n�`�n�=x�Kf�i'L���Y��>m[Z�)?�°y��aj"�����'J�j��T����Xdӻ�Q:쉇���9
���`ݫG毺��D'!�F:�B���	Ti�w�'0��;�&#�$(J�k=�z0�������H�%r��㬩d��V���1�!K��go�{XX� X�*��#EI�8T��BƗOq89�;N��ER�P<8�"y�V'/|�P�=��;�gՍ�A��%�o(�
�w/o�.n�l7�e܋��hΥ鄒�]�8���qXS�G���+�K��|��JZ�Z;�''��ⷎof�*�^F����I��8,re݆�G9�m� >�r�N�Q�O.V�۹�	�!q�=��f�YR�K���ۅK{Fr�{8�\�?հ�!p
 Y���)UH��{�0���i�ή��8x�"��z�3�2ð<@6Jz�X��KǏ���[�5�+��؝Ey�dϮq� m<�Ϫ�@[���ʤW6{Ĳ�����F=��S�	����|]d�����`�����UK�#ԄP�m�uu�
O���Avk{��]��;�
�=;���X�5���b��p�W��tY��\9z�W�ؖ��;��(�7kug�zF��Wm�E����4�$g>VO���l��f��]6�9H,�!�%�(�w�E��,9XMw�
���:��[�Z�33�,�߹Rkuݶ^�@���9�TN���H���c�ᅭ	�p�x5��t�J����޸��Z���W�v�@�£$P��j��V.�����S
�֝�(�ZZ�O�2oԮ��@�+� ����SIط��*��:Bc`ַ֢�R� 1�q�\�³s�x�L:m�I�.�ng��.>�M�8B���ѭ��������&d�f_�Q�5_�����}���׾�� ���:=}���v$'[����3��^��Z���=��r+���5�m���R�BB�Gh��X�e0.�Y����%��RJ�nUr���X̫&��K'䭠�|dR��f%]�nf-ݔ�o�,�CH�3�++��;�]�l��Y�aj�\^�|Y�&[zY��fˆ�5��8��Af�v��O�3#�p�]Z>��]}�d��Vj�}�w��=���g���J�m��kQֹ��ʶ"D)!Q���d4�y��[�4�tG�2l�a_ąӠ�*��
��B�(�s��ٶ�^l������,����P��k�/���/e	��"�� �F�^�Gx�ory���Q��g��u���A����� �d�74�{hTi�pcc>i�U������#D(���H �������в��7�+���h�/�)Eف6J�{�O `T����ͮ���f7��"3L�%��(�m}��|	ok8����ixq�Y��ph!�U#F�*��R��������X�iƈQ�����8E��ά�m��Lg�-���;|�L3��uG�%cpx����J`�w�{3B[O�@�*<��Z��A�jڰt���iA3�����m�CS�4ZV4�4|���.N�oVR4�ED|��\�Py�BK��A��~�zP#���\�<�iBݏuZ�T!�6̦
m���c�iv���>0�P3
�"��@я�t�͞����q���9XW��ǹE�۷K�
��b����j�-(��
�w�T��6luض&<��a��<���(m���>�e�E�
N�JR2�K_���
o����t�F�Q��ˊ�������+���d�k�-��l��+����lW*��B�6��E	� Py/^B�Y��}X	�^�Z,Adi_���Bx2y�Xx����r�/��۹�!�'u�ȿz�+m���Z�>\bA�x��o��5{�����ׇ���u��~�n�����Ĥ���B� ����8�[W�W[A�O���	�]�FaoJR��6�B�O��!��+�	��O;Y�ē���Y�����~w�z�:/�{��I(��.�jl.
���-��������m�#>��]�B�/�iy��&r��<D�/��\�
����Bh�b����N��A3�%r��5���LU[���1jt�'Q/�ZU-��}�I�Ղ#wʸ�`S-�ޘ��$��j�ەj[�y91�B�������R�����|Kc�5�9i��w_\SB3��|6���H�
o�G��Vξ� ®֥����rgO��R�⬝S�*�K�$j!<��]QJ��|���)����Z�Ac�����7�(/����.b!��j*�Փ/�f��8�)�Y���^�S/�%y�����ru��Ѽr�=\=��7�ftU
���1z=ө=�`��ađդ�f�;-��Sq����2$�aE�T;K�ޒ�g0x�b)�@���iY֑�C���W_�6ܭȕ��p��t�3�����E� ��o���K7�e�����ax�6���~=mؒ��F~tE);>`J&�H��[����]��oP� ���I�
�g�ߩ�@�W�l}��=�������Ū�_T����/J��}~0����t�W���)&
r��.�U�7o���������߿���i��      �   �   x����n�0���)x�Ȇ�eH��j�.'sM-_z6K���4"E]��������,�#A��3I`�
�VJeDt�g��Fq;:[��r1�54d#3G9�oa'�aޒO3�<�[�(�&���V��o���p^��'�G���O��)���Ʋ�.o\���=�dXC#�h��;�܏�Z���
^1$�%��n`�>!�3���b��Şx9QN��]�C�̬�1�ʲ��
      �      x�MZYzn!
|NӟN{����5��K�x��@爟��~�'�gB�?0�%�gA�O\T��tI� �|��n}��
Xcu�%y~���@�����@���DG_N7�_�?p0���Ἧ-����n�kqw����q~�R�`@���@eL{l��'(`��E�~��2�K6^���/G����>��^,��l�J��A��Uݫ�?��P-����s�O� �M)l�J>��m�d� ��)]4X*�S���d��Kd/�8�Ob%g[����T�ş���ɯ`l��,�fq4��F������58�O��g��$&������gt�$�
'�, ��`9]wv��/m&������j�FԀ��l5�j�}�#����S�NYan������Ћ�1��(��&���� 6���=l��(W�擯R��N�oA5A��n�.����+;��)|�헛+ZCig�r󭚄��ks�eE��75�IXi�?���` \�亴��͔���m�I�v�
Ni��z�-+dM�ޚ���W2��Z�U��*.߲�|�k.��Z���-]�M�-�-'��\�:ܦ�����?�ڷ�Q��i�[�$g��ض�m��C{~O�aO턝R���n� >�v�&���?p]��o8�n�H�ϩ钫*�����q��ٲ�w���������$�t]�ҁ�����t��c�}���d�h�����w�A�di�0��݃��]s�������6	Iu�C�t.u{����v�~���s[Oky7�2�;�ή]��k| w���
|b���ߤO��xmC�8ĻTs���ή�+7z�����B�%9�$7ڵy\Y�ՙ~��J��>n�k��l���_h�T�~�M����Ky��2���ꖼ�+m�W�R��+�X��3z6����'w�s<%���:�ޡ�x�����dI�y��y���-��t Z�:*�A�P�vb	
G���4�[.|8�p���sA������Ry�VK���� �l��&��ȥ�@��MM��)���x(z�E���\e��6)��i&��'�����Dme����/�5�B=-�y��V.�����!����B��+�m"!R4�H�[�H��4C5
^%�΍�_�Z�X�!�}��ː&�4!6�(;��8t�X���⇈I|��h�g-<׽ �9�҆���m�0��~�a���D�t�h������u�\��2	s�>����3�G�X���K��9L�u>��H:ĨD�R~�$|Bv�b���/����d����0�L��Z2��LN e%ɝ��I`�6�'6,)���S�\����$�(ɣ)1�K_qU[�?���8kp��(Zo���3��F(1ǚ�%�Of���X�J�ĢJAh�'d) ��]�p�3+����[������bb����$��~*�]��4h9�z-m��0�<�Ү!㎖O��]���v�j��a����MeIM��~��`�I-m��SpQ�ы�b�q,y�u���|$����������VKy��(m=n�%ƴ=��b{ ���v�E ͳ7C��OV���-�ش���N֒JvQ���g�[�5�-�Ȁ8������<�+�����'��3���Qv��g�~���њ��i����G��L��G%�̨��X��)��(X?�s���,}^X�����S��l�s6�Q�qd��m�G����&e^-Z�W*��[�ʙ��#���Ks�:c��wrʗ��*,�^��&��& 2�~ɶQ��tIBn��b�▗G�Ցs�߭�o:�ˣ�.���zh\�����,�c_Z��qT�N<�Vr�j�(`7��ق&`�O�4�����#Ay$kO�Q��oa�_�(H���"�oqS?%7�c���W��a�-�<&������1�xJ/>zΧ(�,:!�G1�0l	�2��  c�	�d�)�3���H�6��U�h�L�w�����v�D��!]S� j6�gs�����H������3�j �H=$�j��B�&Ag��	�I��M���R���܋b��Rpô+-H*0�� p5v�%����i��D�G��ん�.2��c�� ʙ:nbjG5`]�����s�UJ0�<+� ˞�� �̒���1lM�	��IHK�D�S;
 6�|2�2���0a��"@l$�"�\��8u(G�<
��m��S1K�K�� ��a X��K�L�ߠ �f�ڄT�$1-�?���n����VF?d�E�(�H�^Ä ;2�B����IPm>i�;�I� �u �S�5`b��]�[���_�L����JuX0Xp@2ƫ��,���X�RN�#8�u</ ��r$Y�?�2�b�-�*�����! )� �S��Cd9�����mq��dE���
�T��nV~)����XR ;�r�?��Fp�`�����9���u<�#��Mǲ���F��P����Գ.7`�!WK�d+ � ��m�ʞ4�M6�,!�hdl�[2���G 8�-����M���t�[1 &��[�I�,u`Ol�A��_x�����Ocg�&�H$ �ˏc�����n@&�Ru���.�%�v��9���Q�6�"E`%�lW������11����9��m-��9v:GFq�5�vD��ꦧ�yI+�d<nh�74So (]=L��m`�)�y����>H��v��b����L��~,��82��X�����k�tM��ф��i��?.��� C_`���_��Ҟ�A �J\ W�����I��<�t�MY�� &�Y��dyO�|:U�8�+m�W�ǯ�NH��\tϔ������_��Τ��#��	y�?�T^)��d�p"��}�KC�6|�=���8#��" Ho1�$��ѓil�� @�k8	=�� M6���=9�6�����̨����` ��ܡ�R�|��Ҧ �)XKX ҅�7�����`�1���?B9>g��"��\��15��5K�mI*%�K�(�6���uS�:��8 ]hb�S�&�|������gH�/!�՜�Oo���5�
�%&7�)V��H?��ɭ�ST�AA*�H��ȩlW�G�@7�h�1f5r�|��_4���3��VP��I��.�Z��r��J�r;�=����
B2�}ʑ6`RYgq�R��)Z�"����*J_��������2��`�"�Y��Lf������4�m *ƫI�������Rb,��Y�,�� ���d/�R�/ �%�%���cl#>��+�D^�xԴ����B��O���kd�C��ZJ��i �,F�����P5�7�ҽK�pY˞q��aٴ����`�Ödr9	`|Kw� umtK�r-�J)E ��R���x��.u���u�%G��jz��@��t":���ܺ�ʭ}nŹ ������������' t)&���s�6�ݖT��s�H���:����5En>d�-V�f� X�k��ھ�uk
-pZ���]� �Cf�y���
x��h �g3�<>��N�#?�,�x����y�_	/�|?~���(>`;�QH]7`�����Qv �u�1�*�K��!=�5r�*�!��Y��rq��0��@�U" C�� �t�;��tyف�(ݡ�N X�k*��w���پ�����0�ޝW� /y��QY^Fey����8\ū�7��|�
K?�~����r>裏� ����e��TU޻�K_]���#�|�UOo+�[<����w`�z��2\@=>���'��]��y���j�'��
����!-��S�Z�u��Q=1(=��!� (T)w+�WC�W!��?R�Z"�((}a�
� � G�|�G�u@n��r��lN���BVR��$ �c�
+DO�[�7����FB[����e�+t�:�R%�Tle���nM����L*�=*x!ZqU��'C�[A�[!�Pv ��2>�X�>���X��8fM���'�p{�w5�����~�u�r���&]HM���|�S�_�@�MH9�]�SK}�4��|b�MF�uM�ռ��UR�|ҿ�k4��ͺ`�NZ��֕�ŕ�j��Ľ+unU*/e�[� �   v���m���JEՅ�a�Ud�Z K�J�Vnu�;�j�O2Zr��Ob�e��s�l��֮%�W�l���-S�*���� �N1AQ����P��F����F U6�RF�j�݆�[� J�\��g��FtVr+ŔD��O9]�ؤ�z�~�QW;��V1�+%��o4j)%VNI�o�������C8;Q     