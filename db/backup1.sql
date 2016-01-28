--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_passwordreset; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE account_passwordreset (
    id integer NOT NULL,
    key character varying(40),
    expired boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_passwordreset OWNER TO mzakany;

--
-- Name: account_passwordreset_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE account_passwordreset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_passwordreset_id_seq OWNER TO mzakany;

--
-- Name: account_passwordreset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE account_passwordreset_id_seq OWNED BY account_passwordreset.id;


--
-- Name: account_profile; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE account_profile (
    id integer NOT NULL,
    organization character varying(100),
    first_name character varying(20),
    last_name character varying(20),
    phone_number character varying(10),
    email character varying(40),
    slug character varying(50),
    org_photo character varying(100),
    stripe_id character varying(100),
    account_id integer,
    address_id integer
);


ALTER TABLE public.account_profile OWNER TO mzakany;

--
-- Name: account_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE account_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_profile_id_seq OWNER TO mzakany;

--
-- Name: account_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE account_profile_id_seq OWNED BY account_profile.id;


--
-- Name: address_address; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE address_address (
    id integer NOT NULL,
    shipping boolean NOT NULL,
    billing boolean NOT NULL,
    title character varying(40),
    street character varying(40),
    line_2 character varying(40),
    city character varying(40),
    state character varying(40),
    zip_code character varying(40),
    country character varying(40)
);


ALTER TABLE public.address_address OWNER TO mzakany;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO mzakany;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE address_address_id_seq OWNED BY address_address.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO mzakany;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO mzakany;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO mzakany;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO mzakany;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO mzakany;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO mzakany;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO mzakany;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO mzakany;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO mzakany;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO mzakany;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO mzakany;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO mzakany;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: comment_fundraiserordercomment; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE comment_fundraiserordercomment (
    id integer NOT NULL,
    comment text,
    fundraiser_id integer NOT NULL
);


ALTER TABLE public.comment_fundraiserordercomment OWNER TO mzakany;

--
-- Name: comment_fundraiserordercomment_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE comment_fundraiserordercomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_fundraiserordercomment_id_seq OWNER TO mzakany;

--
-- Name: comment_fundraiserordercomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE comment_fundraiserordercomment_id_seq OWNED BY comment_fundraiserordercomment.id;


--
-- Name: comment_usercomment; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE comment_usercomment (
    id integer NOT NULL,
    comment text,
    approved boolean NOT NULL,
    account_id integer,
    fundraiser_id integer NOT NULL
);


ALTER TABLE public.comment_usercomment OWNER TO mzakany;

--
-- Name: comment_usercomment_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE comment_usercomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_usercomment_id_seq OWNER TO mzakany;

--
-- Name: comment_usercomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE comment_usercomment_id_seq OWNED BY comment_usercomment.id;


--
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE public.corsheaders_corsmodel OWNER TO mzakany;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.corsheaders_corsmodel_id_seq OWNER TO mzakany;

--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO mzakany;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO mzakany;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO mzakany;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO mzakany;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO mzakany;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO mzakany;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO mzakany;

--
-- Name: fundraiser_fundraiser; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraiser (
    id integer NOT NULL,
    title text,
    description text,
    status character varying(40),
    finalized boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    discount numeric(10,2) NOT NULL,
    slug character varying(400),
    receipt_email_sent boolean NOT NULL,
    account_id integer,
    plan_id integer,
    profile_id integer,
    type_id integer
);


ALTER TABLE public.fundraiser_fundraiser OWNER TO mzakany;

--
-- Name: fundraiser_fundraiser_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraiser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraiser_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraiser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraiser_id_seq OWNED BY fundraiser_fundraiser.id;


--
-- Name: fundraiser_fundraisercategory; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraisercategory (
    id integer NOT NULL,
    name character varying(40),
    title text,
    description text,
    image character varying(100),
    show_top_sellers boolean NOT NULL,
    popular boolean NOT NULL,
    type_id integer
);


ALTER TABLE public.fundraiser_fundraisercategory OWNER TO mzakany;

--
-- Name: fundraiser_fundraisercategory_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraisercategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraisercategory_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraisercategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraisercategory_id_seq OWNED BY fundraiser_fundraisercategory.id;


--
-- Name: fundraiser_fundraisercategory_options; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraisercategory_options (
    id integer NOT NULL,
    fundraisercategory_id integer NOT NULL,
    fundraisertype_id integer NOT NULL
);


ALTER TABLE public.fundraiser_fundraisercategory_options OWNER TO mzakany;

--
-- Name: fundraiser_fundraisercategory_options_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraisercategory_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraisercategory_options_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraisercategory_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraisercategory_options_id_seq OWNED BY fundraiser_fundraisercategory_options.id;


--
-- Name: fundraiser_fundraisertype; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraisertype (
    id integer NOT NULL,
    jar_price numeric(10,2) NOT NULL,
    slug character varying(50),
    image character varying(100),
    title character varying(40) NOT NULL,
    forms character varying(100),
    "order" integer
);


ALTER TABLE public.fundraiser_fundraisertype OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertype_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraisertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraisertype_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraisertype_id_seq OWNED BY fundraiser_fundraisertype.id;


--
-- Name: fundraiser_fundraisertype_selections; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraisertype_selections (
    id integer NOT NULL,
    fundraisertype_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.fundraiser_fundraisertype_selections OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertype_selections_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraisertype_selections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraisertype_selections_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertype_selections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraisertype_selections_id_seq OWNED BY fundraiser_fundraisertype_selections.id;


--
-- Name: fundraiser_fundraisertypetitle; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE fundraiser_fundraisertypetitle (
    id integer NOT NULL,
    title character varying(40)
);


ALTER TABLE public.fundraiser_fundraisertypetitle OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertypetitle_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE fundraiser_fundraisertypetitle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fundraiser_fundraisertypetitle_id_seq OWNER TO mzakany;

--
-- Name: fundraiser_fundraisertypetitle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE fundraiser_fundraisertypetitle_id_seq OWNED BY fundraiser_fundraisertypetitle.id;


--
-- Name: marketing_emailnewsletter; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE marketing_emailnewsletter (
    id integer NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.marketing_emailnewsletter OWNER TO mzakany;

--
-- Name: marketing_emailnewsletter_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE marketing_emailnewsletter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_emailnewsletter_id_seq OWNER TO mzakany;

--
-- Name: marketing_emailnewsletter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE marketing_emailnewsletter_id_seq OWNED BY marketing_emailnewsletter.id;


--
-- Name: marketing_genericdiscount; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE marketing_genericdiscount (
    id integer NOT NULL,
    title character varying(40) NOT NULL,
    special_code character varying(40),
    active boolean NOT NULL,
    expires_after integer NOT NULL,
    used integer NOT NULL,
    percent numeric(10,2) NOT NULL,
    dollars numeric(10,2) NOT NULL
);


ALTER TABLE public.marketing_genericdiscount OWNER TO mzakany;

--
-- Name: marketing_genericdiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE marketing_genericdiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_genericdiscount_id_seq OWNER TO mzakany;

--
-- Name: marketing_genericdiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE marketing_genericdiscount_id_seq OWNED BY marketing_genericdiscount.id;


--
-- Name: marketing_singlediscount; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE marketing_singlediscount (
    id integer NOT NULL,
    title character varying(40) NOT NULL,
    special_code character varying(40),
    active boolean NOT NULL,
    expires_after integer NOT NULL,
    used integer NOT NULL,
    percent numeric(10,2) NOT NULL,
    dollars numeric(10,2) NOT NULL,
    fundraiser_id integer
);


ALTER TABLE public.marketing_singlediscount OWNER TO mzakany;

--
-- Name: marketing_singlediscount_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE marketing_singlediscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketing_singlediscount_id_seq OWNER TO mzakany;

--
-- Name: marketing_singlediscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE marketing_singlediscount_id_seq OWNED BY marketing_singlediscount.id;


--
-- Name: payment_payment; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE payment_payment (
    id integer NOT NULL,
    type character varying(40),
    stripe_id character varying(40),
    last_4 character varying(4),
    card_type character varying(10),
    fundraiser_id integer
);


ALTER TABLE public.payment_payment OWNER TO mzakany;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO mzakany;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE payment_payment_id_seq OWNED BY payment_payment.id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE product_category (
    id integer NOT NULL,
    title character varying(40),
    "order" integer,
    slug character varying(40)
);


ALTER TABLE public.product_category OWNER TO mzakany;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO mzakany;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE product_category_id_seq OWNED BY product_category.id;


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE product_product (
    id integer NOT NULL,
    product_code character varying(100),
    slug character varying(50),
    title character varying(40) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    image character varying(100),
    featured boolean NOT NULL,
    best_seller boolean NOT NULL
);


ALTER TABLE public.product_product OWNER TO mzakany;

--
-- Name: product_product_category; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE product_product_category (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.product_product_category OWNER TO mzakany;

--
-- Name: product_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE product_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_category_id_seq OWNER TO mzakany;

--
-- Name: product_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE product_product_category_id_seq OWNED BY product_product_category.id;


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO mzakany;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE product_product_id_seq OWNED BY product_product.id;


--
-- Name: product_productimage; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE product_productimage (
    id integer NOT NULL,
    "default" boolean NOT NULL,
    image character varying(100) NOT NULL,
    zoom_image boolean NOT NULL,
    product_id integer
);


ALTER TABLE public.product_productimage OWNER TO mzakany;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE product_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productimage_id_seq OWNER TO mzakany;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE product_productimage_id_seq OWNED BY product_productimage.id;


--
-- Name: shipment_selection; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE shipment_selection (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    shipment_id integer NOT NULL
);


ALTER TABLE public.shipment_selection OWNER TO mzakany;

--
-- Name: shipment_selection_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE shipment_selection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_selection_id_seq OWNER TO mzakany;

--
-- Name: shipment_selection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE shipment_selection_id_seq OWNED BY shipment_selection.id;


--
-- Name: shipment_shipment; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE shipment_shipment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    address_id integer,
    comment_id integer,
    fundraiser_id integer NOT NULL
);


ALTER TABLE public.shipment_shipment OWNER TO mzakany;

--
-- Name: shipment_shipment_id_seq; Type: SEQUENCE; Schema: public; Owner: mzakany
--

CREATE SEQUENCE shipment_shipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipment_shipment_id_seq OWNER TO mzakany;

--
-- Name: shipment_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mzakany
--

ALTER SEQUENCE shipment_shipment_id_seq OWNED BY shipment_shipment.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_passwordreset ALTER COLUMN id SET DEFAULT nextval('account_passwordreset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_profile ALTER COLUMN id SET DEFAULT nextval('account_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY address_address ALTER COLUMN id SET DEFAULT nextval('address_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY comment_fundraiserordercomment ALTER COLUMN id SET DEFAULT nextval('comment_fundraiserordercomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY comment_usercomment ALTER COLUMN id SET DEFAULT nextval('comment_usercomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraiser ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraiser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisercategory ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraisercategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisercategory_options ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraisercategory_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisertype ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraisertype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisertype_selections ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraisertype_selections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisertypetitle ALTER COLUMN id SET DEFAULT nextval('fundraiser_fundraisertypetitle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY marketing_emailnewsletter ALTER COLUMN id SET DEFAULT nextval('marketing_emailnewsletter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY marketing_genericdiscount ALTER COLUMN id SET DEFAULT nextval('marketing_genericdiscount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY marketing_singlediscount ALTER COLUMN id SET DEFAULT nextval('marketing_singlediscount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY payment_payment ALTER COLUMN id SET DEFAULT nextval('payment_payment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_category ALTER COLUMN id SET DEFAULT nextval('product_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_product ALTER COLUMN id SET DEFAULT nextval('product_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_product_category ALTER COLUMN id SET DEFAULT nextval('product_product_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_productimage ALTER COLUMN id SET DEFAULT nextval('product_productimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_selection ALTER COLUMN id SET DEFAULT nextval('shipment_selection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_shipment ALTER COLUMN id SET DEFAULT nextval('shipment_shipment_id_seq'::regclass);


--
-- Data for Name: account_passwordreset; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY account_passwordreset (id, key, expired, created_at, user_id) FROM stdin;
\.


--
-- Name: account_passwordreset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('account_passwordreset_id_seq', 10, true);


--
-- Data for Name: account_profile; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY account_profile (id, organization, first_name, last_name, phone_number, email, slug, org_photo, stripe_id, account_id, address_id) FROM stdin;
55	Marine City Middle School PTO	Maryann	May	5866650167	triplemmm37@yahoo.com	profile-55			\N	34
56	Fairfield Central PTC	Amber	Seppala	5138290989	aseppala80@gmail.com	profile-56			\N	35
35	Ridgemont High School	Danielle	Weber	9373542141	webber@ridgemont.k12.oh.us	profile-35			\N	21
11		Michael	Zakany	3306126183	mzakany@gmail.com	profile-11			1	\N
57	St Joseph Health Systems Relay for Life Team	Eva	Finley	9893620458	evafinley2501@yahoo.com	profile-57			\N	36
12	St. Andrew's Nursery School	\N	\N	\N	\N	st-andrews-nursery-school-12		\N	\N	\N
58	Riveredale Band Parent Organization	Marta	Roby	4196747475	mlroby@teamppi.com	profile-58			\N	37
13	matt harlin	Matthew	Harlin	7402213934	mike@josemadridsalsa.com	matt-harlin-13		\N	4	2
59	Hardin Northern Awakened Commotion	Kelly	Eikenbary	4197592331	kelly.eikenbary@hardinnorthern.org	profile-59			\N	38
60	Boy Scout Troop 399	Carla & Tom	Cashman	2169909025	cmcashman@hotmail.com	profile-60			\N	39
15	Marysville Cooperative Preschool	Barbara	Lapp	8108410397	lappb@landmarkacademy.net	profile-15			\N	\N
61	Institute of Notre Dame Post Prom Committee	Terry	Little	0000000000	terry.little@zurichna.com	profile-61			\N	40
17	Heavyn Rhoades - One Leg At a Time	Lori	Povisil	6145632238	lpovisil@wscloud.org	profile-17			\N	\N
18	NY Palamino Youth Grouth	Shannon	Whitney	3157711468	whitney@gisco.net	profile-18			\N	5
62	Jonathan Alder High School - Italy/Switzerland 2015	Lindsay	Dollinger	6148734642	dollinli@japioneers.org	profile-62			\N	\N
19	CNS Winterguard	Laurie	Marinelli	3155595669	laurie_marinelli@hotmail.com	profile-19			\N	6
20	Boy Scout Troop 751 Southgate, Kentucky	Steve	Kreutzer	8594410637	marekr27@fuse.net	profile-20			\N	\N
63	Valley Equestrian 4-H	Karen	Moyer	5705758583	triplebfarm@hotmail.com	profile-63			\N	41
21	Boy Scout Troop 751 Southgate, Kentucky	Steve	Kreutzer	8594410637	marekr27@fuse.net	profile-21			\N	7
22	EMC Elementary School	Diane	Rush	2157681265	diane.rush@verizon.net	profile-22			\N	8
23	Perry Elementary PTO	Wendy	Barton	7408199068	barton24jw@hotmail.com	profile-23			\N	9
64	Tri Valley Titan Hockey Team	\N	\N	\N	\N	tri-valley-titan-hockey-team-64		\N	\N	\N
24	Marine City Band Boosters	Steve	Fox	8106761986	sfox@ecsd.us	profile-24			\N	10
25	Ranch Horse Youth Group	Stephanie	Gilliland	8106143778	stephanie@sthartdesigns.com	profile-25			\N	11
40	HELP Homeschool	Sharon	Francis	5133324897	jfrancis@cinci.rr.com	help-homeschool-40		\N	5	42
26	Nashville United Methodist Church	Deanna	Wheatley	3302310004	numc@nashville-umc.org	profile-26			\N	12
27	Infiniti Dance Team	Abby	Garner	4193073808	garner2530@gmail.com	profile-27			\N	13
28	Grafton Educational Travelers	Jacque	Dilorenzo	2165713832	jacq615@gmail.com	profile-28			\N	14
29	Powersource Youth Ministry/New Brighton Christian Assembly	Daren	Duncan	7248468820	daren.duncan@nbcafamily.net	profile-29			\N	15
30	Amherst Elementary School	Erin	Miller	3303272604	emiller1219@gmail.com	profile-30			\N	16
31	Southside PAWS Southside Elementary School	Lorrie	Rodriguez	6154786840	southsidepaws@live.com	profile-31			\N	17
32	The Cattle Company - 4-H Group	Juli	Chant	5174902843	juli.chant@gmail.com	profile-32			\N	18
33	Thomas Worthington Science Olympiad	Chelsey	Kiehborth	6145959786	ckiehborth@wscloud.org	profile-33			\N	19
34	Worthington Kilbourne Science Olympiad	Chelsey	Kiehborth	6145959786	ckiehborth@wscloud.org	profile-34			\N	20
37	NBHS Equestrian Teams	Marie	Curell	8106149390	curellm@hotmail.com	profile-37			\N	23
38	People to People Australian Adventure	Thea	Prostko	6108372743	thprostko@gmail.com	profile-38			\N	24
39	St. John's Lutheran Church Zanesville OH	Stephanie	Rudloff	7406077323	srudloff@columbus.rr.com	profile-39			\N	26
41	Maniacs Softball 12U	Mindy	Myers	3176978495	m_myers@wvpa.com	profile-41			\N	27
42	Whitehall High School Spanish NHS	Brayden	Sickler	6074268133	sicklerb@whitehallcoplay.org	profile-42			\N	\N
43	Chrissy Melton Cheer	Chrissy	Melton	0000000000	cmeltoneverest@gmail.com	profile-43			\N	\N
44	Hocking Valley Community Hospital TWIG IV	Ginger	Johnson	7403808207	gjohnson@hvch.org	profile-44			\N	\N
45	Piketon High Cheer	Amanda	Barker	7402228085	flanigan45690@yahoo.com	profile-45			\N	28
46	Eagles Baseball	David	Watkins	3146232319	dwatkins0703@hotmail.com	profile-46			\N	29
47	Off The Edge Dance	Kristel	Drew	5132573384	kjdrew03@hotmail.com	profile-47			\N	30
48	Westerville FWB Youth Nationals	Sherry	Brazzell	6148908089	mamabrazz@gmail.com	profile-48			\N	\N
49	Tri City Chorus	Mary	Garcia	9896868845	mgbcma@sbcglobal.net	profile-49			\N	\N
50	Arsenal Soccer Club - Woodville	Christina	Thatcher	0000000000	gcthatcher@aol.com	profile-50			\N	\N
51	River View Cross Country	Jon	Hardesty	7405521360	strokerace828@gmail.com	profile-51			\N	31
16	Northcoast Allstars	Michele	Tomasi	2169789291	michele@northcoastallstars.com	profile-16			\N	4
52	Wheeler Middle School	Rebecca	Costello	8602711791	costellor@northstonington.k12.ct.us	profile-52			\N	32
53	Missouri Stixx Baseball Team	Carrie	Dickherber	3147501614	ced70@centurytel.net	profile-53			\N	33
54	MSU Organization of Athletic Training	Bob	Pond	7017202018	bobpond@my.minotstateu.edu	profile-54			\N	\N
\.


--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('account_profile_id_seq', 64, true);


--
-- Data for Name: address_address; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY address_address (id, shipping, billing, title, street, line_2, city, state, zip_code, country) FROM stdin;
1	t	f		2641 Shaker Rd.		Cleveland Heights	OH	44118	\N
2	t	f		4626 B Channing Terrace		Columbus	OH	43232	\N
3	t	f	Northcoast Allstars	14108 Carrydale Ave		Cleveland	OH	44111	USA
4	t	f	Northcoast Allstars	14108 Carrydale Ave		Cleveland	OH	44111	USA
5	t	f	NY Palamino Youth Group	1708 Cady Rd.		Adams Center	NY	13606	USA
6	t	f	CNS Winterguard	6108 Owlwood Dr.		Cicero	NY	13039	USA
7	t	f	Boy Scout Troop 751, Southgate Kentucky	10520 PIPPIN RD		Cincinnati	OH	45238	USA
8	t	f	EMC Elementary School	143 S. School Lane		Souderton	PA	18964	USA
9	t	f	Perry Elementary PTO	1350 Sonora Rd		Zanesville	OH	43701	USA
10	t	f	Marine City Band Boosters	1085 Ward Street		Marine City	MI	48039	USA
11	t	f	Ranch Horse Youth Group	8233 Abbott Rd.		Brown City	MI	48416	USA
12	t	f	Nashville United Methodist Church	207 W. Millersburg St.	P.O. Box 411	Nashville	OH	44661	\N
13	t	f	Infiniti Dance Team	11635 W. Portage River S. Rd.		Oak Harbor	OH	43449	USA
14	t	f	Grafton Educational Travelers	15201 Cowley Rd.		Columbia Station	OH	44028	USA
15	t	f	Powersource Youth Ministry/New Brighton 	1810 Valley Ave.		New Brighton	PA	15066	USA
16	t	f	Amherst Elementary School	8750 Jane St. NW		Massillon	OH	44646	USA
17	t	f	Southside PAWS Southside Elementary Scho	1224 Murfreesboro Road		Lebanon	TN	37090	USA
18	t	f	The Cattle Company - 4-H Group	4439 West Jason Road		DeWitt	MI	48820	USA
19	t	f	Thomas Worthington Science Olympiad	300 W Dublin Granville Rd		Worthington	OH	43085	USA
20	t	f	Worthington Kilbourne Science Olympiad	1499 Hard Road		Columbus	OH	43235	USA
21	t	f	Ridgemont High School - Europe 2016	560 West Taylor Street		Mt. Victory	OH	43340	USA
22	t	f	Grafton Educational Travelers	15201 Cowley Rd.		Columbia Station	OH	44028	USA
23	t	f	NBHS Equestrian Teams	4151 Clifford Rd.		Clifford	MI	48727	USA
24	t	f	People to People Australian Adventure	4433 Seemsville Rd.		Northampton	PA	18067	USA
25	t	f	St. John's Lutheran Church Zanesville OH	Market and North 7th Streets		Zanesville	OH	43701	USA
26	t	f	St. John's Lutheran Church Zanesville OH	Market and North 7th Streets		Zanesville	OH	43701	USA
27	t	f	Maniacs Softball 12U	722 N High School Rd.		Indianapolis	IN	46214	USA
28	t	f	Piketon High Cheer - Amanda Barker	184 Indian Ridge Dr.		Piketon	OH	45661	USA
29	t	f	Eagles Baseball	237 Carmel Woods		Ellisville	MO	63021	USA
30	t	f	Off The Edge Dance	8176 New Haven Rd.		Harrison	OH	45030	USA
31	t	f	River View Cross Country	46346 County Road 495		Coshocton	OH	43812	USA
32	t	f	Wheeler Middle School	298 Norwich-Westerly Rd.		North Stonington	CT	06359	USA
33	t	f	Missouri Stixx Baseball Team	119 Hillary Circle		Wentzville	MO	63385	USA
34	t	f	Marine City Middle School PTO	6373 King Rd.		Marine City	MI	48039	USA
35	t	f	Fairfield Central PTC	5058 Dixie Highway		Fairfield	OH	45014	USA
36	t	f	St Joseph Health Systems Relay for Life	1068 Krumm Rd		Tawas City	MI	48763	USA
37	t	f	Riveredale Band Parent Organization	405 W Zimmerman Street		Forest	OH	45843	USA
38	t	f	Hardin Northern Awakened Commotion	11589 State Route 81		Dola	OH	45835	USA
39	t	f	Boy Scout Troop 399	274 W. Glendale		Bedford	OH	44146	USA
40	t	f	Institute Notre Dame Post Prom Committee	16 Francis Green Circle		Baltimore	MD	21221	USA
41	t	f	Valley Equestrian 4-H	5 John Street		Carbondale	PA	18407	USA
42	t	f		5815 Baas Rd		Batavia	OH	45103	\N
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('address_address_id_seq', 42, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add cors model	1	add_corsmodel
2	Can change cors model	1	change_corsmodel
3	Can delete cors model	1	delete_corsmodel
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add profile	8	add_profile
23	Can change profile	8	change_profile
24	Can delete profile	8	delete_profile
25	Can add fundraiser order comment	9	add_fundraiserordercomment
26	Can change fundraiser order comment	9	change_fundraiserordercomment
27	Can delete fundraiser order comment	9	delete_fundraiserordercomment
28	Can add user comment	10	add_usercomment
29	Can change user comment	10	change_usercomment
30	Can delete user comment	10	delete_usercomment
31	Can add product	11	add_product
32	Can change product	11	change_product
33	Can delete product	11	delete_product
34	Can add product image	12	add_productimage
35	Can change product image	12	change_productimage
36	Can delete product image	12	delete_productimage
37	Can add category	13	add_category
38	Can change category	13	change_category
39	Can delete category	13	delete_category
40	Can add fundraiser	14	add_fundraiser
41	Can change fundraiser	14	change_fundraiser
42	Can delete fundraiser	14	delete_fundraiser
46	Can add fundraiser category	16	add_fundraisercategory
47	Can change fundraiser category	16	change_fundraisercategory
48	Can delete fundraiser category	16	delete_fundraisercategory
49	Can add fundraiser type	17	add_fundraisertype
50	Can change fundraiser type	17	change_fundraisertype
51	Can delete fundraiser type	17	delete_fundraisertype
52	Can add address	18	add_address
53	Can change address	18	change_address
54	Can delete address	18	delete_address
55	Can add shipment	19	add_shipment
56	Can change shipment	19	change_shipment
57	Can delete shipment	19	delete_shipment
58	Can add selection	20	add_selection
59	Can change selection	20	change_selection
60	Can delete selection	20	delete_selection
61	Can add generic discount	21	add_genericdiscount
62	Can change generic discount	21	change_genericdiscount
63	Can delete generic discount	21	delete_genericdiscount
64	Can add single discount	22	add_singlediscount
65	Can change single discount	22	change_singlediscount
66	Can delete single discount	22	delete_singlediscount
67	Can add email news letter	23	add_emailnewsletter
68	Can change email news letter	23	change_emailnewsletter
69	Can delete email news letter	23	delete_emailnewsletter
70	Can add payment	24	add_payment
71	Can change payment	24	change_payment
72	Can delete payment	24	delete_payment
73	Can add fundraiser type title	25	add_fundraisertypetitle
74	Can change fundraiser type title	25	change_fundraisertypetitle
75	Can delete fundraiser type title	25	delete_fundraisertypetitle
76	Can add password reset	26	add_passwordreset
77	Can change password reset	26	change_passwordreset
78	Can delete password reset	26	delete_passwordreset
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
5	pbkdf2_sha256$15000$m7VkSiJI7X8y$85qhqzFzbiAInXxoEpbA8Aw87Mt8oTB0V+KkKXKOiWQ=	2015-11-26 20:12:09.509787-05	f	Sharon Francis				f	t	2015-11-26 20:12:09.343351-05
4	pbkdf2_sha256$15000$ZoluZ0y3qftD$AlKUB3v4rEGaLggQS7VlQbCz+SuhATgPdzGmb/TaaGM=	2015-11-30 10:32:31.387877-05	t	salsaking2015				t	t	2015-11-10 10:14:05-05
1	pbkdf2_sha256$15000$bhtTxeutwNK0$BndeaiOnnpYKfRN312Ky5RDhKP3hlkEyI/lh8T2bK7Q=	2015-11-30 12:19:27.759384-05	t	mzakany			mzakany@gmail.com	t	t	2015-10-06 09:58:37.664294-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_user_id_seq', 5, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: comment_fundraiserordercomment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY comment_fundraiserordercomment (id, comment, fundraiser_id) FROM stdin;
12	When Mike and I talked, he said we could meet to drop off the salsas to avoid the shipping.  We will be in Columbus, this Sunday 11/29.  We would be more than happy to meet you there.  If you are coming to Cincinnati, we would be willing to meet you anywhere on I 71.  I will need the salsas by Dec 1st.  Please text or call me to confirm what is my best method of receiving the salsas.  I can give you a check when we meet. Thanks so much.\n\nSharon Francis\n513-332-4897	66
\.


--
-- Name: comment_fundraiserordercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('comment_fundraiserordercomment_id_seq', 12, true);


--
-- Data for Name: comment_usercomment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY comment_usercomment (id, comment, approved, account_id, fundraiser_id) FROM stdin;
\.


--
-- Name: comment_usercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('comment_usercomment_id_seq', 1, false);


--
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('corsheaders_corsmodel_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
5	2015-10-06 10:30:15.696116-04	1	Original Red	1		13	1
6	2015-10-06 10:30:36.600485-04	2	Specialty	1		13	1
7	2015-10-06 10:30:54.379116-04	3	Fruit	1		13	1
8	2015-10-06 10:31:15.966912-04	4	Verde	1		13	1
9	2015-10-06 10:31:20.832732-04	1	ORIGINAL X-HOT	1		11	1
10	2015-10-06 10:31:59.585602-04	1	ORIGINAL X-HOT	2	Changed featured.	11	1
11	2015-10-06 10:32:09.477607-04	1	ORIGINAL X-HOT	2	Changed featured.	11	1
12	2015-10-06 10:32:51.283133-04	2	SPANISH VERDE XX-STUPID-HOT	1		11	1
13	2015-10-06 10:33:30.997787-04	3	ORIGINAL MILD	1		11	1
14	2015-10-06 10:34:15.107257-04	4	CHERRY MILD	1		11	1
15	2015-10-06 10:36:04.660083-04	5	MANGO MILD	1		11	1
16	2015-10-06 10:36:22.647669-04	5	MANGO MILD	2	Changed category.	11	1
17	2015-10-06 10:37:59.1766-04	6	RASPBERRY BBQ CHIPOTLE	1		11	1
18	2015-10-06 10:38:56.776792-04	7	PINEAPPLE MILD	1		11	1
19	2015-10-06 10:39:19.843865-04	8	BLACK BEAN AND CORN PABLANO	1		11	1
20	2015-10-06 10:39:50.759302-04	9	ROASTED GARLIC & OLIVES	1		11	1
21	2015-10-06 10:40:18.370103-04	10	CLOVIS MEDIUM	1		11	1
22	2015-10-06 10:40:35.014783-04	1	ORIGINAL X-HOT	2	Changed featured.	11	1
23	2015-10-06 10:40:35.019191-04	2	SPANISH VERDE XX-STUPID-HOT	2	Changed featured.	11	1
24	2015-10-06 10:40:35.022332-04	3	ORIGINAL MILD	2	Changed featured.	11	1
25	2015-10-06 10:40:35.025373-04	4	CHERRY MILD	2	Changed featured.	11	1
26	2015-10-06 10:40:35.028466-04	5	MANGO MILD	2	Changed featured.	11	1
27	2015-10-06 10:40:35.032026-04	6	RASPBERRY BBQ CHIPOTLE	2	Changed featured.	11	1
28	2015-10-06 10:40:35.035295-04	7	PINEAPPLE MILD	2	Changed featured.	11	1
29	2015-10-06 10:40:35.038221-04	8	BLACK BEAN AND CORN PABLANO	2	Changed featured.	11	1
30	2015-10-06 10:40:35.041623-04	9	ROASTED GARLIC & OLIVES	2	Changed featured.	11	1
31	2015-10-06 10:41:37.040472-04	11	CHIPOTLE CON QUESO	1		11	1
32	2015-10-06 10:42:06.087464-04	12	SPANISH VERDE HOT	1		11	1
33	2015-10-06 10:42:54.313476-04	13	ROASTED PINEAPPLE HABANERO HOT	1		11	1
34	2015-10-06 10:43:24.948526-04	14	SPANISH VERDE MILD	1		11	1
35	2015-10-06 10:43:53.575532-04	15	CHIPOTLE HOT	1		11	1
36	2015-10-06 10:44:18.494028-04	16	ORIGINAL HOT	1		11	1
37	2015-10-06 10:44:44.170276-04	17	GARDEN CILANTRO SALSA HOT	1		11	1
38	2015-10-06 10:46:11.3981-04	18	CHERRY CHOCOLATE HOT	1		11	1
39	2015-10-06 10:46:33.69556-04	19	JAMAICAN JERK HOT	1		11	1
40	2015-10-06 10:47:01.508875-04	20	PEACH	1		11	1
41	2015-10-06 10:47:24.277973-04	21	RASPBERRY MILD	1		11	1
42	2015-10-06 10:49:18.291275-04	22	GARDEN CILANTRO SALSA MILD	1		11	1
43	2015-10-06 10:49:29.240428-04	10	CLOVIS MEDIUM	2	Changed featured.	11	1
44	2015-10-06 10:49:29.245106-04	11	CHIPOTLE CON QUESO	2	Changed featured.	11	1
45	2015-10-06 10:49:29.248453-04	12	SPANISH VERDE HOT	2	Changed featured.	11	1
46	2015-10-06 10:49:29.251655-04	13	ROASTED PINEAPPLE HABANERO HOT	2	Changed featured.	11	1
47	2015-10-06 10:49:29.254777-04	14	SPANISH VERDE MILD	2	Changed featured.	11	1
48	2015-10-06 10:49:29.257948-04	15	CHIPOTLE HOT	2	Changed featured.	11	1
49	2015-10-06 10:49:50.631487-04	16	ORIGINAL HOT	2	Changed featured.	11	1
50	2015-10-06 11:13:52.127056-04	1	Pick from 9	1		17	1
51	2015-10-06 11:15:05.803797-04	1	Pick from 9	2	Changed selections.	17	1
52	2015-10-06 11:15:40.596514-04	1	Pick from 9	2	No fields changed.	17	1
53	2015-10-06 11:17:58.144601-04	2	Pick from 16	1		17	1
54	2015-10-06 11:18:26.444123-04	3	Pick from 23	1		17	1
55	2015-10-06 11:34:42.451353-04	13	Pre-Sell	1		16	1
56	2015-10-06 11:34:56.922266-04	13	Pre-Sell	2	Changed image.	16	1
57	2015-10-06 11:37:10.523384-04	14	Buy-Sell	1		16	1
58	2015-10-06 11:37:20.65721-04	14	Buy-Sell	2	Changed image.	16	1
59	2015-10-06 11:38:37.236458-04	15	Pre-Sell mix and match cases	1		16	1
60	2015-10-06 11:38:53.335189-04	15	Pre-Sell mix and match cases	2	Changed image.	16	1
61	2015-10-06 11:39:38.35802-04	15	Pre-Sell mix and match cases	2	Changed title.	16	1
62	2015-10-06 11:41:37.884801-04	13	Buy-Sell	2	Changed type.	16	1
63	2015-10-06 11:41:44.155927-04	13	Pre-Sell	2	Changed type.	16	1
64	2015-10-06 11:43:10.816233-04	13	Plan A	2	Changed type.	16	1
65	2015-10-06 11:43:19.957614-04	14	Plan B	2	Changed type.	16	1
66	2015-10-06 11:43:27.83001-04	15	Plan C	2	Changed type.	16	1
67	2015-10-06 11:53:24.904082-04	13	Plan A	2	Changed type and options.	16	1
68	2015-10-06 11:53:34.851863-04	14	Plan B	2	Changed type and options.	16	1
69	2015-10-06 11:53:43.039937-04	15	Plan C	2	Changed options.	16	1
70	2015-10-06 11:54:44.829723-04	1	Sell our 9 most popular salsas	2	Changed title.	17	1
71	2015-10-06 11:55:03.597232-04	2	Sell a selection of 16 salsas	2	Changed title.	17	1
72	2015-10-06 11:55:13.447798-04	3	Sell all of our salsas	2	Changed title.	17	1
73	2015-10-06 11:55:31.762172-04	13	Plan A	2	Changed options.	16	1
74	2015-10-06 11:55:41.405511-04	14	Plan B	2	Changed options.	16	1
75	2015-10-06 11:55:47.567607-04	15	Plan C	2	Changed options.	16	1
76	2015-10-06 11:55:56.288975-04	15	Plan C	2	Changed type.	16	1
77	2015-10-06 12:06:11.712956-04	3	Sell all of our salsas	2	Changed forms.	17	1
78	2015-10-06 12:06:20.174155-04	2	Sell a selection of 16 salsas	2	Changed forms.	17	1
79	2015-10-06 12:06:26.337434-04	1	Sell our 9 most popular salsas	2	Changed forms.	17	1
80	2015-10-06 12:14:03.766956-04	13	Plan A	2	Changed forms.	16	1
81	2015-10-06 12:14:09.828969-04	14	Plan B	2	Changed forms.	16	1
82	2015-10-06 12:14:15.533266-04	15	Plan C	2	Changed forms.	16	1
83	2015-10-06 12:47:31.443614-04	1	ORIGINAL X-HOT	2	Changed best_seller.	11	1
84	2015-10-06 12:47:31.448341-04	2	SPANISH VERDE XX-STUPID-HOT	2	Changed best_seller.	11	1
85	2015-10-06 12:47:31.451511-04	3	ORIGINAL MILD	2	Changed best_seller.	11	1
86	2015-10-06 12:47:58.350155-04	1	ORIGINAL X-HOT	2	Changed best_seller.	11	1
87	2015-10-06 12:47:58.354699-04	2	SPANISH VERDE XX-STUPID-HOT	2	Changed best_seller.	11	1
88	2015-10-06 12:47:58.358785-04	3	ORIGINAL MILD	2	Changed best_seller.	11	1
89	2015-10-06 12:48:38.43851-04	1	ORIGINAL X-HOT	2	Changed best_seller.	11	1
90	2015-10-06 12:52:29.013995-04	2	SPANISH VERDE XX-STUPID-HOT	2	Changed best_seller.	11	1
91	2015-10-06 12:52:29.018946-04	4	CHERRY MILD	2	Changed best_seller.	11	1
92	2015-10-06 12:52:29.022079-04	5	MANGO MILD	2	Changed best_seller.	11	1
93	2015-10-06 12:52:29.025679-04	6	RASPBERRY BBQ CHIPOTLE	2	Changed best_seller.	11	1
94	2015-10-06 23:14:54.019634-04	13	Plan A	2	Changed show_top_sellers.	16	1
95	2015-10-06 23:17:56.297055-04	13	Plan A	2	Changed show_top_sellers.	16	1
96	2015-10-06 23:18:01.165863-04	14	Plan B	2	Changed show_top_sellers.	16	1
97	2015-10-06 23:29:11.051637-04	1	Pre-sell individual jars	1		25	1
98	2015-10-06 23:29:27.144359-04	2	Buy then sell	1		25	1
99	2015-10-06 23:29:39.375278-04	3	Pre-sell salsa by the case	1		25	1
100	2015-10-06 23:29:50.831323-04	13	Plan A	2	Changed type.	16	1
101	2015-10-06 23:29:56.536417-04	14	Plan B	2	Changed type.	16	1
102	2015-10-06 23:30:02.190508-04	15	Plan C	2	Changed type.	16	1
103	2015-10-06 23:34:57.000279-04	13	Plan A	2	Changed popular.	16	1
104	2015-10-07 10:30:53.818477-04	1	Mike Zakany LLC	3		8	1
105	2015-10-07 20:25:52.156978-04	4	Fundraiser: Cleveland Heights Library - Fall Fundraiser	2	Changed account.	14	1
106	2015-10-07 20:26:15.306807-04	4	ok ok	2	Changed account.	8	1
107	2015-10-07 20:27:50.893538-04	4	ok ok	3		8	1
108	2015-10-07 20:27:50.901931-04	3	another	3		8	1
109	2015-10-07 20:27:50.909377-04	2	oko	3		8	1
110	2015-10-08 09:16:29.738402-04	1	shriners-national	1		22	1
111	2015-10-08 09:18:56.963771-04	1	shriners-national	3		22	1
112	2015-10-08 09:19:12.372812-04	5	shriners	3		8	1
113	2015-10-08 18:29:20.250543-04	1	key for jzakany23 : 33028cb2-bf66-4502-a69d-c7aafb4f704b	3		26	1
114	2015-10-08 18:34:24.819665-04	2	jzakany23	3		5	1
115	2015-10-08 19:18:34.702792-04	3	jzakany	1		5	1
116	2015-10-08 19:18:46.183498-04	7	Cleveland Orchestra Musicians	2	Changed account.	8	1
117	2015-10-08 20:00:56.186352-04	3	jzakany	3		5	1
118	2015-10-08 21:35:16.566852-04	1	Sell our 9 most popular salsas	2	Changed forms.	17	1
119	2015-10-08 21:35:28.36686-04	3	Sell all of our salsas	2	Changed forms.	17	1
120	2015-10-08 21:35:42.977309-04	2	Sell a selection of 16 salsas	2	Changed forms.	17	1
121	2015-10-08 21:39:21.28313-04	2	Sell a selection of 16 salsas	2	Changed ordering.	17	1
122	2015-10-08 21:39:27.355812-04	3	Sell all of our salsas	2	Changed ordering.	17	1
123	2015-10-08 21:39:33.666091-04	1	Sell our 9 most popular salsas	2	Changed ordering.	17	1
124	2015-10-08 21:45:25.508353-04	1	Sell our 9 most popular salsas	2	No fields changed.	17	1
125	2015-10-08 21:46:09.163519-04	2	Sell a selection of 16 salsas	2	Changed order.	17	1
126	2015-10-08 21:46:15.602312-04	3	Sell all of our salsas	2	Changed order.	17	1
127	2015-10-09 10:07:11.859291-04	13	Plan A	2	Changed description.	16	1
128	2015-10-09 10:07:19.864017-04	14	Plan B	2	Changed description.	16	1
129	2015-10-09 10:07:27.494275-04	15	Plan C	2	Changed description.	16	1
130	2015-10-09 10:08:23.889757-04	1	Option 1: Pick from 9	2	Changed title.	17	1
131	2015-10-09 10:08:36.685748-04	2	Option 2: Pick from 16	2	Changed title.	17	1
132	2015-10-09 10:08:49.297161-04	3	Option 3: Pick from 23	2	Changed title.	17	1
133	2015-10-09 10:09:28.858959-04	2	Option 2: Pick from 16	2	Changed forms.	17	1
134	2015-10-09 10:09:35.365981-04	3	Option 3: Pick from 23	2	Changed forms.	17	1
135	2015-10-09 10:25:07.863355-04	1	Option 1: Pick from 9	2	Changed order.	17	1
136	2015-10-09 10:25:11.898361-04	2	Option 2: Pick from 16	2	No fields changed.	17	1
137	2015-10-09 10:25:16.64333-04	3	Option 3: Pick from 23	2	Changed order.	17	1
138	2015-10-12 16:35:11.298471-04	3	Option 3: Pick from 9	2	Changed title.	17	1
139	2015-10-12 16:35:21.991627-04	1	Option 1: Pick from 23	2	Changed title.	17	1
140	2015-10-12 16:35:28.588828-04	1	Option 1: Pick from 23	2	Changed selections.	17	1
141	2015-10-12 16:37:01.380079-04	3	Option 3: Pick from 9	2	Changed selections.	17	1
142	2015-10-12 16:37:36.799101-04	3	Option 3: Pick from 9	2	Changed selections.	17	1
143	2015-10-12 16:38:46.856797-04	3	Option 3: Pick from 9	2	Changed selections.	17	1
144	2015-10-12 16:39:56.496792-04	3	Option 3: Pick from 9	2	Changed selections.	17	1
145	2015-10-12 18:21:20.734342-04	1	Option 1: Pick from 23	2	Changed forms.	17	1
146	2015-10-12 18:21:27.094548-04	2	Option 2: Pick from 16	2	Changed forms.	17	1
147	2015-10-12 18:21:33.150766-04	3	Option 3: Pick from 9	2	Changed forms.	17	1
148	2015-10-12 19:47:55.525562-04	10	test	3		8	1
149	2015-10-12 19:47:55.529557-04	9	Fall Football kids eventf	3		8	1
150	2015-10-12 19:47:55.53138-04	8	ok	3		8	1
151	2015-10-16 02:46:55.585783-04	11		1		8	1
152	2015-11-10 10:14:05.097873-05	4	salsaking2015	1		5	1
153	2015-11-10 10:14:53.878589-05	4	salsaking2015	2	Changed is_staff and is_superuser.	5	1
154	2015-11-10 10:52:46.877729-05	3	14108 Carrydale Ave	1		18	4
155	2015-11-10 10:52:57.149385-05	14	Northcoast Allstars	1		8	4
156	2015-11-10 10:53:51.979431-05	14	Fundraiser: Northcoast Allstars	1		14	4
157	2015-11-10 11:05:04.508913-05	15	Fundraiser: Marysville Cooperative Preschool	1		14	4
158	2015-11-10 11:08:50.253879-05	14	Fundraiser: Northcoast Allstars	2	Changed description.	14	4
159	2015-11-10 12:18:19.057598-05	15	Marysville Cooperative Preschool	1		8	4
160	2015-11-10 12:19:48.422204-05	16	Fundraiser: Marysville Cooperative Preschool	1		14	4
161	2015-11-10 12:24:34.299394-05	4	14108 Carrydale Ave	1		18	4
162	2015-11-10 12:24:41.343654-05	16	Northcoast Allstars	1		8	4
163	2015-11-10 12:24:51.986751-05	14	Fundraiser: Northcoast Allstars	2	Changed profile.	14	4
164	2015-11-10 12:25:50.427687-05	14	Northcoast Allstars	3		8	4
165	2015-11-10 12:32:28.548443-05	17	Heavyn Rhoades - One Leg At a Time	1		8	4
166	2015-11-10 12:33:23.148261-05	17	Fundraiser: Heavyn Rhoades - One Leg At a Time	1		14	4
167	2015-11-10 12:45:47.779802-05	5	1708 Cady Rd.	1		18	4
168	2015-11-10 12:46:17.70618-05	18	NY Palamino Youth Grouth	1		8	4
169	2015-11-10 12:46:35.085056-05	18	Fundraiser: NY Palamino Youth Group	1		14	4
170	2015-11-10 12:57:16.303584-05	6	6108 Owlwood Dr.	1		18	4
171	2015-11-10 12:57:23.805349-05	19	CNS Winterguard	1		8	4
172	2015-11-10 12:57:55.067258-05	19	Fundraiser: CNS Winterguard	1		14	4
173	2015-11-10 12:58:17.948481-05	20	Fundraiser: CNS Winterguard	1		14	4
174	2015-11-10 13:08:15.167066-05	20	Boy Scout Troop 751 Southgate, Kentucky	1		8	4
175	2015-11-10 13:08:32.996771-05	21	Fundraiser: Boy Sout Troop 751 Southgate, Kentucky	1		14	4
176	2015-11-10 13:24:30.032306-05	7	10520 PIPPIN RD	1		18	4
177	2015-11-10 13:25:43.444761-05	21	Boy Scout Troop 751 Southgate, Kentucky	1		8	4
178	2015-11-10 13:26:06.459291-05	21	Fundraiser: Boy Sout Troop 751 Southgate, Kentucky	2	Changed profile.	14	4
179	2015-11-10 13:32:11.646316-05	8	143 S. School Lane	1		18	4
180	2015-11-10 13:32:15.292809-05	22	EMC Elementary School	1		8	4
181	2015-11-10 13:33:10.405282-05	22	Fundraiser: EMC Elementary School	1		14	4
182	2015-11-10 13:42:25.983299-05	9	1350 Sonora Rd	1		18	4
183	2015-11-10 13:43:47.241482-05	23	Perry Elementary PTO	1		8	4
184	2015-11-10 13:43:53.239848-05	23	Fundraiser: Perry Elementary PTO	1		14	4
185	2015-11-10 14:01:53.509145-05	10	1085 Ward Street	1		18	4
186	2015-11-10 14:02:49.783666-05	24	Marine City Band Boosters	1		8	4
187	2015-11-10 14:02:56.485471-05	24	Fundraiser: Marine City Band Boosters	1		14	4
188	2015-11-10 15:52:16.440323-05	11	8233 Abbott Rd.	1		18	4
189	2015-11-10 15:52:25.097959-05	25	Ranch Horse Youth Group	1		8	4
190	2015-11-10 15:52:34.740615-05	25	Fundraiser: Ranch Horse Youth Group	1		14	4
191	2015-11-10 16:03:55.679664-05	12	207 W. Millersburg St.	1		18	4
192	2015-11-10 16:04:04.875223-05	26	Nashville United Methodist Church	1		8	4
193	2015-11-10 16:04:12.010805-05	26	Fundraiser: Nashville United Methodist Church	1		14	4
194	2015-11-10 16:13:56.206824-05	13	11635 W. Portage River S. Rd.	1		18	4
195	2015-11-10 16:14:03.607028-05	27	Infiniti Dance Team	1		8	4
196	2015-11-10 16:14:08.989362-05	27	Fundraiser: Infiniti Dance Team	1		14	4
197	2015-11-10 16:38:35.341121-05	14	15201 Cowley Rd.	1		18	4
198	2015-11-10 16:38:43.890474-05	28	Grafton Educational Travelers	1		8	4
199	2015-11-10 16:40:16.555326-05	28	Fundraiser: Grafton Educational Travelers	1		14	4
200	2015-11-10 17:01:37.559129-05	15	1810 Valley Ave.	1		18	4
201	2015-11-10 17:02:05.753475-05	29	Powersource Youth Ministry/New Brighton Christian Assembly	1		8	4
202	2015-11-10 17:02:19.929027-05	29	Fundraiser: Powersource Youth Ministry/New Brighton Christian Assembly	1		14	4
203	2015-11-11 09:37:58.333773-05	16	8750 Jane St. NW	1		18	4
204	2015-11-11 09:38:02.448325-05	30	Amherst Elementary School	1		8	4
205	2015-11-11 09:38:10.887651-05	30	Fundraiser: Amherst Elementary School	1		14	4
206	2015-11-11 10:01:26.363283-05	17	1224 Murfreesboro Road	1		18	4
207	2015-11-11 10:01:32.77108-05	31	Southside PAWS Southside Elementary School	1		8	4
208	2015-11-11 10:02:07.751055-05	31	Fundraiser: Southside PAWS Southside Elementary School	1		14	4
209	2015-11-11 10:21:02.785512-05	18	4439 West Jason Road	1		18	4
210	2015-11-11 10:21:10.315604-05	32	The Cattle Company - 4-H Group	1		8	4
211	2015-11-11 10:21:14.922911-05	32	Fundraiser: The Cattle Company - 4-H Group	1		14	4
212	2015-11-11 10:55:06.957496-05	19	300 W Dublin Granville Rd	1		18	4
213	2015-11-11 10:55:10.599036-05	33	Thomas Worthington Science Olympiad	1		8	4
214	2015-11-11 10:55:43.893229-05	33	Fundraiser: Thomas Worthington Science Olympiad	1		14	4
215	2015-11-11 11:04:08.213738-05	20	1499 Hard Road	1		18	4
216	2015-11-11 11:04:10.562245-05	34	Worthington Kilbourne Science Olympiad	1		8	4
217	2015-11-11 11:04:15.558451-05	34	Fundraiser: Worthington Kilbourne Science Olympiad	1		14	4
218	2015-11-11 11:25:49.722765-05	21	560 West Taylor Street	1		18	4
219	2015-11-11 11:25:53.536383-05	35	Ridgemont High School - Europe 2016	1		8	4
220	2015-11-11 11:26:41.944851-05	35	Fundraiser: Ridgemont High School - Europe 2016	1		14	4
221	2015-11-11 11:38:45.225701-05	36	Fundraiser: Ridgemont High School - Europe 2016	1		14	4
222	2015-11-11 11:45:33.045824-05	22	15201 Cowley Rd.	1		18	4
223	2015-11-11 11:45:36.297417-05	36	Grafton Educational Travelers	1		8	4
224	2015-11-11 11:45:43.929426-05	37	Fundraiser: Grafton Educational Travelers	1		14	4
225	2015-11-11 11:49:27.753972-05	35	Ridgemont High School - Europe 2016	2	Changed phone_number.	8	4
226	2015-11-11 11:56:15.10691-05	25	Fundraiser: Ranch Horse Youth Group	2	Changed description.	14	4
227	2015-11-11 11:57:06.612589-05	36	Grafton Educational Travelers	3		8	4
228	2015-11-11 11:58:57.702603-05	28	Fundraiser: Grafton Educational Travelers	2	Changed description.	14	4
229	2015-11-11 12:06:22.480046-05	23	4151 Clifford Rd.	1		18	4
230	2015-11-11 12:06:25.43772-05	37	NBHS Equestrian Teams	1		8	4
231	2015-11-11 12:06:29.693504-05	38	Fundraiser: NBHS Equestrian Teams	1		14	4
232	2015-11-11 12:19:01.692812-05	24	4433 Seemsville Rd.	1		18	4
233	2015-11-11 12:19:06.293456-05	38	People to People Australian Adventure	1		8	4
234	2015-11-11 12:19:13.739521-05	39	Fundraiser: People to People Australian Adventure	1		14	4
235	2015-11-11 12:28:35.698086-05	32	Fundraiser: The Cattle Company - 4-H Group	2	Changed description.	14	4
236	2015-11-11 12:41:16.275649-05	25	Market and North 7th Streets	1		18	4
237	2015-11-11 12:44:15.244494-05	26	Market and North 7th Streets	1		18	4
238	2015-11-11 12:44:29.705296-05	39	St. John's Lutheran Church Zanesville OH	1		8	4
239	2015-11-11 12:44:53.241577-05	40	Fundraiser: St. John's Lutheran Church, Zanesville OH\r\n	1		14	4
240	2015-11-16 12:38:13.535803-05	27	722 N High School Rd.	1		18	4
241	2015-11-16 12:38:16.757594-05	41	Maniacs Softball 12U	1		8	4
242	2015-11-16 12:38:22.852951-05	42	Fundraiser: Maniacs Softball 12U	1		14	4
243	2015-11-16 13:02:19.375588-05	42	Whitehall High School Spanish NHS	1		8	4
244	2015-11-16 13:02:25.226837-05	43	Fundraiser: Whitehall High School Spanish NHS\r\n	1		14	4
245	2015-11-16 13:10:20.74568-05	43	Chrissy Melton Cheer	1		8	4
246	2015-11-16 13:10:23.880784-05	44	Fundraiser: Chrissy Melton Cheer	1		14	4
247	2015-11-16 13:30:06.442803-05	44	Hocking Valley Community Hospital TWIG IV	1		8	4
248	2015-11-16 13:30:11.503383-05	45	Fundraiser: Hocking Valley Community Hospital TWIG IV	1		14	4
249	2015-11-16 13:40:13.111459-05	28	184 Indian Ridge Dr.	1		18	4
250	2015-11-16 13:40:15.108159-05	45	Piketon High Cheer	1		8	4
251	2015-11-16 13:40:19.944236-05	46	Fundraiser: Piketon High Cheer\r\n	1		14	4
252	2015-11-16 13:46:47.125616-05	28	Fundraiser: Grafton Educational Travelers	2	Changed description.	14	4
253	2015-11-16 13:58:02.225549-05	29	237 Carmel Woods	1		18	4
254	2015-11-16 13:58:03.603717-05	46	Eagles Baseball	1		8	4
255	2015-11-16 13:58:07.944635-05	47	Fundraiser: Eagles Baseball	1		14	4
256	2015-11-16 14:05:10.667307-05	30	8176 New Haven Rd.	1		18	4
257	2015-11-16 14:05:12.168534-05	47	Off The Edge Dance	1		8	4
258	2015-11-16 14:05:15.502218-05	48	Fundraiser: Off The Edge Dance	1		14	4
259	2015-11-16 14:15:29.580798-05	48	Westerville FWB Youth Nationals	1		8	4
260	2015-11-16 14:15:32.149024-05	49	Fundraiser: Westerville FWB Youth Nationals	1		14	4
261	2015-11-16 14:43:12.638902-05	49	Tri City Chorus	1		8	4
262	2015-11-16 14:43:16.959977-05	50	Fundraiser: Tri City Chorus	1		14	4
263	2015-11-16 14:56:49.583646-05	50	Arsenal Soccer Club - Woodville	1		8	4
264	2015-11-16 14:56:53.411528-05	51	Fundraiser: Arsenal Soccer Club - Woodville	1		14	4
265	2015-11-16 15:08:58.296177-05	31	46346 County Road 495	1		18	4
266	2015-11-16 15:08:59.925313-05	51	River View Cross Country	1		8	4
267	2015-11-16 15:09:04.24753-05	52	Fundraiser: River View Cross Country	1		14	4
268	2015-11-16 15:19:06.100673-05	16	Northcoast Allstars	2	Changed email.	8	4
269	2015-11-16 15:21:18.73407-05	14	Fundraiser: Northcoast Allstars	2	Changed description.	14	4
270	2015-11-17 11:03:54.983707-05	32	298 Norwich-Westerly Rd.	1		18	4
271	2015-11-17 11:03:57.275953-05	52	Wheeler Middle School	1		8	4
272	2015-11-17 11:04:01.415511-05	53	Fundraiser: Wheeler Middle School	1		14	4
273	2015-11-17 11:25:09.362698-05	33	119 Hillary Circle	1		18	4
274	2015-11-17 11:25:10.857893-05	53	Missouri Stixx Baseball Team	1		8	4
275	2015-11-17 11:25:14.114615-05	54	Fundraiser: Missouri Stixx Baseball Team	1		14	4
276	2015-11-17 11:45:29.913773-05	54	MSU Organization of Athletic Training	1		8	4
277	2015-11-17 11:45:36.713057-05	55	Fundraiser: MSU Organization of Athletic Training	1		14	4
278	2015-11-17 11:55:11.363704-05	34	6373 King Rd.	1		18	4
279	2015-11-17 11:55:13.286431-05	55	Marine City Middle School PTO	1		8	4
280	2015-11-17 11:55:16.470116-05	56	Fundraiser: Marine City Middle School PTO	1		14	4
281	2015-11-17 12:17:41.281177-05	35	5058 Dixie Highway	1		18	4
282	2015-11-17 12:17:42.545116-05	56	Fairfield Central PTC	1		8	4
283	2015-11-17 12:17:50.101043-05	57	Fundraiser: Fairfield Central PTC	1		14	4
284	2015-11-17 12:25:00.295626-05	35	Ridgemont High School	2	Changed organization.	8	4
285	2015-11-17 12:26:42.457443-05	35	Fundraiser: Ridgemont High School - Europe 2016	3		14	4
286	2015-11-17 12:27:29.502748-05	36	Fundraiser: Ridgemont High School	2	Changed title and description.	14	4
287	2015-11-17 12:29:59.074695-05	36	Fundraiser: Ridgemont High School	2	Changed description.	14	4
288	2015-11-17 12:37:31.136871-05	36	1068 Krumm Rd	1		18	4
289	2015-11-17 12:37:33.281525-05	57	St Joseph Health Systems Relay for Life Team	1		8	4
290	2015-11-17 12:37:47.344066-05	58	Fundraiser: St Joseph Health Systems Relay for Life Team	1		14	4
291	2015-11-17 12:55:33.481751-05	37	405 W Zimmerman Street	1		18	4
292	2015-11-17 12:55:34.965018-05	58	Riveredale Band Parent Organization	1		8	4
293	2015-11-17 12:55:38.745557-05	59	Fundraiser: Riverdale Band Parent Organization	1		14	4
294	2015-11-17 13:05:24.406239-05	38	11589 State Route 81	1		18	4
295	2015-11-17 13:05:25.784974-05	59	Hardin Northern Awakened Commotion	1		8	4
296	2015-11-17 13:05:33.406851-05	60	Fundraiser: Hardin Northern Awakened Commotion\r\n	1		14	4
297	2015-11-17 13:14:47.897803-05	39	274 W. Glendale	1		18	4
298	2015-11-17 13:14:50.095006-05	60	Boy Scout Troop 399	1		8	4
299	2015-11-17 13:14:53.769481-05	61	Fundraiser: Boy Scout Troop 399\r\n	1		14	4
300	2015-11-17 13:41:19.453553-05	40	16 Francis Green Circle	1		18	4
301	2015-11-17 13:41:21.814998-05	61	Institute of Notre Dame Post Prom Committee	1		8	4
302	2015-11-17 13:41:33.019635-05	62	Fundraiser: Institute of Notre Dame Post Prom Committee	1		14	4
303	2015-11-17 14:46:55.54128-05	62	Jonathan Alder High School - Italy/Switzerland 2015	1		8	4
304	2015-11-17 14:47:09.45652-05	63	Fundraiser: Jonathan Alder High School\r\n-Italy/Switzerland Trip June 2015	1		14	4
305	2015-11-17 15:13:21.301624-05	41	5 John Street	1		18	4
306	2015-11-17 15:13:23.179648-05	63	Valley Equestrian 4-H	1		8	4
307	2015-11-17 15:13:25.803904-05	64	Fundraiser: Valley Equestrian 4-H	1		14	4
308	2015-11-30 10:54:33.08745-05	13	Fundraiser: matt harlin fundraiser	3		14	4
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 308, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	cors model	corsheaders	corsmodel
2	log entry	admin	logentry
3	permission	auth	permission
4	group	auth	group
5	user	auth	user
6	content type	contenttypes	contenttype
7	session	sessions	session
8	profile	account	profile
9	fundraiser order comment	comment	fundraiserordercomment
10	user comment	comment	usercomment
11	product	product	product
12	product image	product	productimage
13	category	product	category
14	fundraiser	fundraiser	fundraiser
16	fundraiser category	fundraiser	fundraisercategory
17	fundraiser type	fundraiser	fundraisertype
18	address	address	address
19	shipment	shipment	shipment
20	selection	shipment	selection
21	generic discount	marketing	genericdiscount
22	single discount	marketing	singlediscount
23	email news letter	marketing	emailnewsletter
24	payment	payment	payment
25	fundraiser type title	fundraiser	fundraisertypetitle
26	password reset	account	passwordreset
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-10-06 09:46:21.017672-04
2	auth	0001_initial	2015-10-06 09:46:21.107675-04
3	address	0001_initial	2015-10-06 09:46:21.122709-04
4	account	0001_initial	2015-10-06 09:46:21.185499-04
5	admin	0001_initial	2015-10-06 09:46:21.255747-04
6	product	0001_initial	2015-10-06 09:46:21.3252-04
7	product	0002_auto_20150726_0322	2015-10-06 09:46:21.388453-04
8	product	0003_remove_category_product_type	2015-10-06 09:46:21.418863-04
9	product	0004_product_image	2015-10-06 09:46:21.461694-04
10	product	0005_auto_20150726_1404	2015-10-06 09:46:21.501615-04
11	product	0006_auto_20150805_1918	2015-10-06 09:46:21.544193-04
12	product	0007_category_order	2015-10-06 09:46:21.589802-04
13	product	0008_category_slug	2015-10-06 09:46:21.640195-04
14	product	0009_product_featured	2015-10-06 09:46:21.695155-04
15	product	0010_product_best_seller	2015-10-06 09:46:21.801752-04
16	fundraiser	0001_initial	2015-10-06 09:46:22.30482-04
17	comment	0001_initial	2015-10-06 09:46:22.408429-04
18	comment	0002_auto_20151006_1346	2015-10-06 09:46:22.670136-04
19	marketing	0001_initial	2015-10-06 09:46:22.966456-04
20	payment	0001_initial	2015-10-06 09:46:23.12798-04
21	sessions	0001_initial	2015-10-06 09:46:23.140764-04
22	shipment	0001_initial	2015-10-06 09:46:23.499289-04
23	fundraiser	0002_auto_20151006_1522	2015-10-06 11:22:29.11266-04
24	fundraiser	0003_auto_20151006_1529	2015-10-06 11:29:12.419173-04
25	fundraiser	0004_fundraisercategory_popular	2015-10-06 11:30:29.726154-04
26	fundraiser	0005_auto_20151006_1551	2015-10-06 11:51:44.587084-04
27	fundraiser	0006_auto_20151006_1613	2015-10-06 12:13:34.252973-04
28	fundraiser	0007_fundraisertypetitle	2015-10-06 23:22:48.752191-04
29	fundraiser	0008_remove_fundraisercategory_type	2015-10-06 23:27:29.582579-04
30	fundraiser	0009_fundraisercategory_type	2015-10-06 23:28:03.062278-04
31	account	0002_passwordreset	2015-10-08 10:02:47.185142-04
32	account	0003_auto_20151008_1514	2015-10-08 11:14:54.415991-04
33	fundraiser	0010_fundraisertype_forms	2015-10-08 21:32:04.497538-04
34	fundraiser	0011_fundraisertype_ordering	2015-10-08 21:39:00.32516-04
35	fundraiser	0012_auto_20151009_0139	2015-10-08 21:39:55.546322-04
36	fundraiser	0013_remove_fundraisercategory_forms	2015-10-09 10:12:33.794855-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_migrations_id_seq', 36, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
l1lwjp8iwcmnnuwxb6nt4h4k2lshf8sz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-10-23 10:40:59.189144-04
1ejxddi3yuod8005cjej6w1bke3cj3ay	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-24 09:36:30.685068-04
lwsdv5qsnbds4a252m05r5ugo4mev0ja	MDdlOGJmNDU2NjgzNzY3NGE5ZGJjZjUzODRiNmMzYzM0YmQ4MmYwMDp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjoxMCwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJvcmRlcl9zdGVwIjpudWxsLCJmaW5hbGl6ZWRfb3JkZXIiOjEwLCJfYXV0aF91c2VyX2hhc2giOiI3MWUzMTI2N2IzZGI4YTg2NWM5MzRkYjAwNWI3MmVjZGIzMGUwZjVkIn0=	2015-10-26 18:12:43.621029-04
9bcqbeevgb8narytcz5wzqnob9g7htda	MDI1NzBhZWY5MWIzOWE2ODMwNTc4OWI5ZDNlYWViNDM1MWU2ZjFkYzp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjoxMSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJvcmRlcl9zdGVwIjpudWxsLCJmaW5hbGl6ZWRfb3JkZXIiOjExLCJfYXV0aF91c2VyX2hhc2giOiI3MWUzMTI2N2IzZGI4YTg2NWM5MzRkYjAwNWI3MmVjZGIzMGUwZjVkIn0=	2015-10-26 18:23:09.278092-04
wljhoncp8czeq5g0x8203w1p85mn5owf	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-10-26 20:54:46.482608-04
su2l6r00ws5eoeftp87szxzevvb8t4ni	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-10-27 01:00:24.194594-04
bx4my2h75m5b4nt053fjlj6e0hldvxmd	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-10-27 09:26:30.370397-04
sfuv2btj04tyrbuv5yg1mgrlgkoxc3ro	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-10-27 11:10:13.960563-04
0f1e2bzww9kxvjxjxyetrz0d70f6nvb7	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-10-29 10:10:29.281363-04
9ps4u7472j00n8ig8qn7m9dk91z4vyem	ZjYyOWFiOTAzMjZkMWRiZDEwZDc5NTg1MjFiZGI3YTM4ZGMwMTYwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzFlMzEyNjdiM2RiOGE4NjVjOTM0ZGIwMDViNzJlY2RiMzBlMGY1ZCIsInNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoxfQ==	2015-10-30 02:45:11.608407-04
ep3suuxe3it2fdjw9omu3i5eg17lm371	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-10-30 21:46:08.553244-04
r6quknh5y3oww56z3t0zm100jpb7yggq	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-01 23:33:51.134895-05
ehrlqducirb3g4rqyoh3tb2wrvqjw6od	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-02 10:25:46.593051-05
c1fbslnqt7wrrtcun2g1dfrw858yecut	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-03 08:40:21.487371-05
50jejo9es0kfvp9yvivnfq9ll428jde6	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-04 12:49:24.968654-05
vqd2cgmsj7o7ephx02qd63u5dzlzlcla	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-09 04:25:39.921735-05
gjaj0ympzzbsrisw9t9irwbbcwjzbzdi	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-09 10:15:50.177469-05
kb9jz0dlosoyyb8irrheo0pgyhqw6kod	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 13:38:54.848888-05
6h5zck4lfzkqmyrkqkr3lvfzirq4oer2	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:01:31.394226-05
n0o7y74yfxcj5crmveqzw08ucawmfdte	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:01:31.747869-05
sz024dkn5uoq8agw8vhab2zyd8gd8xve	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:01:33.222546-05
bqqx6e0sf8i0pwtmj4mo5k50vyot8lrl	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:01:41.411301-05
w07dnwwz1644kf6vo3i4t81rw4x27q6o	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:01:47.909249-05
z1w2uldf8793ngwdwf7ua4k0u99uywcr	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:06:06.905372-05
olmbx6kjw7f9nry4i3b9ovrfd20wr0t9	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:07:52.985599-05
vyjyqyg2b2p9xepzkqo65xlnkl916dan	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:13:15.207418-05
zkf3hrbcsjmg89g35aku4jy1oxh9uub4	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:13:22.167699-05
ss01icvrd2sba0myh2rhsmqdriuvrdpc	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:18:36.058748-05
r1fp00qkbvh8si9yltpssje87q4zjqsd	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:19:36.261341-05
r9nwpwb8agja9nhhm23lhtdawa31t15y	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:20:34.97304-05
cauh2dyplqsgzy3w5fsxnatppm0sk7e0	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:21:26.130207-05
ja7tu96o0fcawfq476nu5gejipajaokl	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:22:47.239074-05
fdlt8dlv18wlblzk5vxb7xk42bobuesq	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:23:05.780991-05
37y3vs64z582iz797dgymaurckgb0m9i	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:27:15.083132-05
7ihaume1hezzezetir2nnp51eqv0u5qa	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:28:25.747044-05
cqkkmfx085iup7v83rm2y7ffncnwgehw	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:29:42.774734-05
saj7pwijtxfaxbvq9n4ne310v8h636p8	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:35:45.053767-05
m2nl5vmcath9ip9jh1i5lqz0zhf8854m	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:47:06.49389-05
lpb553modtp1esgn39m0ufggi64nr8r6	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 14:57:35.799757-05
pa0x7jdd2ncwtrnrwglek5m8jg18m9p7	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 15:01:16.601158-05
500hocz7mh83z8gf237w7yxufbix3m25	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 15:01:42.507474-05
ths29q427vuuw1ox4lidr9fjs50qf6ul	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-13 15:05:05.347188-05
hnk57vm5xf8ho69vuht4vu4e56n4e333	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-15 12:33:54.288814-05
wxrtrhi5q77u8nt4nvut89vsklrb5kj9	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-15 12:33:54.409404-05
k4ufh56yytsiotf7c3ywa7bupmiwdjvb	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-16 00:40:15.885635-05
jrw30ym8cce3r6wiu60dnz0a9x8d9l3y	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-17 14:09:18.930509-05
hhawqrcmdh2btycuh0zgrtbi83bl8sxu	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-21 14:04:23.201406-05
az6vp1isyez71i3rj0j6xi8w43pom607	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-22 07:41:06.064863-05
yzdfh9qairuovsm03rc1kl1qoro3xegq	N2I2ZjFkOTFhNGM1ZjBmYTEwY2VjZWU0YTA0NDM0YzMzYmIwYzAxYjp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjo2NiwiX2F1dGhfdXNlcl9pZCI6NSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJvcmRlcl9zdGVwIjpudWxsLCJmaW5hbGl6ZWRfb3JkZXIiOjY2LCJfYXV0aF91c2VyX2hhc2giOiI3OTRjM2YxOTFjODY4ZmFmZTkyM2RlMzkwNjkzMWNiNmNiYWI4NGZkIn0=	2015-12-10 20:12:09.777941-05
oti6g97a4q0jhkslf4z3na18z5j3rnn2	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-11 11:00:36.376549-05
cc3t4x7foppkalbrlweuw7itwqsv06oe	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-11 16:53:07.916858-05
wrilg9j4v7i73zocwln3zxc2gj8jglyl	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-12 08:49:19.017219-05
p7bftxqtw3k0pzm2csxcu7jpqf511mkh	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-12-14 12:19:27.766126-05
cdjdj47wj1cl7v8zt6bh0csb7p5miuxg	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-12-14 13:31:17.951243-05
mc1m3xlpkl6uo7glumrxx9uqkuighffs	NmNjMGY0ZmFhNjhmOWNjMmMzZGU0NjMzYWVhZjA0MWRiMTI1YzRlNTp7ImN1cnJlbnRfZnVuZHJhaXNlciI6MTIsInNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsLCJvcmRlcl9zdGVwIjoic2VsZWN0aW9ucyJ9	2015-11-20 19:09:15.626111-05
awkfm2jid1zys9kjs9d9kdvobohp8zrp	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-24 11:35:27.259127-05
ho6ph7haoboqur64tq5womag52oydssg	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-24 11:48:10.361404-05
k8b37ts5vpoltfn5pdz2c4ppbdh0gc2b	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-25 11:24:34.583877-05
godrtex1pfe4wdcj33yzlfjcu6mtiwxz	N2EzNDM3MGEwMDgzNTdmNzJlY2QxNThmM2JhMzM5YWEwOGFmYmFiNTp7ImN1cnJlbnRfZnVuZHJhaXNlciI6NDEsInNlc3Npb25fZmluYWxpemVkX29yZGVyIjo0MSwib3JkZXJfc3RlcCI6InNlbGVjdGlvbnMifQ==	2015-11-26 10:15:16.717455-05
vlktgrl9tq8cqt6dv0vnduc9q4py530u	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-27 21:47:49.969227-05
wdn9ov9l6hrxc3lc3feyc7wwrq7kbatu	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-11-27 22:44:55.302464-05
vexmhtz9aea4lo60ebiw17cao33dr0c4	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-01 05:53:37.588329-05
wtj5w3lowi5lesb2yxxr63t6fagofhqg	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-01 05:53:37.809458-05
z0n641kg0kntv69gnd9nqpk51bltnzy8	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-02 17:38:34.271688-05
wf87c91jf4yk4fgb8bie2l9yt9t303je	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-02 20:05:32.26724-05
cp9xfuunbunoedlx3asiywgx52w3ro6q	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-04 04:22:07.384863-05
wke7fdnn4gprpl91k7qp1yxxh2vn9nax	OTAyYmMxNTg5NjdkZWJjZGY1ZDhhZTk5MTZjMWFkZDc3NjJhNmFlNDp7ImN1cnJlbnRfZnVuZHJhaXNlciI6NjUsInNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsLCJvcmRlcl9zdGVwIjoiY2hvb3NlX2Z1bmRyYWlzZXIifQ==	2015-12-04 14:18:31.701737-05
ccjdliuv6ai4nr0qtk63qt4d6mcx36od	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-04 14:40:36.388907-05
57u9kotj6kcwwh7s7x2ygymnd9r5mnus	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-05 17:34:57.909828-05
8d0t463whbk202484ogz1m9j7oafpura	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-06 22:19:29.48039-05
9k2xdthknuzo3kopqb5y7n1yl65qytie	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-07 09:44:31.645444-05
56tsgk478lr96ogbprfifl8sb2zxpvss	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-07 23:00:39.473915-05
ryo1bijbeakkhsdm39vj96h4hiy5gkf2	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-07 23:18:12.021587-05
dmo1pt6pilwdj5r8a2cm8i0qmur4pkdb	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-08 09:10:59.799906-05
bb34012kv5ruhwnygtqbu9apuh3r1oy8	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-08 09:11:00.086979-05
siv5q8jubvdjvje0bvij7539r1btvj17	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-09 18:47:00.969735-05
7h96036ol1bd4yliid2camxvdek9v2lg	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-10 07:57:25.004838-05
61ig7jxuauru72ikcifru0ywsb4dy5fe	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-10 14:08:17.825635-05
copjqvsbmmi63wqkn2gt6op0trgoqoq0	MmFjYWI2YTllYWVhNmE1MzRjZGQyYzFkMWVkMGYyOTU5MGYxMTZlODp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjpudWxsfQ==	2015-12-10 15:24:35.172077-05
\.


--
-- Data for Name: fundraiser_fundraiser; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraiser (id, title, description, status, finalized, created, updated, discount, slug, receipt_email_sent, account_id, plan_id, profile_id, type_id) FROM stdin;
41	HELP Homeschool	We encourage the homeschool kids to sell salsa to offset the cost of tuition for homeschool education programs.  This will be our second year with this fundraiser.	in-process	f	2015-11-12 10:14:59.703292-05	2015-11-12 10:15:16.480437-05	0.00	\N	f	\N	13	40	1
12	Salsa Celebration	We are raising funds to help better celebrate all that St. Andrew's has to offer. 	in-process	f	2015-11-06 18:59:38.759493-05	2015-11-06 19:08:58.891035-05	0.00	\N	f	\N	13	12	1
42	Maniacs Softball 12U	Submitted: 5/21/2015\r\nDelivered:\r\n$378.00	paid	f	2015-11-16 12:38:22.849939-05	2015-11-16 12:38:22.849982-05	0.00	\N	f	\N	13	41	1
15	Marysville Cooperative Preschool		paid	f	2015-11-10 11:05:04.504616-05	2015-11-10 11:05:04.504661-05	0.00	\N	f	\N	13	\N	1
43	Whitehall High School Spanish NHS\r\n	Submitted: 05/27/2015\r\nDelivered: \r\n$240.00	paid	f	2015-11-16 13:02:25.223305-05	2015-11-16 13:02:25.223352-05	0.00	\N	f	\N	13	42	1
16	Marysville Cooperative Preschool	Submitted: 3/3/2015\r\nDelivered: 3/26/2015\r\n$375.00	paid	f	2015-11-10 12:19:48.414567-05	2015-11-10 12:19:48.414636-05	0.00	\N	f	\N	13	15	1
17	Heavyn Rhoades - One Leg At a Time	Submitted: 1/14/2015\r\nDelivered: 1/23/2015\r\n$201.00	paid	f	2015-11-10 12:33:23.143217-05	2015-11-10 12:33:23.143262-05	0.00	\N	f	\N	13	17	1
18	NY Palamino Youth Group	Submitted: 01/21/2015\r\nDelivered: \r\n$160.00	paid	f	2015-11-10 12:46:35.080509-05	2015-11-10 12:46:35.080553-05	0.00	\N	f	\N	13	18	1
19	CNS Winterguard	Submitted: 01/22/2015\r\nDelivered: \r\n$126.00	\N	f	2015-11-10 12:57:55.062948-05	2015-11-10 12:57:55.062994-05	0.00	\N	f	\N	13	19	1
20	CNS Winterguard	Submitted: 01/22/2015\r\nDelivered: \r\n$126.00	paid	f	2015-11-10 12:58:17.945597-05	2015-11-10 12:58:17.94564-05	0.00	\N	f	\N	13	19	1
21	Boy Sout Troop 751 Southgate, Kentucky	Submitted: 02/05/2015\r\nDelivered: 02/16/2015\r\n$288.00	paid	f	2015-11-10 13:08:32.992786-05	2015-11-10 13:26:06.456585-05	0.00	\N	f	\N	13	21	1
22	EMC Elementary School	Submitted: 02/23/2015\r\nDelivered: 03/05/2015\r\n$726.00	paid	f	2015-11-10 13:33:10.401971-05	2015-11-10 13:33:10.402014-05	0.00	\N	f	\N	13	22	1
23	Perry Elementary PTO	Submitted: 02/23/2015\r\nDelivered: 03/05/2015\r\n$393.00	paid	f	2015-11-10 13:43:53.236538-05	2015-11-10 13:43:53.236585-05	0.00	\N	f	\N	13	23	1
24	Marine City Band Boosters	Submitted: 02/25/2015\r\nDelivered: \r\n$1953.00	paid	f	2015-11-10 14:02:56.482209-05	2015-11-10 14:02:56.482254-05	0.00	\N	f	\N	13	24	1
26	Nashville United Methodist Church	Submitted: 03/09/2015\r\nDelivered: 03/20/2015\r\n$288.00	paid	f	2015-11-10 16:04:12.007319-05	2015-11-10 16:04:12.007364-05	0.00	\N	f	\N	13	26	1
27	Infiniti Dance Team	Submitted: 03/15/2015\r\nDelivered: \r\n$333.00	paid	f	2015-11-10 16:14:08.986358-05	2015-11-10 16:14:08.986394-05	0.00	\N	f	\N	13	27	1
29	Powersource Youth Ministry/New Brighton Christian Assembly	Submitted: 03/27/2015\r\nDelivered: 04/06/2015\r\n$408.00	paid	f	2015-11-10 17:02:19.924389-05	2015-11-10 17:02:19.924434-05	0.00	\N	f	\N	13	29	1
30	Amherst Elementary School	Submitted: 03/28/2015\r\nDelivered: 04/03/2015\r\n$1350.00	paid	f	2015-11-11 09:38:10.883887-05	2015-11-11 09:38:10.884248-05	0.00	\N	f	\N	13	30	1
31	Southside PAWS Southside Elementary School	Submitted: 03/31/2015\r\nDelivered: 04/06/2015\r\n$3540.00	paid	f	2015-11-11 10:02:07.747428-05	2015-11-11 10:02:07.747474-05	0.00	\N	f	\N	13	31	1
33	Thomas Worthington Science Olympiad	Submitted: 04/10/2015\r\nDelivered: 04/16/2015\r\n$144.00	paid	f	2015-11-11 10:55:43.888403-05	2015-11-11 10:55:43.888449-05	0.00	\N	f	\N	13	33	1
34	Worthington Kilbourne Science Olympiad	Submitted: 04/10/2015\r\nDelivered: 04/16/2015\r\n$468.00	paid	f	2015-11-11 11:04:15.555646-05	2015-11-11 11:04:15.555687-05	0.00	\N	f	\N	13	34	1
25	Ranch Horse Youth Group	Submitted: 03/02/2015\r\nDelivered: 03/05/2015\r\n$1272.00\r\n\r\nSubmitted: 05/05/2015\r\nDelivered:\r\n$87.00	paid	f	2015-11-10 15:52:34.736886-05	2015-11-11 11:56:15.102994-05	0.00	\N	f	\N	13	25	1
53	Wheeler Middle School	Submitted: 10/01/2015\r\nDelivered: 10/20/2015\r\n$315.00	paid	f	2015-11-17 11:04:01.411735-05	2015-11-17 11:04:01.411779-05	0.00	\N	f	\N	13	52	1
38	NBHS Equestrian Teams	Submitted: 05/05/2015\r\nDelivered:\r\n$195.00	paid	f	2015-11-11 12:06:29.68953-05	2015-11-11 12:06:29.689599-05	0.00	\N	f	\N	13	37	1
39	People to People Australian Adventure	Submitted: 05/14/2015\r\nDelivered: \r\n$339.00	paid	f	2015-11-11 12:19:13.736064-05	2015-11-11 12:19:13.73611-05	0.00	\N	f	\N	13	38	1
32	The Cattle Company - 4-H Group	Submitted: 04/02/2015\r\nDelivered: 04/06/2015\r\n$705.00\r\n\r\nSubmitted: 05/15/2015\r\nDelivered: 06/02/2015\r\n$144.00	paid	f	2015-11-11 10:21:14.919578-05	2015-11-11 12:28:35.694601-05	0.00	\N	f	\N	13	32	1
40	St. John's Lutheran Church, Zanesville OH\r\n	Submitted: 05/06/2015\r\nDelivered:\r\n$423.00	paid	f	2015-11-11 12:44:53.237295-05	2015-11-11 12:44:53.23734-05	0.00	\N	f	\N	13	39	1
44	Chrissy Melton Cheer	Submitted: 06/08/2015\r\nDelivered:\r\n$772.50	paid	f	2015-11-16 13:10:23.877677-05	2015-11-16 13:10:23.877713-05	0.00	\N	f	\N	13	43	1
45	Hocking Valley Community Hospital TWIG IV	Submitted: 06/08/2015\r\nDelivered:\r\n$288.00	paid	f	2015-11-16 13:30:11.50003-05	2015-11-16 13:30:11.500077-05	0.00	\N	f	\N	13	44	1
46	Piketon High Cheer\r\n	Submitted: 07/03/2015\r\nDelivered: 07/28/2015\r\n$870.00	paid	f	2015-11-16 13:40:19.94157-05	2015-11-16 13:40:19.941607-05	0.00	\N	f	\N	13	45	1
28	Grafton Educational Travelers	Submitted: 03/25/2015\r\nDelivered: 04/03/2015\r\n$360.00\r\n\r\nSubmitted: 04/27/2015\r\nDelivered: 04/29/2015\r\n$498.00\r\n\r\nSubmitted: 07/24/2015\r\nDelivered: 07/29/2015\r\n$288.00	paid	f	2015-11-10 16:40:16.551234-05	2015-11-16 13:46:47.121815-05	0.00	\N	f	\N	13	28	1
47	Eagles Baseball	Submitted: 07/14/2015\r\nDelivered: 07/23/2015\r\n$480.00	paid	f	2015-11-16 13:58:07.940847-05	2015-11-16 13:58:07.940901-05	0.00	\N	f	\N	13	46	1
48	Off The Edge Dance	Submitted: 07/17/2015\r\nDelivered: 08/06/2015\r\n$1599.00	paid	f	2015-11-16 14:05:15.49798-05	2015-11-16 14:05:15.498026-05	0.00	\N	f	\N	13	47	1
49	Westerville FWB Youth Nationals	Submitted: 08/05/2015\r\nDelivered: 08/13/2015\r\n$135.00	paid	f	2015-11-16 14:15:32.14553-05	2015-11-16 14:15:32.145568-05	0.00	\N	f	\N	13	48	1
50	Tri City Chorus	Submitted: 08/12/2015\r\nDelivered: 08/27/2015\r\n$264.00	paid	f	2015-11-16 14:43:16.956622-05	2015-11-16 14:43:16.956664-05	0.00	\N	f	\N	13	49	1
51	Arsenal Soccer Club - Woodville	Submitted: 09/14/2015\r\nDelivered: \r\n$1001.00	paid	f	2015-11-16 14:56:53.40827-05	2015-11-16 14:56:53.408312-05	0.00	\N	f	\N	13	50	1
52	River View Cross Country	Submitted: 09/25/2015\r\nDelivered: \r\n$1461.00	paid	f	2015-11-16 15:09:04.243188-05	2015-11-16 15:09:04.243252-05	0.00	\N	f	\N	13	51	1
14	Northcoast Allstars	Submitted: 1/15/2015\r\nDelivered 1/23/2015\r\n$579.00\r\n\r\nSubmitted: 09/30/2015\r\nDelivered: 10/07/2015\r\n$579.00	paid	f	2015-11-10 10:53:51.975067-05	2015-11-16 15:21:18.731242-05	0.00	\N	f	\N	13	16	1
54	Missouri Stixx Baseball Team	Submitted: 10/06/2015\r\nDelivered: 10/20/2015\r\n$315.00	paid	f	2015-11-17 11:25:14.11126-05	2015-11-17 11:25:14.1113-05	0.00	\N	f	\N	13	53	1
55	MSU Organization of Athletic Training	Submitted: 09/23/2015\r\nDelivered: 10/27/2015\r\n$453.00	paid	f	2015-11-17 11:45:36.709567-05	2015-11-17 11:45:36.709611-05	0.00	\N	f	\N	13	54	1
56	Marine City Middle School PTO	Submitted: 11/08/2015\r\nDelivered: 11/16/2015\r\n$165.00	paid	f	2015-11-17 11:55:16.466573-05	2015-11-17 11:55:16.466617-05	0.00	\N	f	\N	13	55	1
57	Fairfield Central PTC	Submitted: 10/15/2015\r\nDelivered: 10/28/2015\r\n$4554.00	paid	f	2015-11-17 12:17:50.097393-05	2015-11-17 12:17:50.097442-05	0.00	\N	f	\N	13	56	1
59	Riverdale Band Parent Organization	Submitted: 10/16/2015\r\nDelivered: 11/04/2015\r\n$177.00	paid	f	2015-11-17 12:55:38.739671-05	2015-11-17 12:55:38.739733-05	0.00	\N	f	\N	13	58	1
36	Ridgemont High School	Europe 2016\r\nSubmitted: 04/16/2015\r\nDelivered: \r\n$741.00\r\n\r\nSubmitted:10/07/2015\r\nDelivered:10/29/2015\r\n$660.00	paid	f	2015-11-11 11:38:45.22089-05	2015-11-17 12:29:59.070385-05	0.00	\N	f	\N	13	35	1
58	St Joseph Health Systems Relay for Life Team	Submitted: 10/12/2015\r\nDelivered: 10/29/2015\r\n$360.00	paid	f	2015-11-17 12:37:47.339786-05	2015-11-17 12:37:47.339854-05	0.00	\N	f	\N	13	57	1
60	Hardin Northern Awakened Commotion\r\n	Submitted: 10/21/2015\r\nDelivered: 11/04/2015\r\n$408.00	paid	f	2015-11-17 13:05:33.403306-05	2015-11-17 13:05:33.40335-05	0.00	\N	f	\N	13	59	1
61	Boy Scout Troop 399\r\n	Submitted: 10/27/2015\r\nDelivered: 11/04/2015\r\n$750.00	paid	f	2015-11-17 13:14:53.764804-05	2015-11-17 13:14:53.764848-05	0.00	\N	f	\N	13	60	1
62	Institute of Notre Dame Post Prom Committee	Submitted: 11/17/2014 By Paula Darrah, pjd@wmdlaw.com\r\nDelivered: \r\n$288.00\r\n\r\nSubmitted: 10/27/2015 By Terry Little, terry.little@zurichna.com\r\nDelivered:11/11/2015\r\n$288.00	paid	f	2015-11-17 13:41:33.016622-05	2015-11-17 13:41:33.016665-05	0.00	\N	f	\N	13	61	1
63	Jonathan Alder High School\r\n-Italy/Switzerland Trip June 2015	Submitted: 01/06/2014\r\nDelivered: \r\n$210.00	paid	f	2015-11-17 14:47:09.452996-05	2015-11-17 14:47:09.45304-05	0.00	\N	f	\N	13	62	1
64	Valley Equestrian 4-H	Submitted: 05/15/20105\r\nDelivered: 06/01/2015\r\n$315.00	paid	f	2015-11-17 15:13:25.800539-05	2015-11-17 15:13:25.800585-05	0.00	\N	f	\N	13	63	1
65	Tri Valley TItan hockey Team	Our organization is desperately searching for new and successful fundraisers to allow the league to continue with this team.  It is compiled of 4 surrounding high schools in the tri valley area.  We have very talented hockey players and look forward to continuing with this tradition.	in-process	f	2015-11-20 13:59:37.934263-05	2015-11-20 14:10:19.132471-05	0.00	\N	f	\N	13	64	1
66	HELP Homeschool Salsa Sales	We had students sell salsa to help offset their tuition to a homeschool program.	unpaid	t	2015-11-26 19:50:54.195083-05	2015-11-26 20:12:09.425544-05	0.00	\N	t	5	13	40	1
\.


--
-- Name: fundraiser_fundraiser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraiser_id_seq', 66, true);


--
-- Data for Name: fundraiser_fundraisercategory; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisercategory (id, name, title, description, image, show_top_sellers, popular, type_id) FROM stdin;
13	Plan A	Pre-sell salsa using the Sales Tracking Sheet at $6.00 per jar	Pre-sell salsa using the Sales Tracking Sheet at $6.00 per jar.  You can choose to sell from a selection of 9, 16 or all 23 of our flavors.  Once your fundraiser is complete, tally the total order onto the Fundraiser Order Form. Forward the order form and payment of $3.00 per jar (50%) to us.  We ship your order within 10 days of receiving payment.\r\nPlease note, we have a 96 jar (8 case) minimum for free shipping.  There is a $30.00 shipping charge for orders under 96 jars.	fundraiser_types/logo-red_Jvqjm9k.png	f	t	1
14	Plan B	Order a selection of salsas to sell directly to your fundraiser customers. 	Order a selection of salsas to sell directly to your fundraiser customers.  Select as many or few of the flavors that you choose, all salsas are mix and match.  You pay $3.00 per jar and sell at $6.00 per jar (50%).  Forward your order to us along with payment, we ship within 10 days of receiving your order and payment. \r\nPlease note, we have a 96 jar (8 case) minimum for free shipping.  There is a $30.00 shipping charge for orders under 96 jars.	fundraiser_types/logo-yello_sxWK72a.png	t	f	2
15	Plan C	Pre-sell mix and match cases of salsa to your supporters at $72.00 per 12-jar case.	Pre-sell mix and match cases of salsa to your supporters at $72.00 per case of 12 jars.  Forward your order along with payment of $36.00 per case (50%) to us and we will ship your order within 10 days of receipt of payment.\r\nPlease note, we have a 96 jar (8 case) minimum for free shipping.  There is a $30.00 shipping charge for orders under 8 cases.	fundraiser_types/logo-green_wOp5Al0.png	f	f	3
\.


--
-- Name: fundraiser_fundraisercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisercategory_id_seq', 15, true);


--
-- Data for Name: fundraiser_fundraisercategory_options; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisercategory_options (id, fundraisercategory_id, fundraisertype_id) FROM stdin;
70	13	1
71	13	2
72	13	3
73	14	3
74	15	3
\.


--
-- Name: fundraiser_fundraisercategory_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisercategory_options_id_seq', 74, true);


--
-- Data for Name: fundraiser_fundraisertype; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertype (id, jar_price, slug, image, title, forms, "order") FROM stdin;
1	3.00	fundraiser-type-1	fundraiser_types/logo-red_X2kLiUH.png	Option 1: Pick from 23	/current/jmi_fundraising_production/docs/option-1-package.zip	1
2	3.00	fundraiser-type-2	fundraiser_types/logo-yello_WX0N8pX.png	Option 2: Pick from 16	/current/jmi_fundraising_production/docs/option-2-package.zip	2
3	3.00	fundraiser-type-3	fundraiser_types/logo-green_3WJDlbB.png	Option 3: Pick from 9	/current/jmi_fundraising_production/docs/option-3-package.zip	3
\.


--
-- Name: fundraiser_fundraisertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_id_seq', 3, true);


--
-- Data for Name: fundraiser_fundraisertype_selections; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertype_selections (id, fundraisertype_id, product_id) FROM stdin;
485	1	1
486	1	2
487	1	3
488	1	4
489	1	5
490	1	6
491	1	7
492	1	8
493	1	9
494	1	10
495	1	11
496	1	12
497	1	13
498	1	14
499	1	15
500	1	16
501	1	17
502	1	18
503	1	19
504	1	20
505	1	21
506	1	22
507	2	1
508	2	2
509	2	3
510	2	5
511	2	6
512	2	8
513	2	11
514	2	13
515	2	14
516	2	16
517	2	17
518	2	20
519	2	21
520	2	22
521	3	3
522	3	5
523	3	8
524	3	11
525	3	13
526	3	16
527	3	19
528	3	21
529	3	22
\.


--
-- Name: fundraiser_fundraisertype_selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_selections_id_seq', 529, true);


--
-- Data for Name: fundraiser_fundraisertypetitle; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertypetitle (id, title) FROM stdin;
1	Pre-sell individual jars
2	Buy then sell
3	Pre-sell salsa by the case
\.


--
-- Name: fundraiser_fundraisertypetitle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertypetitle_id_seq', 3, true);


--
-- Data for Name: marketing_emailnewsletter; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY marketing_emailnewsletter (id, email) FROM stdin;
\.


--
-- Name: marketing_emailnewsletter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('marketing_emailnewsletter_id_seq', 1, false);


--
-- Data for Name: marketing_genericdiscount; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY marketing_genericdiscount (id, title, special_code, active, expires_after, used, percent, dollars) FROM stdin;
\.


--
-- Name: marketing_genericdiscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('marketing_genericdiscount_id_seq', 1, false);


--
-- Data for Name: marketing_singlediscount; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY marketing_singlediscount (id, title, special_code, active, expires_after, used, percent, dollars, fundraiser_id) FROM stdin;
\.


--
-- Name: marketing_singlediscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('marketing_singlediscount_id_seq', 1, true);


--
-- Data for Name: payment_payment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY payment_payment (id, type, stripe_id, last_4, card_type, fundraiser_id) FROM stdin;
12	check	\N	\N	\N	66
\.


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('payment_payment_id_seq', 12, true);


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_category (id, title, "order", slug) FROM stdin;
1	Original Red	1	original-red-None
2	Specialty	3	specialty-None
3	Fruit	2	fruit-None
4	Verde	4	verde-None
\.


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_category_id_seq', 4, true);


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_product (id, product_code, slug, title, description, price, created, updated, image, featured, best_seller) FROM stdin;
1	product- 1	original-x-hot-1	ORIGINAL X-HOT	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid. X-Hot is Clovis Hot only hotter! Add the red Cayenne peppers please!	3.00	2015-10-06 10:31:20.816539-04	2015-10-06 12:48:38.433902-04	product_images/clovis_hot_eysWP8I.jpeg	t	t
2	product- 2	spanish-verde-xx-stupid-hot-2	SPANISH VERDE XX-STUPID-HOT	Stupid Hot.	3.00	2015-10-06 10:32:51.270486-04	2015-10-06 12:52:29.009985-04	product_images/verde_hot_DsolbM6.jpeg	t	t
5	product- 5	mango-mild-5	MANGO MILD	Everyone loves the taste of mangos right? Try chunks of mango with Clovis Medium Spice!	3.00	2015-10-06 10:36:04.649424-04	2015-10-06 12:52:29.02023-04	product_images/mango_mild.jpeg	t	t
6	product- 6	raspberry-bbq-chipotle-6	RASPBERRY BBQ CHIPOTLE	We searched all over the US for the quintessential essence of what good BBQ should taste like. Result: There is no clear winner because each region has its own preferences. So we chose the Motor City and spoke to many people and tasted many bbqs, to craft Raspberry BBQ.	3.00	2015-10-06 10:37:59.163312-04	2015-10-06 12:52:29.023739-04	product_images/raspb_bbq_chipotle_99RoPVj.jpeg	t	t
7	product- 7	pineapple-mild-7	PINEAPPLE MILD	This salsa has the great tast of pineapple and it and superb texture. Use this just as a dip or inspire a new omlette recipe.	3.00	2015-10-06 10:38:56.765952-04	2015-10-06 10:40:35.033181-04	product_images/mango_mild_cCcIItz.jpeg	t	f
3	product- 3	original-mild-3	ORIGINAL MILD	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid. Clovis Mild is the first four pepper salsa in the US with two red dried chilies adn two green chilies. California Pear tomatoes make a natural smooth, and sweet taste - while the four chilies and spices make it one of the most complex salsa around. Thats why its the base of all our red salsas.	3.00	2015-10-06 10:33:30.984407-04	2015-10-06 12:47:58.355946-04	product_images/clovis_mild_iouzeLB.jpeg	t	f
8	product- 8	black-bean-and-corn-pablano-8	BLACK BEAN AND CORN PABLANO	Every one I speak to says this salsa tastes like chili. It is in the top three best selling salsas and is a great condiment.	3.00	2015-10-06 10:39:19.832225-04	2015-10-06 10:40:35.036366-04	product_images/black-bean-corn-pablano_5AUltEV.jpg	t	f
9	product- 9	roasted-garlic-olives-9	ROASTED GARLIC & OLIVES	Fresh roasted garlic cloves, green and black olives, chilies, tomatoes and Jose Madrid spices.	3.00	2015-10-06 10:39:50.747778-04	2015-10-06 10:40:35.039632-04	product_images/roasted_garlic_8MQdTJ8.jpeg	t	f
17	product- 17	garden-cilantro-salsa-hot-17	GARDEN CILANTRO SALSA HOT	New Mexico chili's blended with fresh cilantro, tomatoes, jalepenos, onions, and a hint of lime.	3.00	2015-10-06 10:44:44.159193-04	2015-10-06 10:44:44.165018-04	product_images/garden_cilantro_hot_q7XVRLi.jpeg	f	f
19	product- 19	jamaican-jerk-hot-19	JAMAICAN JERK HOT	This is a new one, made by popular demand.	3.00	2015-10-06 10:46:33.683989-04	2015-10-06 10:46:33.689637-04	product_images/jamaican_jerk_Y2p95iL.jpeg	f	f
18	product- 18	cherry-chocolate-hot-18	CHERRY CHOCOLATE HOT	Yes, we added habanero to give this some heat Pure cocoa mixed with cherries combine to make your taste buds dance. Try this as a marinade with your favorite roasting meat, you won't be dissapointed!`	3.00	2015-10-06 10:46:11.386094-04	2015-10-06 10:46:11.392894-04	product_images/cherry_chocolate_hot.jpeg	f	f
20	product- 20	peach-20	PEACH	Peach is one of the original fruit salsas. One of the most versatile, great on any spread that needs a little kick!	3.00	2015-10-06 10:47:01.497598-04	2015-10-06 10:47:01.502738-04	product_images/peach-mild_2auQEy8.jpg	f	f
10	product- 10	clovis-medium-10	CLOVIS MEDIUM	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.	3.00	2015-10-06 10:40:18.356772-04	2015-10-06 10:49:29.236249-04	product_images/clovis_medium_AU0bppL.jpeg	t	f
21	product- 21	raspberry-mild-21	RASPBERRY MILD	The first fruit salsa developed along with the Peach salsa. Raspberry is one of the icons of Jose Madrid Salsa and has won nation awards in two countries!	3.00	2015-10-06 10:47:24.266303-04	2015-10-06 10:47:24.272738-04	product_images/raspberry_mild_BDo8Tcg.jpeg	f	f
11	product- 11	chipotle-con-queso-11	CHIPOTLE CON QUESO	Smoked chipotle peppers. Chunks of tomatos and slices of cheddar.	3.00	2015-10-06 10:41:37.027748-04	2015-10-06 10:49:29.242694-04	product_images/chipotle_con_caso_ZKpSXrA.jpeg	t	f
12	product- 12	spanish-verde-hot-12	SPANISH VERDE HOT	Verde Hot has the Verder Mild base, but with Serrano peppers to make it Hot. This is the "Salsa King's" favorite salsa. Won best green salsa in the US in Fort Worth, Texas in 2004 at the Salsa Shoot Out.	3.00	2015-10-06 10:42:06.07615-04	2015-10-06 10:49:29.246517-04	product_images/verde_hot_zWloeWN.jpeg	t	f
13	product- 13	roasted-pineapple-habanero-hot-13	ROASTED PINEAPPLE HABANERO HOT	Made with Verde XX Hot as the base, along with Jose Madrid special spices, and fresh pinaple chunks.	3.00	2015-10-06 10:42:54.300491-04	2015-10-06 10:49:29.249655-04	product_images/roasted_pineapple_habenero_rRBrMZ9.jpeg	t	f
14	product- 14	spanish-verde-mild-14	SPANISH VERDE MILD	Made with green chilies, tomatillo's, onions, cilantro, lime, and Jose Madrid spices. Best tomatillo salsa in the US!	3.00	2015-10-06 10:43:24.935874-04	2015-10-06 10:49:29.252834-04	product_images/verde_mild_eYwyqia.jpeg	t	f
15	product- 15	chipotle-hot-15	CHIPOTLE HOT	Smoked jalapenos are diced and mixed with a blend of thick and chunky tomatoes and spices. If you've ever tried smoking your own jalepenos and enjoy savory and spicey, this one's for you.	3.00	2015-10-06 10:43:53.56363-04	2015-10-06 10:49:29.256061-04	product_images/chipotle-hot_wPCibYj.jpeg	t	f
16	product- 16	original-hot-16	ORIGINAL HOT	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.	3.00	2015-10-06 10:44:18.481772-04	2015-10-06 10:49:50.627685-04	product_images/clovis_hot_kNs8xmE.jpeg	t	f
4	product- 4	cherry-mild-4	CHERRY MILD	Its the Michigan cherries that make Cherry Mild wonderfully sweet and tart. Make a great snack or as a compliment to meats, fish, or vegetables.	3.00	2015-10-06 10:34:15.094468-04	2015-10-06 12:52:29.016671-04	product_images/cherry_mild_llDy97q.jpeg	t	t
22	product- 22	garden-cilantro-salsa-mild-22	GARDEN CILANTRO SALSA MILD	New Mexico chili's blended with fresh cilantro, tomatoes, jalepenos, onions, and a hint of lime. This one has a hotter version if you like cilantro and jalepenos.	3.00	2015-10-06 10:49:18.278647-04	2015-10-06 10:49:18.285525-04	product_images/garden_cilantro_mild_dvZcy46.jpeg	f	f
\.


--
-- Data for Name: product_product_category; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_product_category (id, product_id, category_id) FROM stdin;
1	1	1
2	2	4
3	3	1
4	4	2
5	5	3
6	6	2
7	7	3
8	8	2
9	9	2
10	10	1
11	11	2
12	12	4
13	13	2
14	14	4
15	15	2
16	16	1
17	17	2
18	18	2
19	19	2
20	20	3
21	21	3
22	22	2
\.


--
-- Name: product_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_product_category_id_seq', 22, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_product_id_seq', 22, true);


--
-- Data for Name: product_productimage; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_productimage (id, "default", image, zoom_image, product_id) FROM stdin;
\.


--
-- Name: product_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_productimage_id_seq', 1, false);


--
-- Data for Name: shipment_selection; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY shipment_selection (id, quantity, product_id, shipment_id) FROM stdin;
218	0	1	66
219	2	3	66
220	1	10	66
221	0	16	66
222	0	4	66
223	3	6	66
224	5	8	66
225	1	9	66
226	6	11	66
227	4	13	66
228	1	15	66
229	0	17	66
230	0	18	66
231	0	19	66
232	6	22	66
233	1	5	66
234	1	7	66
235	0	20	66
236	4	21	66
237	0	2	66
238	0	12	66
239	1	14	66
\.


--
-- Name: shipment_selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_selection_id_seq', 239, true);


--
-- Data for Name: shipment_shipment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY shipment_shipment (id, created, updated, address_id, comment_id, fundraiser_id) FROM stdin;
12	2015-11-06 18:59:38.763678-05	2015-11-06 18:59:38.763725-05	\N	\N	12
14	2015-11-10 10:53:51.977959-05	2015-11-10 10:53:51.977993-05	\N	\N	14
15	2015-11-10 11:05:04.507108-05	2015-11-10 11:05:04.507141-05	\N	\N	15
16	2015-11-10 12:19:48.419812-05	2015-11-10 12:19:48.419861-05	\N	\N	16
17	2015-11-10 12:33:23.146956-05	2015-11-10 12:33:23.146991-05	\N	\N	17
18	2015-11-10 12:46:35.082731-05	2015-11-10 12:46:35.082765-05	\N	\N	18
19	2015-11-10 12:57:55.065634-05	2015-11-10 12:57:55.065668-05	\N	\N	19
20	2015-11-10 12:58:17.947209-05	2015-11-10 12:58:17.947238-05	\N	\N	20
21	2015-11-10 13:08:32.995001-05	2015-11-10 13:08:32.995036-05	\N	\N	21
22	2015-11-10 13:33:10.404053-05	2015-11-10 13:33:10.404087-05	\N	\N	22
23	2015-11-10 13:43:53.238642-05	2015-11-10 13:43:53.238675-05	\N	\N	23
24	2015-11-10 14:02:56.484327-05	2015-11-10 14:02:56.48436-05	\N	\N	24
25	2015-11-10 15:52:34.739288-05	2015-11-10 15:52:34.739323-05	\N	\N	25
26	2015-11-10 16:04:12.009591-05	2015-11-10 16:04:12.009626-05	\N	\N	26
27	2015-11-10 16:14:08.988303-05	2015-11-10 16:14:08.988332-05	\N	\N	27
28	2015-11-10 16:40:16.553802-05	2015-11-10 16:40:16.553836-05	\N	\N	28
29	2015-11-10 17:02:19.927663-05	2015-11-10 17:02:19.927696-05	\N	\N	29
30	2015-11-11 09:38:10.886333-05	2015-11-11 09:38:10.886366-05	\N	\N	30
31	2015-11-11 10:02:07.749595-05	2015-11-11 10:02:07.749629-05	\N	\N	31
32	2015-11-11 10:21:14.92171-05	2015-11-11 10:21:14.921743-05	\N	\N	32
33	2015-11-11 10:55:43.891315-05	2015-11-11 10:55:43.891349-05	\N	\N	33
34	2015-11-11 11:04:15.557456-05	2015-11-11 11:04:15.557485-05	\N	\N	34
36	2015-11-11 11:38:45.223875-05	2015-11-11 11:38:45.224212-05	\N	\N	36
38	2015-11-11 12:06:29.692218-05	2015-11-11 12:06:29.692253-05	\N	\N	38
39	2015-11-11 12:19:13.738317-05	2015-11-11 12:19:13.73835-05	\N	\N	39
40	2015-11-11 12:44:53.239767-05	2015-11-11 12:44:53.2398-05	\N	\N	40
41	2015-11-12 10:14:59.705498-05	2015-11-12 10:14:59.705531-05	\N	\N	41
42	2015-11-16 12:38:22.851854-05	2015-11-16 12:38:22.851883-05	\N	\N	42
43	2015-11-16 13:02:25.225617-05	2015-11-16 13:02:25.225649-05	\N	\N	43
44	2015-11-16 13:10:23.879629-05	2015-11-16 13:10:23.879662-05	\N	\N	44
45	2015-11-16 13:30:11.502205-05	2015-11-16 13:30:11.502238-05	\N	\N	45
46	2015-11-16 13:40:19.943249-05	2015-11-16 13:40:19.943278-05	\N	\N	46
47	2015-11-16 13:58:07.9433-05	2015-11-16 13:58:07.943333-05	\N	\N	47
48	2015-11-16 14:05:15.500804-05	2015-11-16 14:05:15.500838-05	\N	\N	48
49	2015-11-16 14:15:32.147814-05	2015-11-16 14:15:32.147847-05	\N	\N	49
50	2015-11-16 14:43:16.958707-05	2015-11-16 14:43:16.95874-05	\N	\N	50
51	2015-11-16 14:56:53.410306-05	2015-11-16 14:56:53.410339-05	\N	\N	51
52	2015-11-16 15:09:04.246129-05	2015-11-16 15:09:04.246162-05	\N	\N	52
53	2015-11-17 11:04:01.414271-05	2015-11-17 11:04:01.414304-05	\N	\N	53
54	2015-11-17 11:25:14.113497-05	2015-11-17 11:25:14.11353-05	\N	\N	54
55	2015-11-17 11:45:36.711627-05	2015-11-17 11:45:36.711659-05	\N	\N	55
56	2015-11-17 11:55:16.468955-05	2015-11-17 11:55:16.468988-05	\N	\N	56
57	2015-11-17 12:17:50.09956-05	2015-11-17 12:17:50.099593-05	\N	\N	57
58	2015-11-17 12:37:47.342673-05	2015-11-17 12:37:47.342711-05	\N	\N	58
59	2015-11-17 12:55:38.743063-05	2015-11-17 12:55:38.743111-05	\N	\N	59
60	2015-11-17 13:05:33.405673-05	2015-11-17 13:05:33.405706-05	\N	\N	60
61	2015-11-17 13:14:53.76786-05	2015-11-17 13:14:53.767898-05	\N	\N	61
62	2015-11-17 13:41:33.018416-05	2015-11-17 13:41:33.018448-05	\N	\N	62
63	2015-11-17 14:47:09.454999-05	2015-11-17 14:47:09.455032-05	\N	\N	63
64	2015-11-17 15:13:25.8026-05	2015-11-17 15:13:25.802634-05	\N	\N	64
65	2015-11-20 13:59:37.936317-05	2015-11-20 13:59:37.936349-05	\N	\N	65
66	2015-11-26 19:50:54.19742-05	2015-11-26 20:09:23.923134-05	42	12	66
\.


--
-- Name: shipment_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_shipment_id_seq', 66, true);


--
-- Name: account_passwordreset_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY account_passwordreset
    ADD CONSTRAINT account_passwordreset_pkey PRIMARY KEY (id);


--
-- Name: account_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);


--
-- Name: address_address_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY address_address
    ADD CONSTRAINT address_address_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: comment_fundraiserordercomment_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY comment_fundraiserordercomment
    ADD CONSTRAINT comment_fundraiserordercomment_pkey PRIMARY KEY (id);


--
-- Name: comment_usercomment_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY comment_usercomment
    ADD CONSTRAINT comment_usercomment_pkey PRIMARY KEY (id);


--
-- Name: corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fundraiser_fundraiser_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraiser
    ADD CONSTRAINT fundraiser_fundraiser_pkey PRIMARY KEY (id);


--
-- Name: fundraiser_fundraisercategory_fundraisercategory_id_fundrai_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisercategory_options
    ADD CONSTRAINT fundraiser_fundraisercategory_fundraisercategory_id_fundrai_key UNIQUE (fundraisercategory_id, fundraisertype_id);


--
-- Name: fundraiser_fundraisercategory_options_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisercategory_options
    ADD CONSTRAINT fundraiser_fundraisercategory_options_pkey PRIMARY KEY (id);


--
-- Name: fundraiser_fundraisercategory_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisercategory
    ADD CONSTRAINT fundraiser_fundraisercategory_pkey PRIMARY KEY (id);


--
-- Name: fundraiser_fundraisertype_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisertype
    ADD CONSTRAINT fundraiser_fundraisertype_pkey PRIMARY KEY (id);


--
-- Name: fundraiser_fundraisertype_sele_fundraisertype_id_product_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisertype_selections
    ADD CONSTRAINT fundraiser_fundraisertype_sele_fundraisertype_id_product_id_key UNIQUE (fundraisertype_id, product_id);


--
-- Name: fundraiser_fundraisertype_selections_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisertype_selections
    ADD CONSTRAINT fundraiser_fundraisertype_selections_pkey PRIMARY KEY (id);


--
-- Name: fundraiser_fundraisertypetitle_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY fundraiser_fundraisertypetitle
    ADD CONSTRAINT fundraiser_fundraisertypetitle_pkey PRIMARY KEY (id);


--
-- Name: marketing_emailnewsletter_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY marketing_emailnewsletter
    ADD CONSTRAINT marketing_emailnewsletter_pkey PRIMARY KEY (id);


--
-- Name: marketing_genericdiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY marketing_genericdiscount
    ADD CONSTRAINT marketing_genericdiscount_pkey PRIMARY KEY (id);


--
-- Name: marketing_singlediscount_fundraiser_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY marketing_singlediscount
    ADD CONSTRAINT marketing_singlediscount_fundraiser_id_key UNIQUE (fundraiser_id);


--
-- Name: marketing_singlediscount_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY marketing_singlediscount
    ADD CONSTRAINT marketing_singlediscount_pkey PRIMARY KEY (id);


--
-- Name: payment_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY payment_payment
    ADD CONSTRAINT payment_payment_pkey PRIMARY KEY (id);


--
-- Name: product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY product_product_category
    ADD CONSTRAINT product_product_category_pkey PRIMARY KEY (id);


--
-- Name: product_product_category_product_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY product_product_category
    ADD CONSTRAINT product_product_category_product_id_category_id_key UNIQUE (product_id, category_id);


--
-- Name: product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY product_productimage
    ADD CONSTRAINT product_productimage_pkey PRIMARY KEY (id);


--
-- Name: shipment_selection_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY shipment_selection
    ADD CONSTRAINT shipment_selection_pkey PRIMARY KEY (id);


--
-- Name: shipment_shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY shipment_shipment
    ADD CONSTRAINT shipment_shipment_pkey PRIMARY KEY (id);


--
-- Name: account_passwordreset_e8701ad4; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_passwordreset_e8701ad4 ON account_passwordreset USING btree (user_id);


--
-- Name: account_profile_2dbcba41; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_profile_2dbcba41 ON account_profile USING btree (slug);


--
-- Name: account_profile_8a089c2a; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_profile_8a089c2a ON account_profile USING btree (account_id);


--
-- Name: account_profile_ea8e5d12; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_profile_ea8e5d12 ON account_profile USING btree (address_id);


--
-- Name: account_profile_slug_11b7c9d43838e85c_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_profile_slug_11b7c9d43838e85c_like ON account_profile USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: comment_fundraiserordercomment_3287b1bc; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX comment_fundraiserordercomment_3287b1bc ON comment_fundraiserordercomment USING btree (fundraiser_id);


--
-- Name: comment_usercomment_3287b1bc; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX comment_usercomment_3287b1bc ON comment_usercomment USING btree (fundraiser_id);


--
-- Name: comment_usercomment_8a089c2a; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX comment_usercomment_8a089c2a ON comment_usercomment USING btree (account_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: fundraiser_fundraiser_2dbcba41; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_2dbcba41 ON fundraiser_fundraiser USING btree (slug);


--
-- Name: fundraiser_fundraiser_60fb6a05; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_60fb6a05 ON fundraiser_fundraiser USING btree (plan_id);


--
-- Name: fundraiser_fundraiser_83a0eb3f; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_83a0eb3f ON fundraiser_fundraiser USING btree (profile_id);


--
-- Name: fundraiser_fundraiser_8a089c2a; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_8a089c2a ON fundraiser_fundraiser USING btree (account_id);


--
-- Name: fundraiser_fundraiser_94757cae; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_94757cae ON fundraiser_fundraiser USING btree (type_id);


--
-- Name: fundraiser_fundraiser_slug_15ebde81d7fa514c_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraiser_slug_15ebde81d7fa514c_like ON fundraiser_fundraiser USING btree (slug varchar_pattern_ops);


--
-- Name: fundraiser_fundraisercategory_94757cae; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisercategory_94757cae ON fundraiser_fundraisercategory USING btree (type_id);


--
-- Name: fundraiser_fundraisercategory_options_e5391087; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisercategory_options_e5391087 ON fundraiser_fundraisercategory_options USING btree (fundraisercategory_id);


--
-- Name: fundraiser_fundraisercategory_options_f830d4d2; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisercategory_options_f830d4d2 ON fundraiser_fundraisercategory_options USING btree (fundraisertype_id);


--
-- Name: fundraiser_fundraisertype_2dbcba41; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisertype_2dbcba41 ON fundraiser_fundraisertype USING btree (slug);


--
-- Name: fundraiser_fundraisertype_selections_9bea82de; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisertype_selections_9bea82de ON fundraiser_fundraisertype_selections USING btree (product_id);


--
-- Name: fundraiser_fundraisertype_selections_f830d4d2; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisertype_selections_f830d4d2 ON fundraiser_fundraisertype_selections USING btree (fundraisertype_id);


--
-- Name: fundraiser_fundraisertype_slug_2c8bfe64c5d27240_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX fundraiser_fundraisertype_slug_2c8bfe64c5d27240_like ON fundraiser_fundraisertype USING btree (slug varchar_pattern_ops);


--
-- Name: payment_payment_3287b1bc; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX payment_payment_3287b1bc ON payment_payment USING btree (fundraiser_id);


--
-- Name: product_product_2dbcba41; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX product_product_2dbcba41 ON product_product USING btree (slug);


--
-- Name: product_product_category_9bea82de; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX product_product_category_9bea82de ON product_product_category USING btree (product_id);


--
-- Name: product_product_category_b583a629; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX product_product_category_b583a629 ON product_product_category USING btree (category_id);


--
-- Name: product_product_slug_3bce276f4cb8468a_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX product_product_slug_3bce276f4cb8468a_like ON product_product USING btree (slug varchar_pattern_ops);


--
-- Name: product_productimage_9bea82de; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX product_productimage_9bea82de ON product_productimage USING btree (product_id);


--
-- Name: shipment_selection_9bea82de; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX shipment_selection_9bea82de ON shipment_selection USING btree (product_id);


--
-- Name: shipment_selection_c77cffaa; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX shipment_selection_c77cffaa ON shipment_selection USING btree (shipment_id);


--
-- Name: shipment_shipment_3287b1bc; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX shipment_shipment_3287b1bc ON shipment_shipment USING btree (fundraiser_id);


--
-- Name: shipment_shipment_69b97d17; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX shipment_shipment_69b97d17 ON shipment_shipment USING btree (comment_id);


--
-- Name: shipment_shipment_ea8e5d12; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX shipment_shipment_ea8e5d12 ON shipment_shipment USING btree (address_id);


--
-- Name: D3e8e3f7f022e1c2c93d1a8b0c096ed6; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisercategory_options
    ADD CONSTRAINT "D3e8e3f7f022e1c2c93d1a8b0c096ed6" FOREIGN KEY (fundraisercategory_id) REFERENCES fundraiser_fundraisercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D8d4da3719bbf9ee668068f769680e05; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_shipment
    ADD CONSTRAINT "D8d4da3719bbf9ee668068f769680e05" FOREIGN KEY (comment_id) REFERENCES comment_fundraiserordercomment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_passwordreset_user_id_e553a6d2ad0efa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_passwordreset
    ADD CONSTRAINT account_passwordreset_user_id_e553a6d2ad0efa_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_profil_address_id_3b1db7596234aab_fk_address_address_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profil_address_id_3b1db7596234aab_fk_address_address_id FOREIGN KEY (address_id) REFERENCES address_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_profile_account_id_1ca06866a78ee894_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profile_account_id_1ca06866a78ee894_fk_auth_user_id FOREIGN KEY (account_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comm_fundraiser_id_3fc1edff9b82c9aa_fk_fundraiser_fundraiser_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY comment_usercomment
    ADD CONSTRAINT comm_fundraiser_id_3fc1edff9b82c9aa_fk_fundraiser_fundraiser_id FOREIGN KEY (fundraiser_id) REFERENCES fundraiser_fundraiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comm_fundraiser_id_6de9bd7c778477c9_fk_fundraiser_fundraiser_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY comment_fundraiserordercomment
    ADD CONSTRAINT comm_fundraiser_id_6de9bd7c778477c9_fk_fundraiser_fundraiser_id FOREIGN KEY (fundraiser_id) REFERENCES fundraiser_fundraiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comment_userco_account_id_9637cbd8ecf2fdb_fk_account_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY comment_usercomment
    ADD CONSTRAINT comment_userco_account_id_9637cbd8ecf2fdb_fk_account_profile_id FOREIGN KEY (account_id) REFERENCES account_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: da8b100a8da6bfd1acf3b8f818f3c691; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisertype_selections
    ADD CONSTRAINT da8b100a8da6bfd1acf3b8f818f3c691 FOREIGN KEY (fundraisertype_id) REFERENCES fundraiser_fundraisertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e63994d2909d64619afb0145725372c8; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisercategory_options
    ADD CONSTRAINT e63994d2909d64619afb0145725372c8 FOREIGN KEY (fundraisertype_id) REFERENCES fundraiser_fundraisertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f_type_id_21312afde8b934c6_fk_fundraiser_fundraisertypetitle_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisercategory
    ADD CONSTRAINT f_type_id_21312afde8b934c6_fk_fundraiser_fundraisertypetitle_id FOREIGN KEY (type_id) REFERENCES fundraiser_fundraisertypetitle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fu_plan_id_37f6e10644b23347_fk_fundraiser_fundraisercategory_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraiser
    ADD CONSTRAINT fu_plan_id_37f6e10644b23347_fk_fundraiser_fundraisercategory_id FOREIGN KEY (plan_id) REFERENCES fundraiser_fundraisercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fundra_type_id_1afa219fa4ee9582_fk_fundraiser_fundraisertype_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraiser
    ADD CONSTRAINT fundra_type_id_1afa219fa4ee9582_fk_fundraiser_fundraisertype_id FOREIGN KEY (type_id) REFERENCES fundraiser_fundraisertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fundraiser_fu_product_id_495de7888bf4783f_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraisertype_selections
    ADD CONSTRAINT fundraiser_fu_product_id_495de7888bf4783f_fk_product_product_id FOREIGN KEY (product_id) REFERENCES product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fundraiser_fun_profile_id_546fed6304f6122_fk_account_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraiser
    ADD CONSTRAINT fundraiser_fun_profile_id_546fed6304f6122_fk_account_profile_id FOREIGN KEY (profile_id) REFERENCES account_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fundraiser_fundraise_account_id_6f5865fa1d36e84_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY fundraiser_fundraiser
    ADD CONSTRAINT fundraiser_fundraise_account_id_6f5865fa1d36e84_fk_auth_user_id FOREIGN KEY (account_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mark_fundraiser_id_2fde88e8cfd0103b_fk_fundraiser_fundraiser_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY marketing_singlediscount
    ADD CONSTRAINT mark_fundraiser_id_2fde88e8cfd0103b_fk_fundraiser_fundraiser_id FOREIGN KEY (fundraiser_id) REFERENCES fundraiser_fundraiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: paym_fundraiser_id_550cdc97538c8e5f_fk_fundraiser_fundraiser_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY payment_payment
    ADD CONSTRAINT paym_fundraiser_id_550cdc97538c8e5f_fk_fundraiser_fundraiser_id FOREIGN KEY (fundraiser_id) REFERENCES fundraiser_fundraiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_pro_category_id_24d7d3c58f45ff8e_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_product_category
    ADD CONSTRAINT product_pro_category_id_24d7d3c58f45ff8e_fk_product_category_id FOREIGN KEY (category_id) REFERENCES product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_produ_product_id_2131f596384ebb2c_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_productimage
    ADD CONSTRAINT product_produ_product_id_2131f596384ebb2c_fk_product_product_id FOREIGN KEY (product_id) REFERENCES product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_produ_product_id_2d2f8af02a489764_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY product_product_category
    ADD CONSTRAINT product_produ_product_id_2d2f8af02a489764_fk_product_product_id FOREIGN KEY (product_id) REFERENCES product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ship_fundraiser_id_5c5cb6a913e48e85_fk_fundraiser_fundraiser_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_shipment
    ADD CONSTRAINT ship_fundraiser_id_5c5cb6a913e48e85_fk_fundraiser_fundraiser_id FOREIGN KEY (fundraiser_id) REFERENCES fundraiser_fundraiser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipment_s_shipment_id_45e9ee1368ddd5ff_fk_shipment_shipment_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_selection
    ADD CONSTRAINT shipment_s_shipment_id_45e9ee1368ddd5ff_fk_shipment_shipment_id FOREIGN KEY (shipment_id) REFERENCES shipment_shipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipment_sele_product_id_2545a88f0d11ac69_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_selection
    ADD CONSTRAINT shipment_sele_product_id_2545a88f0d11ac69_fk_product_product_id FOREIGN KEY (product_id) REFERENCES product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipment_ship_address_id_526ad17226b4fc95_fk_address_address_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY shipment_shipment
    ADD CONSTRAINT shipment_ship_address_id_526ad17226b4fc95_fk_address_address_id FOREIGN KEY (address_id) REFERENCES address_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO mzakany;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

