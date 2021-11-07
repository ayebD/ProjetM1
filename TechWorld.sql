PGDMP     4                
    x         	   TechWorld    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 	   TechWorld    DATABASE     g   CREATE DATABASE "TechWorld" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE "TechWorld";
                postgres    false            �            1259    24588    articles    TABLE     {   CREATE TABLE public.articles (
    id integer NOT NULL,
    text text,
    title text,
    image text,
    creator text
);
    DROP TABLE public.articles;
       public         heap    postgres    false            �            1259    24586    articles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public          postgres    false    203            �           0    0    articles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;
          public          postgres    false    202            �            1259    16405    users    TABLE     |   CREATE TABLE public.users (
    id integer NOT NULL,
    email text,
    password text,
    perm text DEFAULT 0 NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16403    users_id _seq    SEQUENCE     �   CREATE SEQUENCE public."users_id _seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."users_id _seq";
       public          postgres    false    201            �           0    0    users_id _seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public."users_id _seq" OWNED BY public.users.id;
          public          postgres    false    200            ,           2604    24591    articles id    DEFAULT     j   ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            *           2604    16408    users id    DEFAULT     g   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public."users_id _seq"'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    24588    articles 
   TABLE DATA           C   COPY public.articles (id, text, title, image, creator) FROM stdin;
    public          postgres    false    203   �       �          0    16405    users 
   TABLE DATA           :   COPY public.users (id, email, password, perm) FROM stdin;
    public          postgres    false    201   |       �           0    0    articles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articles_id_seq', 65, true);
          public          postgres    false    202            �           0    0    users_id _seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."users_id _seq"', 62, true);
          public          postgres    false    200            0           2606    24596    articles articles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public            postgres    false    203            .           2606    16413    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            �   �  x��V�n�F=�_���1�d�&9�d���-�%ՠ�����Uu7I)9�aS��mŏ������C{����o?�l�&�df5��Y-%��\�&e2
R�I���+�6�'�v&c����o��x�����-x�Ӡf:{J����cYJzT�k.N/Ũ��ċ-�)�\�B� �QB�������r���3�i|�^
vf����=zא��o�}W���21�AѬ�t4~.Na#�.i�#�1�D�9�dV���bF���Q}�9.6)�'�D�8�����<(�>��P
���l��n:�3e>�kI9�D���2�5��k뢏h���H
� A�x�W��޴V��	7H���&�~�	�Ta��BG~ `�2�Bh��]����s�W6�6(!�8ZP�;Y��{��d����R��XިbT_���+y;�*���D(����#q��*�h2���dʙ`�z�T���ԉ��ςqT�0�W	�y����u� 1�l�"�EG�KF�a�lI���n&��&dJ����J�h7�B�-&΄��)8� r�6h�q*�yRքƚ��Q�\�:8<Y9⊗��������&�090�t�#S�H���,JU�`K^�f7�P|#۞8]^ 7�����y�C��1vGb?���Z�W��` G�{��E�$��s��t#����;�@7U-��&6�U��k��AW�ubO�%�m&�#�>����]aW�73l��fdx���I�2E��NiN�v
Ҳ�KάO=��v V�|
��b���a��R2��Q�����Ȭtx l����.Z� �'F�2ҦS�x`�"L��gz�sC\�h���U��퐊��ѥh����mEl�#�P������r��05{6���w��6$���RZ��5���g�)7�5VAi���̖J����-�v�'���M���jԚD[~����Y�JI��|z�7�jcy+��&q��xlT�����Ǜ*ŗ��(���V-�	�']�����:z	<i6U���/�Yfxk�[l��A��-G��
K�aB�۰�҆������nU�a)ȴ\��o�|�0�ކ̅����w1�l�m��v�~�\ZF����f0�ͫ�I7���8 �>4ϛY�Mq�^$!��1 }�Z�F��(dPJ��F���:MY�U�{)��\��'�RTgm��_�����%�%}�����:�0��?#�~$�fң7��O�n~W7�Kޏ_����?�� ��I�      �   S   x�3��L�J�T1JR14P	vs�N�5�M��w��(	M2��4p�*/(JL�p5K�2��0�*�K������4����� D�     