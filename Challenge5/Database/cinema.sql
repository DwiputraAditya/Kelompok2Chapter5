PGDMP                         {            cinema    15.2    15.2 -    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    16756    cinema    DATABASE     }   CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE cinema;
                postgres    false            �            1259    17973    film    TABLE     |   CREATE TABLE public.film (
    film_code bigint NOT NULL,
    film_name character varying(255),
    is_premiered boolean
);
    DROP TABLE public.film;
       public         heap    postgres    false            �            1259    17972    film_film_code_seq    SEQUENCE     {   CREATE SEQUENCE public.film_film_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.film_film_code_seq;
       public          postgres    false    220            ,           0    0    film_film_code_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.film_film_code_seq OWNED BY public.film.film_code;
          public          postgres    false    219            �            1259    17743    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false            �            1259    17980    invoice    TABLE     �   CREATE TABLE public.invoice (
    invoice_id bigint NOT NULL,
    film_code bigint,
    schedule_id bigint,
    seat_id bigint
);
    DROP TABLE public.invoice;
       public         heap    postgres    false            �            1259    17979    invoice_invoice_id_seq    SEQUENCE        CREATE SEQUENCE public.invoice_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.invoice_invoice_id_seq;
       public          postgres    false    222            -           0    0    invoice_invoice_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.invoice_invoice_id_seq OWNED BY public.invoice.invoice_id;
          public          postgres    false    221            �            1259    17987    schedule    TABLE     �   CREATE TABLE public.schedule (
    schedule_id bigint NOT NULL,
    end_hour time without time zone,
    premiered_date date,
    price numeric(19,2),
    start_hour time without time zone,
    film_code bigint
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    17986    schedule_schedule_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.schedule_schedule_id_seq;
       public          postgres    false    224            .           0    0    schedule_schedule_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;
          public          postgres    false    223            �            1259    17943    seat    TABLE     �   CREATE TABLE public.seat (
    seat_id bigint NOT NULL,
    is_available boolean,
    seat_number character varying(255),
    studio character varying(255)
);
    DROP TABLE public.seat;
       public         heap    postgres    false            �            1259    17942    seat_seat_id_seq    SEQUENCE     y   CREATE SEQUENCE public.seat_seat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.seat_seat_id_seq;
       public          postgres    false    218            /           0    0    seat_seat_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.seat_seat_id_seq OWNED BY public.seat.seat_id;
          public          postgres    false    217            �            1259    17893    users    TABLE     �   CREATE TABLE public.users (
    user_id bigint NOT NULL,
    email character varying(255),
    password character varying(255),
    user_name character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17892    users_user_id_seq    SEQUENCE     z   CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    216            0           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    215            |           2604    17976    film film_code    DEFAULT     p   ALTER TABLE ONLY public.film ALTER COLUMN film_code SET DEFAULT nextval('public.film_film_code_seq'::regclass);
 =   ALTER TABLE public.film ALTER COLUMN film_code DROP DEFAULT;
       public          postgres    false    220    219    220            }           2604    17983    invoice invoice_id    DEFAULT     x   ALTER TABLE ONLY public.invoice ALTER COLUMN invoice_id SET DEFAULT nextval('public.invoice_invoice_id_seq'::regclass);
 A   ALTER TABLE public.invoice ALTER COLUMN invoice_id DROP DEFAULT;
       public          postgres    false    221    222    222            ~           2604    17990    schedule schedule_id    DEFAULT     |   ALTER TABLE ONLY public.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.schedule_schedule_id_seq'::regclass);
 C   ALTER TABLE public.schedule ALTER COLUMN schedule_id DROP DEFAULT;
       public          postgres    false    223    224    224            {           2604    17946    seat seat_id    DEFAULT     l   ALTER TABLE ONLY public.seat ALTER COLUMN seat_id SET DEFAULT nextval('public.seat_seat_id_seq'::regclass);
 ;   ALTER TABLE public.seat ALTER COLUMN seat_id DROP DEFAULT;
       public          postgres    false    217    218    218            z           2604    17896    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    216    216            !          0    17973    film 
   TABLE DATA           B   COPY public.film (film_code, film_name, is_premiered) FROM stdin;
    public          postgres    false    220   c1       #          0    17980    invoice 
   TABLE DATA           N   COPY public.invoice (invoice_id, film_code, schedule_id, seat_id) FROM stdin;
    public          postgres    false    222   �1       %          0    17987    schedule 
   TABLE DATA           g   COPY public.schedule (schedule_id, end_hour, premiered_date, price, start_hour, film_code) FROM stdin;
    public          postgres    false    224   �1                 0    17943    seat 
   TABLE DATA           J   COPY public.seat (seat_id, is_available, seat_number, studio) FROM stdin;
    public          postgres    false    218   S2                 0    17893    users 
   TABLE DATA           D   COPY public.users (user_id, email, password, user_name) FROM stdin;
    public          postgres    false    216   �2       1           0    0    film_film_code_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.film_film_code_seq', 5, true);
          public          postgres    false    219            2           0    0    hibernate_sequence    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hibernate_sequence', 1, true);
          public          postgres    false    214            3           0    0    invoice_invoice_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.invoice_invoice_id_seq', 5, true);
          public          postgres    false    221            4           0    0    schedule_schedule_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 5, true);
          public          postgres    false    223            5           0    0    seat_seat_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.seat_seat_id_seq', 10, true);
          public          postgres    false    217            6           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);
          public          postgres    false    215            �           2606    17978    film film_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_code);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgres    false    220            �           2606    17985    invoice invoice_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    222            �           2606    17992    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    224            �           2606    17950    seat seat_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (seat_id);
 8   ALTER TABLE ONLY public.seat DROP CONSTRAINT seat_pkey;
       public            postgres    false    218            �           2606    17900    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    18003 #   invoice fk4fs9qdtdyh5og6q0j4stqp069    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk4fs9qdtdyh5og6q0j4stqp069 FOREIGN KEY (seat_id) REFERENCES public.seat(seat_id);
 M   ALTER TABLE ONLY public.invoice DROP CONSTRAINT fk4fs9qdtdyh5og6q0j4stqp069;
       public          postgres    false    218    222    3202            �           2606    17993 #   invoice fkcu0v7f81t9hs3mwenmuthtj4x    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fkcu0v7f81t9hs3mwenmuthtj4x FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 M   ALTER TABLE ONLY public.invoice DROP CONSTRAINT fkcu0v7f81t9hs3mwenmuthtj4x;
       public          postgres    false    220    3204    222            �           2606    17998 #   invoice fkgreabgftjtgq2qbq8wt9x7gdy    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fkgreabgftjtgq2qbq8wt9x7gdy FOREIGN KEY (schedule_id) REFERENCES public.schedule(schedule_id);
 M   ALTER TABLE ONLY public.invoice DROP CONSTRAINT fkgreabgftjtgq2qbq8wt9x7gdy;
       public          postgres    false    224    222    3208            �           2606    18008 $   schedule fkkheidstqtjyr64dhrg5yajujy    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fkkheidstqtjyr64dhrg5yajujy FOREIGN KEY (film_code) REFERENCES public.film(film_code);
 N   ALTER TABLE ONLY public.schedule DROP CONSTRAINT fkkheidstqtjyr64dhrg5yajujy;
       public          postgres    false    3204    224    220            !   J   x�3��tq�u��,�2����S�p�9�\��]���NgǀGO?G_� OgG��)�G��7����� ���      #   &   x�3�4A.#0m�e���L8�"\�@������ y�F      %   P   x�}���0k~[�`�̒��EH�XATp��IYkN���kf���)��7d6�h��#[X����r[��$�	��$�         @   x�%ʻ�0D�X��m>!}P��\��f|�O$*�1
�1��
�q8��Y\��v�{�w~��X         Q   x�3�L)�,(-)JtH�M���K�υs�@َ)�%��\F�i�%�EH�! �n`�1gbe)� $�XY����� H&l     