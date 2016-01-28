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
    address_id integer,
    token_id character varying(40)
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
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO mzakany;

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

COPY account_profile (id, organization, first_name, last_name, phone_number, email, slug, org_photo, stripe_id, account_id, address_id, token_id) FROM stdin;
9	Fall Football kids eventf	Michael	Zakany	3306126183	mzakany@gmail.com	fall-football-kids-eventf-9		\N	\N	1	\N
8	ok	Michael	Zakany	3306126183	mzakany@gmail.com	ok-8	organization_photos/Photo_on_2-12-15_at_9.23_AM.jpg		1	1	022e3c1d577a1fede9fd0a16af59eed8c31aca69
10	test	Michael	Zakany	3306126183	mzakany@gmail.com	test-10			1	1	022e3c1d577a1fede9fd0a16af59eed8c31aca69
\.


--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('account_profile_id_seq', 10, true);


--
-- Data for Name: address_address; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY address_address (id, shipping, billing, title, street, line_2, city, state, zip_code, country) FROM stdin;
1	t	f		2641 Shaker Rd.		Cleveland Heights	OH	44118	\N
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('address_address_id_seq', 1, true);


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
79	Can add token	27	add_token
80	Can change token	27	change_token
81	Can delete token	27	delete_token
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_permission_id_seq', 81, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$15000$bhtTxeutwNK0$BndeaiOnnpYKfRN312Ky5RDhKP3hlkEyI/lh8T2bK7Q=	2015-11-30 13:46:04.3393-05	t	mzakany			mzakany@gmail.com	t	t	2015-10-06 09:58:37.664294-04
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

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


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
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY authtoken_token (key, created, user_id) FROM stdin;
022e3c1d577a1fede9fd0a16af59eed8c31aca69	2015-10-16 10:48:19.001491-04	1
\.


--
-- Data for Name: comment_fundraiserordercomment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY comment_fundraiserordercomment (id, comment, fundraiser_id) FROM stdin;
8		8
9	ok works	10
\.


