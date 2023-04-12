PGDMP                         {            Hotel    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24608    Hotel    DATABASE     {   CREATE DATABASE "Hotel" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Hotel";
                admin    false            �            1259    32820    us_login_and_password    TABLE     �   CREATE TABLE public.us_login_and_password (
    user_id integer NOT NULL,
    login text NOT NULL,
    pass character varying(64) NOT NULL
);
 )   DROP TABLE public.us_login_and_password;
       public         heap    postgres    false            �            1259    32837 !   us_login_and_password_user_id_seq    SEQUENCE     �   ALTER TABLE public.us_login_and_password ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.us_login_and_password_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    32827    us_main_data    TABLE     �   CREATE TABLE public.us_main_data (
    fk_user_id integer NOT NULL,
    last_name character varying(64) NOT NULL,
    first_name character varying(64) NOT NULL,
    middle_name character varying(64) NOT NULL,
    date_of_birth date NOT NULL
);
     DROP TABLE public.us_main_data;
       public         heap    postgres    false            �          0    32820    us_login_and_password 
   TABLE DATA           E   COPY public.us_login_and_password (user_id, login, pass) FROM stdin;
    public          postgres    false    214          �          0    32827    us_main_data 
   TABLE DATA           e   COPY public.us_main_data (fk_user_id, last_name, first_name, middle_name, date_of_birth) FROM stdin;
    public          postgres    false    215   m                  0    0 !   us_login_and_password_user_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.us_login_and_password_user_id_seq', 1, true);
          public          postgres    false    216            j           2606    32826 0   us_login_and_password us_login_and_password_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.us_login_and_password
    ADD CONSTRAINT us_login_and_password_pkey PRIMARY KEY (user_id);
 Z   ALTER TABLE ONLY public.us_login_and_password DROP CONSTRAINT us_login_and_password_pkey;
       public            postgres    false    214            l           2606    32831 (   us_main_data us_main_data_fk_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.us_main_data
    ADD CONSTRAINT us_main_data_fk_user_id_key UNIQUE (fk_user_id);
 R   ALTER TABLE ONLY public.us_main_data DROP CONSTRAINT us_main_data_fk_user_id_key;
       public            postgres    false    215            m           2606    32832 )   us_main_data us_main_data_fk_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_main_data
    ADD CONSTRAINT us_main_data_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES public.us_login_and_password(user_id);
 S   ALTER TABLE ONLY public.us_main_data DROP CONSTRAINT us_main_data_fk_user_id_fkey;
       public          postgres    false    214    3178    215            �   A   x�3�t�I�p��Oq�M���+*�4rs2srr20ruu351r4rt�00q1r�04sts������� ��q      �   H   x�3估��֋6_�
��8/L����u�H��0H����b������9---tuL�b���� 
5&V     