--
-- Name: comment_fundraiserordercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('comment_fundraiserordercomment_id_seq', 9, true);


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
145	2015-10-16 10:35:30.55754-04	8	ok	2	Changed org_photo and account.	8	1
146	2015-10-16 10:48:19.002592-04	022e3c1d577a1fede9fd0a16af59eed8c31aca69	022e3c1d577a1fede9fd0a16af59eed8c31aca69	1		27	1
147	2015-10-16 10:48:33.919848-04	8	ok	2	Changed token.	8	1
148	2015-10-16 17:04:16.439203-04	10	test	2	Changed token.	8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 148, true);


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
27	token	authtoken	token
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_content_type_id_seq', 27, true);


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
37	authtoken	0001_initial	2015-10-16 10:01:46.355367-04
38	account	0004_profile_token	2015-10-16 10:01:46.477038-04
39	fundraiser	0014_auto_20151016_1401	2015-10-16 10:01:46.886021-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_migrations_id_seq', 39, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
l1lwjp8iwcmnnuwxb6nt4h4k2lshf8sz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-10-23 10:40:59.189144-04
1ejxddi3yuod8005cjej6w1bke3cj3ay	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-24 09:36:30.685068-04
lwsdv5qsnbds4a252m05r5ugo4mev0ja	MDdlOGJmNDU2NjgzNzY3NGE5ZGJjZjUzODRiNmMzYzM0YmQ4MmYwMDp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjoxMCwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJvcmRlcl9zdGVwIjpudWxsLCJmaW5hbGl6ZWRfb3JkZXIiOjEwLCJfYXV0aF91c2VyX2hhc2giOiI3MWUzMTI2N2IzZGI4YTg2NWM5MzRkYjAwNWI3MmVjZGIzMGUwZjVkIn0=	2015-10-26 18:12:43.621029-04
4gs6syt0uoyjfwjuj8q3epex1zdkzks9	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-10-30 10:34:39.517983-04
8fgpam8oer1q4j5yu79k4xb2kq5qys9w	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:29:44.887823-05
a0y850nyxka8spiug1tuv4s5i9g1tcwz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.337139-05
quagpt2gt9r25dzbslj1f0jnlur4pt8a	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.544344-05
kam5s6dpvqif8frwogmz3y9d0u0ghvc6	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.553816-05
thszac7buy9r829hptim9qsj48ni9t2k	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.580705-05
g142zreh2kzb71kft9xm9lf10i0xua9b	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.591637-05
82voo6gur3ov9ex71tj4ub49cj2t10m8	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:40.597268-05
vdi8opw9kalakofzujnmdw73947g8b81	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.611355-05
5j0vbqxzerkvvsdn3g0vrjd8jg64xnxk	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.733004-05
wbvd6l6fkfd775kcgagitc0z9tybjl1r	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.795395-05
xk95u22pzhnenjp9005c854dddlfor0z	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.91426-05
rt3czzadsfcbbf49b1hnjx7m478es0ac	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.959792-05
1tfl0pgh5jqu986wwag3vq6dwhmrozpt	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:43.98299-05
woet6w45hzua54dtjxl9g0oy1l5rvosu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:46.867353-05
rpm015h8s8kfi2ilud9kgaabbxeb4zmz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:47.114217-05
pi0i7sgga2v5y227sf5i2pg97g9p5gv9	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:47.128815-05
idgon7unyiqc2frq22vw2u16560d25m2	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:47.163776-05
30rb7ygdbyw01sm7um1ias6gukfcv5s0	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:47.379165-05
8aql4t0z1dp5rypw0fzo8qhel6fjya41	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:47.380243-05
2qlvfsfb9m029rb19trwok92jnckhpne	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:49.196255-05
r99q4li3jcn94bk59n5wqppdwwaoqg6f	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:49.426425-05
ul5ylk42vw6bdrekybm94e4ec6m3mlcv	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:49.43191-05
mspw0o5nc3d8zt14ew809wgygmqa3uiq	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-04 19:36:49.442741-05
0h4kcr5ktj1pjq28wtk47adwqbfmkzor	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-11-10 04:21:28.103189-05
ylf2766n7jxl3azkcntenrqrljuniqhg	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-24 17:20:43.015687-05
qv1cd92ux4zxjtcu7g2vu7puyhvhjrlu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:24.528085-05
bcn4khklkdmnch0thtkcybj0zt02p67d	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:24.685628-05
abet88w63be8qctcn6ukxinvzfqn8s1m	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:24.830817-05
i77im1am4ghg6skkmref28ajovx6kquk	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:25.007846-05
u0iwi6f1ucz9xncw3gop1mdi5c9g709d	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:25.039409-05
yml7iye09xxp72ytimjjmzx026xbza61	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:25.100233-05
08xo4kepjl3htlyp23byg17amguj5ola	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:28.406622-05
ng91ih298v08jp75u4725r3luofm5yfd	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:28.483081-05
ekl6g1iigk7gahgtuhe4e40rzl5nzmjo	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:28.586497-05
pdrvzsc1uco298jqf1nsllrvhtlm8p2u	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:29.005309-05
hsk0s6dynuqzbsn3sx98axqral7dzzr4	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:29.052357-05
l87cyao4585u2ehssa5l06o24pzw9rld	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:29.06143-05
pphyohgvf691ynpsh66f43xa7syxtkdm	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.288216-05
wobbp26ww5zjv6xjr9w2xdyrbuxr0dlz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.30898-05
pnc2wf6z915azckh0z50pp036k6ycgkn	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.386112-05
xa5jpnbh7rwq4citrmb7vpsv30f90hca	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.40338-05
4fqgzadsginxg2bui8ftujbunuwcqbv2	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.654759-05
litn8xx1hoplwae0v9t7d034lcyub0gy	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:32.715726-05
xhox7jfds2wp1aypbl9oxvg5z5lvylwx	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:34.684084-05
78aiyy4w5n0qigloru44irxgdgikgrij	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:34.697211-05
1egfhv8pu9ke1prkl6hebd0f2ny4fsto	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:34.710978-05
bj1i4k40g8nb6a0elcncdv2paq8mc0z5	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:23:34.729617-05
t2op88ojqu1xsn234gmt47ihecpkdvtu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.114006-05
ev9wcrcjk71vbw0o9ouop51v385m2cyt	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.158288-05
rvbfgxbgq0a7wc6xs48vyunr1s68tjmz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.319855-05
p1xiyzxq455a59n27zqi3cgykf3ikxyk	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.499056-05
rkfzzqe3jaejw2f9u9hdkqrrhljui8bu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.503025-05
ont7ggeyk2zybm5dhnr7scjs74stbn4e	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:11.524311-05
y15frr9bhsy2uwa18dq5oxy62qf7766y	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:14.983213-05
di038l0mqdh5sbek43ynqzue8uymg9r6	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:15.260286-05
tiott1cna65wz3hrlaqfhmdcfedfjucm	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:15.461087-05
oqqotptjuj5qxenq8ym61f0j14gxy41i	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:15.484646-05
r6e7krnloqhzhw69k6qyidrqczr7jhcc	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:15.503462-05
6nt0sj87sionlkiaactbhtaf1ofzhr2u	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:15.707769-05
tx8hmrzpw2vy83fgatxc7c0t910r8hjv	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.290931-05
7o6w87ozfrvhop0rs4snlk1o7cy6vedt	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.589367-05
jb2bajnduq8ltb22rv7rzxv3jzt6qqf4	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.749637-05
toljclalpxa1rnbv8k90tfusr1y7xsbj	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.822581-05
7ek3sc511vcuf5mu9j32bj0okh9i68iz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.879811-05
g54f6x46je2y5xn7xocj0k1k9yi2rfdy	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:18.9468-05
sgda7c485etvlby9hec97uuinra6du0z	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:21.297582-05
ba1wq5zu5bn3d65k72bnc9lrpcbo5n7d	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:21.437226-05
0b2vs0i8rsvxwsygm2d5ft0e3dvrpwq9	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:21.476-05
u28jttmcppo5ilfs08uthr83yoayf1nl	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:21.490569-05
jlwg5a8k27pvpa1e6wa58hr18vz59veh	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.019072-05
atahq2x0lg5oygs15kjz5b22ffsr663i	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.164314-05
4sicmopg1f4o7pmg6szdrgf1ywkw2ac3	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.167724-05
l9qo6stqi4shhkbw17ldz6cqapzh1koe	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.193696-05
2ysklkob8tq2uttfqrkyd2qq2rhrspmi	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.216645-05
nj3c3cgw09juvg4ggyw6a6orfcz56l0f	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:30.220119-05
we1l9zp4o3husw9y12lpba1z9d43kwv8	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.031419-05
bd2w6c0suwqvhkpnx4xwuy9h6hgeobeg	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.278671-05
9yxkrvuw808qq7nxzjtytxp7j2f5tz5f	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.349203-05
ve6lsp22pedpofszo37zwgnzvoinzzr9	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.432881-05
5l0zgyt4gtsu6pe43wsktuaghgfebf14	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.463337-05
z7stl4pi02qzlm1px6bblfgs70q2uu6i	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:34.574938-05
dwha5xzlfy8k89niuq6jrgv7q0qi76lh	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.039744-05
vnm01gtb68z7k3ynvfdlz779xtoxl9mq	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.37858-05
96wvn8s15l2mlzzo05s63d0p446q2iss	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.563072-05
0l3dhv7e8itucfha9zbb9mwhbgyosgkf	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.720839-05
9l2ouani1zv9h8b4cqco8oqpr5xdaj59	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.734435-05
eozc44idyu33lat3n3gli3ch6bvxap4u	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:37.884922-05
atjet3p2s12s20pxepsiy1mv212s6on3	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:39.592488-05
bwkn24qdsodx4d10y0i00secfnk762a9	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:39.678778-05
npozjw6xrd9arz4ied7jcmnmuq48bmto	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:39.73378-05
t74yipiop32wmv7k4e4dy07yl85jt8cx	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:39.761438-05
6zy6ifweisa2hmwlnekbvc9c098fjqo5	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:51.695371-05
bp5brk0eqx986t5sgjoz8nznxipjnir0	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:51.869555-05
id8c5uc3mrwb16iwv9oyd3pmmrm5cmpg	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:51.866088-05
pog88hla69yhuymd0z0sxmbfwhy7yxti	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:51.921701-05
ghav8ilx80bil0x806nd9ratec9voxm3	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:51.965819-05
4k5bnhufi4hlf5dv16o9wfvl4a21hoes	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:52.094885-05
2ba0mwa708ym8ui1cjgshf7kkhp47u9w	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:55.58161-05
yti408g225lzq8fmyx2bn4dejwh6t87q	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:55.707666-05
u7zbs5ialzbla600g8tsxa5twqfexlil	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:55.793294-05
g28p7y0pfdu8vjph1kbjxwfixht0g4va	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:56.087103-05
b64bs7sf5iq2ce4tr80li7pphp1t3oy8	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:56.143648-05
aunxxls1756nq53wspmmv5l74funl1vj	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:56.14519-05
vs9xs3szl2m12lh08aqajy3c42235ink	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:58.96857-05
3e7tl10t2qd99f5o2f10geue51bc85zz	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:59.018179-05
y32eful3w0smy1u63sdlyai8y79mqrn2	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:59.13518-05
mfr7fq55tbjlvqmz71bkdnxawifkljlu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:59.360683-05
6y06wvoeylbpd2378rk82ah8sfci8ed1	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:59.42086-05
sv3orgbpabemltpvgjxcgfic3gd4tfsh	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:24:59.489778-05
8ajw606u9e2x5obsdgswkg7wqdyupbhk	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:01.278839-05
sk7qgjknxaboqoak09zepxg50j347w25	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:01.313478-05
b905vrtmycawge8pc3kywptt8dqy78om	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:01.354517-05
43zkxptj18oe3v3lv2t8w3uxeurips3m	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:01.406328-05
kyz60swqqf7e7pjggljg63ttelcqvlop	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.259374-05
2vg83qusqjsdfw5fsxfi1knvl0i7rd4j	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.450679-05
i55p7kgli1z5lz9fvof4mzet4oemalb0	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.635132-05
rrfauh2jjnhooru603r46w7qrc3dbjsb	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.649146-05
jiarde6r4zn2d2rd7xhze96p3jjdyuqo	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.672308-05
geehccss9335y6qv2ch37tzm4os6izru	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:18.774457-05
c9enflgdm6oph2ww1vqq5ojqbi7l18oc	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:21.979558-05
ju15npf7drivq4di1hsd38k7o2yh8rfx	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:22.463852-05
1g5msm7mvy99d2xaum3dok7mep7xgcv2	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:22.538015-05
lyh5okga7mjhn7vt00eu8ay2hmoyzmwi	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:22.550419-05
fwzxvd81lqpbjpw3j6wyayuonajik7di	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:22.60573-05
irmddl6xbi5xq5zmklzv5ffz07oh7w9m	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:22.686673-05
zy68ywng775rgssp8lwd7gnmgutjbubu	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:25.804433-05
xquwcuty7natio19kd8lt3bcmei8o0dd	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:26.304091-05
r16kcns1sx7o78ru4gac4icent2z42c3	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:26.550755-05
he6l6hpydlz0e8nj7wfk6yxhdwtw0bt1	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:26.600102-05
kwkwepwgyk513el9ug0pxq11xdkn0408	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:26.707504-05
gcr4wnz5h9icapfe35utcb3hcm2gqkjn	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:26.777438-05
t0bi8j9g75wsewtq1dn6y054l3jf2o6u	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:27.834021-05
y8o2b1om1gpji02bo0ys0l5s8io2l4hh	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:32.940906-05
sbipibdnc16lkwgj1xvxojkf5nl7uu72	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:33.007972-05
kjhgflltw90e0n28wv3wfjuiwjpk40a0	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:33.154716-05
l17xt3xgds12zc25uy3wajhfn0jh1h3z	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:33.161111-05
txpwdnc7hy3yj4urlip4rhd2jrloyjev	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:33.195346-05
x2545blfzx75ld8mpva9wclh6ofblsm0	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:33.239346-05
npek7tqp6ib8d41ykk5shh6z8krgrh2h	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:36.795421-05
2osahdyuedx07u1j9w2qcie1uv933tkj	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:36.926928-05
62ubnnkvf7llmge1lh42y16r2l20amth	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:37.082813-05
f56gazan7r7seajjnmhmbmce8iasdwak	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:37.113469-05
2qv4jjs6e4kcfkzrbf29dw8vaoy7z4ov	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:37.19644-05
bmgokzn0pajg96s2cgsj2uqs2i5upv05	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:37.305014-05
ml75150vh6rcnix9z7no3sg4e8u22ypp	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.006568-05
epjfs1wktnpilpgztxq3o77c5o43a41z	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.06624-05
g0jc3gtm7dco5h8t28jphmld2btmhhfo	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.289456-05
4m9dlq17sswpb73tsmh13qgeh9d0smsq	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.292037-05
vsdx1bj9uty450gevri93wk9a3ez5hga	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.354294-05
ijniydeytz90us2k7p97q4m90mvc6zh7	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:40.586666-05
1mr9tnltg5n3aoz63ezcdksb82uk8tpm	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:42.471013-05
dqqqd11sz46s3wnb2rqndf5ixkynpvcm	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:42.580275-05
5ber97gt0nw9221zdeffrc8fm51dz57j	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:42.639949-05
iht0zeklduebfeeev2b40ywdh57k3nze	MTA4ODU4ZmU2YWUxYmE3Mjc5MzQ2M2IxMzBlZGMxYjY3YWE4NzI3ODp7fQ==	2015-11-25 10:25:42.64068-05
56e82bdp0qajm0hnkg11peleeu742kmi	MmNjODgxNWYzMzBkNjA4Y2UyNTFhZjYyMDJiNjgwMzRmNzc2ZWI1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcxZTMxMjY3YjNkYjhhODY1YzkzNGRiMDA1YjcyZWNkYjMwZTBmNWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-12-14 13:46:04.352661-05
\.


--
-- Data for Name: fundraiser_fundraiser; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraiser (id, title, description, status, finalized, created, updated, discount, slug, receipt_email_sent, account_id, plan_id, profile_id, type_id) FROM stdin;
8	ok ok ok	 ok	unpaid	t	2015-10-09 10:04:19.781563-04	2015-10-09 10:04:50.827715-04	0.00	\N	t	\N	14	8	3
9	Fall Special	f	in-process	f	2015-10-09 10:05:01.095113-04	2015-10-09 10:05:04.217834-04	0.00	\N	f	\N	13	9	3
10	new fundraiser	test	unpaid	t	2015-10-12 17:56:29.661764-04	2015-10-12 18:12:01.258798-04	0.00	new-fundraiser-10	t	1	14	10	3
\.


--
-- Name: fundraiser_fundraiser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraiser_id_seq', 10, true);


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
2	3.00	fundraiser-type-2	fundraiser_types/logo-yello_WX0N8pX.png	Option 2: Pick from 16	/Users/mzakany/Desktop/jmi_fundraising/docs/option-2-package.zip	2
1	3.00	fundraiser-type-1	fundraiser_types/logo-red_X2kLiUH.png	Option 1: Pick from 23	/Users/mzakany/Desktop/jmi_fundraising/docs/option-1-package.zip	1
3	3.00	fundraiser-type-3	fundraiser_types/logo-green_3WJDlbB.png	Option 3: Pick from 9	/Users/mzakany/Desktop/jmi_fundraising/docs/option-3-package.zip	3
\.


--
-- Name: fundraiser_fundraisertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_id_seq', 3, true);


--
-- Data for Name: fundraiser_fundraisertype_selections; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertype_selections (id, fundraisertype_id, product_id) FROM stdin;
476	3	3
477	3	5
478	3	8
479	3	11
480	3	13
374	2	1
375	2	2
376	2	3
377	2	5
378	2	6
379	2	8
380	2	11
381	2	13
382	2	14
383	2	16
384	2	17
385	2	20
386	2	21
387	2	22
481	3	16
482	3	19
483	3	21
484	3	22
441	1	1
442	1	2
443	1	3
444	1	4
445	1	5
446	1	6
447	1	7
448	1	8
449	1	9
450	1	10
451	1	11
452	1	12
453	1	13
454	1	14
455	1	15
456	1	16
457	1	17
458	1	18
459	1	19
460	1	20
461	1	21
462	1	22
\.


--
-- Name: fundraiser_fundraisertype_selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_selections_id_seq', 484, true);


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
8	check	\N	\N	\N	8
9	check	\N	\N	\N	10
\.


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('payment_payment_id_seq', 9, true);


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
147	234	1	8
148	0	3	8
149	0	10	8
150	0	16	8
151	345	6	8
152	0	8	8
153	0	9	8
154	0	17	8
155	0	19	8
156	0	18	8
157	0	11	8
158	0	13	8
159	0	15	8
160	0	4	8
161	0	22	8
162	0	5	8
163	0	7	8
164	0	20	8
165	0	21	8
166	0	2	8
167	0	12	8
168	0	14	8
169	0	1	9
170	0	3	9
171	43	10	9
172	0	16	9
173	0	6	9
174	0	8	9
175	0	9	9
176	0	17	9
177	0	19	9
178	0	18	9
179	0	11	9
180	0	13	9
181	0	15	9
182	0	4	9
183	0	22	9
184	0	5	9
185	0	7	9
186	0	20	9
187	0	21	9
188	0	2	9
189	0	12	9
190	0	14	9
191	0	3	10
192	23	16	10
193	34	8	10
194	0	19	10
195	0	11	10
196	0	13	10
197	0	22	10
198	22	5	10
199	0	21	10
\.


--
-- Name: shipment_selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_selection_id_seq', 199, true);


--
-- Data for Name: shipment_shipment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY shipment_shipment (id, created, updated, address_id, comment_id, fundraiser_id) FROM stdin;
8	2015-10-09 10:04:19.783068-04	2015-10-09 10:04:50.661056-04	1	8	8
9	2015-10-09 10:05:01.097194-04	2015-10-09 10:05:16.406506-04	1	\N	9
10	2015-10-12 17:56:29.663448-04	2015-10-12 17:56:54.624729-04	1	9	10
\.


--
-- Name: shipment_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_shipment_id_seq', 10, true);


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
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: mzakany; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


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
-- Name: account_profile_55d551ed; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX account_profile_55d551ed ON account_profile USING btree (token_id);


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
-- Name: authtoken_token_key_7222ec672cd32dcd_like; Type: INDEX; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE INDEX authtoken_token_key_7222ec672cd32dcd_like ON authtoken_token USING btree (key varchar_pattern_ops);


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
-- Name: account_profil_token_id_2589933fe3c6ec30_fk_authtoken_token_key; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY account_profile
    ADD CONSTRAINT account_profil_token_id_2589933fe3c6ec30_fk_authtoken_token_key FOREIGN KEY (token_id) REFERENCES authtoken_token(key) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mzakany
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: public; Type: ACL; Schema: -; Owner: mzakany
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mzakany;
GRANT ALL ON SCHEMA public TO mzakany;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

