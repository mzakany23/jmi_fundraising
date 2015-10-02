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
-- Name: account_profile; Type: TABLE; Schema: public; Owner: mzakany; Tablespace: 
--

CREATE TABLE account_profile (
    id integer NOT NULL,
    organization character varying(100),
    org_photo character varying(100),
    address_id integer,
    stripe_id character varying(100),
    slug character varying(50),
    email character varying(40),
    first_name character varying(20),
    last_name character varying(20),
    phone_number character varying(10),
    account_id integer
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
    title character varying(40),
    street character varying(40),
    line_2 character varying(40),
    state character varying(40),
    city character varying(40),
    country character varying(40),
    zip_code character varying(40),
    shipping boolean NOT NULL,
    billing boolean NOT NULL
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
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    account_id integer,
    type_id integer,
    profile_id integer,
    status character varying(40),
    title text,
    description text,
    slug character varying(400),
    discount numeric(10,2) NOT NULL,
    finalized boolean NOT NULL,
    receipt_email_sent boolean NOT NULL
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
    title text,
    description text,
    name character varying(40),
    type character varying(40),
    image character varying(100)
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
    title character varying(40) NOT NULL,
    image character varying(100),
    slug character varying(50),
    jar_price numeric(10,2) NOT NULL
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
    featured boolean NOT NULL
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
    fundraiser_id integer NOT NULL,
    comment_id integer
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
-- Data for Name: account_profile; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY account_profile (id, organization, org_photo, address_id, stripe_id, slug, email, first_name, last_name, phone_number, account_id) FROM stdin;
45	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2		1	\N	cleveland-orchestra-musicians-non-profit-45	mzakany@gmail.com	Michael	Zakany	3306126183	1
\.


--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('account_profile_id_seq', 45, true);


--
-- Data for Name: address_address; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY address_address (id, title, street, line_2, state, city, country, zip_code, shipping, billing) FROM stdin;
2		2641 Shaker Rd.		OH	Cleveland Heights	\N	44118	t	f
3		2641 Shaker Rd.		OH	Cleveland Heights	\N	44118	t	f
4		2641 Shaker Rd.		OH	Cleveland Heights	\N	44118	t	f
1		2641 Shaker Rd.		OH	Cleveland Heights	\N	44118	t	f
\.


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('address_address_id_seq', 4, true);


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
43	Can add fundraiser category	15	add_fundraisercategory
44	Can change fundraiser category	15	change_fundraisercategory
45	Can delete fundraiser category	15	delete_fundraisercategory
46	Can add fundraiser type	16	add_fundraisertype
47	Can change fundraiser type	16	change_fundraisertype
48	Can delete fundraiser type	16	delete_fundraisertype
49	Can add address	17	add_address
50	Can change address	17	change_address
51	Can delete address	17	delete_address
52	Can add shipment	18	add_shipment
53	Can change shipment	18	change_shipment
54	Can delete shipment	18	delete_shipment
55	Can add selection	19	add_selection
56	Can change selection	19	change_selection
57	Can delete selection	19	delete_selection
58	Can add generic discount	20	add_genericdiscount
59	Can change generic discount	20	change_genericdiscount
60	Can delete generic discount	20	delete_genericdiscount
61	Can add single discount	21	add_singlediscount
62	Can change single discount	21	change_singlediscount
63	Can delete single discount	21	delete_singlediscount
64	Can add email news letter	22	add_emailnewsletter
65	Can change email news letter	22	change_emailnewsletter
66	Can delete email news letter	22	delete_emailnewsletter
67	Can add payment	23	add_payment
68	Can change payment	23	change_payment
69	Can delete payment	23	delete_payment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('auth_permission_id_seq', 69, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$15000$0wqVG0mXYenV$GUTglY6aQcJDhQ38M5voKPvxI1fWBd9s2IH37qoQLrM=	2015-09-25 16:29:23.836496-04	t	salsaking2015			mike@josemadridsalsa.com	t	t	2015-09-25 16:29:23.836496-04
3	pbkdf2_sha256$15000$ICG543YBiWQW$0tjI/XTXrryhUOYXq7FQfWDgQF6Bmj1UBp0hYVtgk2w=	2015-09-29 13:03:26.104892-04	f	mzakanySenior				f	t	2015-09-29 13:03:25.778424-04
1	pbkdf2_sha256$15000$LgEdLuxAKw9J$Ha7Asr69F6jW0pwINd6u5dHxM73WXi/AW4ihdPsQMIo=	2015-09-29 13:26:49.389194-04	t	mzakany			mzakany@gmail.com	t	t	2015-09-25 16:28:50.914242-04
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
-- Data for Name: comment_fundraiserordercomment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY comment_fundraiserordercomment (id, comment, fundraiser_id) FROM stdin;
11	okokokoko	36
\.


--
-- Name: comment_fundraiserordercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('comment_fundraiserordercomment_id_seq', 11, true);


--
-- Data for Name: comment_usercomment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY comment_usercomment (id, comment, approved, account_id, fundraiser_id) FROM stdin;
\.


--
-- Name: comment_usercomment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('comment_usercomment_id_seq', 3, true);


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
1	2015-09-25 16:54:25.140569-04	1	Mile	1		13	1
2	2015-09-25 16:54:40.059292-04	2	Mediuam	1		13	1
3	2015-09-25 16:54:51.75554-04	3	hot	1		13	1
4	2015-09-25 16:55:03.021689-04	4	x-hot	1		13	1
5	2015-09-25 16:55:08.199536-04	1	BLACK BEAN AND CORN PABLANO	1		11	1
6	2015-09-25 16:55:20.473348-04	1	BLACK BEAN AND CORN PABLANO	2	Changed category.	11	1
7	2015-09-25 16:55:33.303709-04	1	Mild	2	Changed title.	13	1
8	2015-09-25 16:55:52.678433-04	2	Medium	2	Changed title.	13	1
9	2015-09-25 16:56:09.932479-04	3	hot	2	Changed order.	13	1
10	2015-09-25 16:56:26.7159-04	3	hot	2	Changed order.	13	1
11	2015-09-25 16:57:49.012939-04	2	Medium	2	No fields changed.	13	1
12	2015-09-25 17:12:10.916787-04	1	BLACK BEAN AND CORN PABLANO	2	Changed price.	11	1
13	2015-09-25 17:12:18.939232-04	1	BLACK BEAN AND CORN PABLANO	2	Changed price.	11	1
14	2015-09-25 17:16:03.506731-04	2	CHERRY CHOCOLATE HOT	1		11	1
15	2015-09-25 17:16:32.548765-04	3	CHERRY MILD	1		11	1
16	2015-09-25 17:17:03.979153-04	4	CHIPOTLE CON QUESO	1		11	1
17	2015-09-25 17:17:36.564111-04	5	CHIPOTLE HOT	1		11	1
18	2015-09-25 17:18:02.406292-04	6	ORIGINAL HOT	1		11	1
19	2015-09-25 17:18:15.464576-04	7	ORIGINAL HOT	1		11	1
20	2015-09-25 17:18:45.478206-04	3	CHERRY MILD	2	Changed description.	11	1
21	2015-09-25 17:19:36.924489-04	8	CLOVIS MEDIUM	1		11	1
22	2015-09-25 17:37:29.530977-04	9	ORIGINAL MILD	1		11	1
23	2015-09-25 17:37:59.034312-04	10	ORIGINAL X-HOT	1		11	1
24	2015-09-25 17:38:30.245728-04	11	GARDEN CILANTRO SALSA HOT	1		11	1
25	2015-09-25 17:38:56.049188-04	12	GARDEN CILANTRO SALSA MILD	1		11	1
26	2015-09-25 17:39:25.199089-04	13	JAMAICAN JERK HOT	1		11	1
27	2015-09-25 17:44:50.048425-04	14	MANGO MILD	1		11	1
28	2015-09-25 17:45:32.322045-04	15	PEACH	1		11	1
29	2015-09-25 17:45:52.212664-04	16	PINEAPPLE MILD	1		11	1
30	2015-09-25 17:46:19.214011-04	17	RASPBERRY BBQ CHIPOTLE	1		11	1
31	2015-09-25 17:46:53.037887-04	18	ROASTED GARLIC & OLIVES	1		11	1
32	2015-09-25 17:48:05.890095-04	19	RASPBERRY MILD	1		11	1
33	2015-09-25 17:48:33.656197-04	20	ROASTED PINEAPPLE HABANERO HOT	1		11	1
34	2015-09-25 17:48:59.266008-04	21	SPANISH VERDE MILD	1		11	1
35	2015-09-25 17:49:25.398931-04	22	SPANISH VERDE HOT	1		11	1
36	2015-09-25 17:50:06.200499-04	5	xx-hot	1		13	1
37	2015-09-25 17:50:59.900247-04	23	SPANISH VERDE XX-STUPID-HOT	1		11	1
38	2015-09-25 17:52:25.692767-04	1	Pick from 4	1		15	1
39	2015-09-25 17:52:52.00599-04	2	Choose from 8	1		15	1
40	2015-09-25 17:52:58.397827-04	1	Choose from 4	2	Changed title.	15	1
41	2015-09-25 17:53:44.979285-04	1	Pick 4	1		16	1
42	2015-09-25 17:54:17.342585-04	2	Choose 10	1		16	1
43	2015-09-25 17:54:34.385366-04	2	Pick 10	2	Changed title.	16	1
44	2015-09-25 17:55:35.546436-04	2	Pick 10	2	Changed image.	16	1
45	2015-09-25 17:55:42.256684-04	1	Pick 4	2	Changed image.	16	1
46	2015-09-25 17:56:20.632697-04	3	Pick from 23	1		16	1
47	2015-09-25 17:56:27.162208-04	2	Pick from 10	2	Changed title.	16	1
48	2015-09-25 17:56:33.538256-04	1	Pick from 4	2	Changed title.	16	1
49	2015-09-25 17:56:47.1501-04	2	Choose from 8	3		15	1
50	2015-09-25 17:56:47.154582-04	1	Choose from 4	3		15	1
51	2015-09-25 17:58:37.566682-04	3	Pick from 23	2	Changed image.	16	1
52	2015-09-25 18:00:15.916265-04	16	PINEAPPLE MILD	3		11	1
53	2015-09-25 18:00:41.66082-04	24	PINEAPPLE MILD	1		11	1
54	2015-09-26 08:32:49.949722-04	24	PINEAPPLE MILD	2	Changed featured.	11	1
55	2015-09-26 08:33:25.702357-04	21	SPANISH VERDE MILD	2	Changed featured.	11	1
56	2015-09-26 08:33:25.707125-04	19	RASPBERRY MILD	2	Changed featured.	11	1
57	2015-09-26 08:33:25.710427-04	17	RASPBERRY BBQ CHIPOTLE	2	Changed featured.	11	1
58	2015-09-26 08:33:25.713431-04	15	PEACH	2	Changed featured.	11	1
59	2015-09-26 08:33:25.716356-04	14	MANGO MILD	2	Changed featured.	11	1
60	2015-09-26 08:33:25.720681-04	12	GARDEN CILANTRO SALSA MILD	2	Changed featured.	11	1
61	2015-09-26 08:33:25.723823-04	9	ORIGINAL MILD	2	Changed featured.	11	1
62	2015-09-26 08:33:25.726608-04	3	CHERRY MILD	2	Changed featured.	11	1
63	2015-09-26 08:33:25.729684-04	1	BLACK BEAN AND CORN PABLANO	2	Changed featured.	11	1
64	2015-09-26 08:33:25.73268-04	18	ROASTED GARLIC & OLIVES	2	Changed featured.	11	1
65	2015-09-26 08:33:25.735868-04	8	CLOVIS MEDIUM	2	Changed featured.	11	1
66	2015-09-26 08:33:25.739104-04	4	CHIPOTLE CON QUESO	2	Changed featured.	11	1
67	2015-09-26 08:33:25.746041-04	22	SPANISH VERDE HOT	2	Changed featured.	11	1
68	2015-09-26 08:33:25.750405-04	20	ROASTED PINEAPPLE HABANERO HOT	2	Changed featured.	11	1
69	2015-09-26 08:33:25.753841-04	13	JAMAICAN JERK HOT	2	Changed featured.	11	1
70	2015-09-26 08:33:25.756682-04	11	GARDEN CILANTRO SALSA HOT	2	Changed featured.	11	1
71	2015-09-26 13:57:38.786688-04	12	GARDEN CILANTRO SALSA MILD	2	Changed description.	11	1
72	2015-09-26 13:58:20.298164-04	6	ORIGINAL HOT	3		11	1
73	2015-09-28 20:06:22.202854-04	8	Fundraiser: Cleveland Heights Library - Fall Fundraiser	3		14	1
74	2015-09-28 20:06:22.207041-04	7	Fundraiser: hey hey	3		14	1
75	2015-09-28 20:06:22.208579-04	6	Fundraiser: this one works	3		14	1
76	2015-09-28 20:06:22.209711-04	5	Fundraiser: xyz	3		14	1
77	2015-09-28 20:06:33.716256-04	4	Fundraiser: xyz	3		14	1
78	2015-09-28 20:06:33.720325-04	3	Fundraiser: a new great fundraiser	3		14	1
79	2015-09-28 20:06:33.721728-04	2	Fundraiser: mcz	3		14	1
80	2015-09-28 20:06:33.722901-04	1	Fundraiser: Mikes fundraiser	3		14	1
81	2015-09-28 20:21:43.522194-04	9	Cleveland Heights Library	3		8	1
82	2015-09-28 20:21:43.526143-04	8	ok 	3		8	1
83	2015-09-28 20:21:43.52755-04	7	h	3		8	1
84	2015-09-28 20:21:43.528686-04	6	z	3		8	1
85	2015-09-28 20:21:43.529777-04	5	None	3		8	1
86	2015-09-28 20:21:43.530982-04	4	None	3		8	1
87	2015-09-28 20:21:43.532017-04	3	None	3		8	1
88	2015-09-28 20:21:43.532962-04	2	mcz	3		8	1
89	2015-09-28 20:21:43.533992-04	1	Mike Zakany LLC	3		8	1
90	2015-09-29 09:10:20.948868-04	11	Cleveland Orchestra Musicians	3		8	1
91	2015-09-29 09:10:20.95286-04	10	Mike Zakany LLC	3		8	1
92	2015-09-29 11:37:33.405789-04	12	Cleveland Orchestra Musicians	3		8	1
93	2015-09-29 11:46:14.843274-04	16	ok does this work	3		8	1
94	2015-09-29 11:46:14.847303-04	15	ok ok ok	3		8	1
95	2015-09-29 11:46:14.848707-04	14	Cleveland Orchestra Musicians - Youth Division - Zanesville Ohio 43701 West Division	3		8	1
96	2015-09-29 11:46:14.849854-04	13	Cleveland Orchestra Musicians - Youth Division	3		8	1
97	2015-09-29 13:27:08.209952-04	11	GARDEN CILANTRO SALSA HOT	2	Changed featured.	11	1
98	2015-09-29 13:27:08.214546-04	7	ORIGINAL HOT	2	Changed featured.	11	1
99	2015-09-29 13:27:08.21759-04	5	CHIPOTLE HOT	2	Changed featured.	11	1
100	2015-09-29 13:27:08.220865-04	2	CHERRY CHOCOLATE HOT	2	Changed featured.	11	1
101	2015-09-29 13:27:38.015175-04	13	JAMAICAN JERK HOT	2	Changed featured.	11	1
102	2015-09-29 13:28:05.334825-04	24	PINEAPPLE MILD	2	Changed featured.	11	1
103	2015-09-29 13:28:05.339374-04	21	SPANISH VERDE MILD	2	Changed featured.	11	1
104	2015-09-29 13:28:05.342778-04	19	RASPBERRY MILD	2	Changed featured.	11	1
105	2015-09-29 13:28:05.346628-04	17	RASPBERRY BBQ CHIPOTLE	2	Changed featured.	11	1
106	2015-09-29 13:28:05.350004-04	15	PEACH	2	Changed featured.	11	1
107	2015-09-29 13:28:05.353337-04	9	ORIGINAL MILD	2	Changed featured.	11	1
108	2015-09-29 13:28:05.357638-04	3	CHERRY MILD	2	Changed featured.	11	1
109	2015-09-29 13:28:19.458472-04	24	PINEAPPLE MILD	2	Changed featured.	11	1
110	2015-09-29 13:28:19.46274-04	21	SPANISH VERDE MILD	2	Changed featured.	11	1
111	2015-09-29 13:28:19.465815-04	19	RASPBERRY MILD	2	Changed featured.	11	1
112	2015-09-29 13:28:19.468665-04	17	RASPBERRY BBQ CHIPOTLE	2	Changed featured.	11	1
113	2015-09-29 13:28:19.471675-04	15	PEACH	2	Changed featured.	11	1
114	2015-09-29 13:28:19.475453-04	23	SPANISH VERDE XX-STUPID-HOT	2	Changed featured.	11	1
115	2015-09-29 19:21:14.591131-04	20	jfjf	3		8	1
116	2015-09-29 19:21:14.595878-04	19	xyz	3		8	1
117	2015-09-29 19:21:14.597285-04	18	Mike Zakany LLC	3		8	1
118	2015-09-29 19:21:14.598405-04	17	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
119	2015-09-29 19:27:17.172565-04	21	Cleveland Orchestra Musicians	3		8	1
120	2015-09-29 19:27:53.310106-04	22	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
121	2015-09-29 19:36:23.400733-04	23	Cleveland Orchestra Musicians - Youth Division	3		8	1
122	2015-09-29 19:37:20.121581-04	24		1		8	1
123	2015-09-29 19:37:52.850565-04	25		1		8	1
124	2015-09-29 19:38:10.229041-04	23	Fundraiser: clevealnd orchesta youth muciscians fall campain -2 winter dividiaon	1		14	1
125	2015-09-29 19:38:33.269861-04	23	Fundraiser: clevealnd orchesta youth muciscians fall campain -2 winter dividiaon	3		14	1
126	2015-09-29 19:38:40.736883-04	25		3		8	1
127	2015-09-29 19:38:40.741143-04	24		3		8	1
128	2015-09-29 19:39:39.584084-04	24	Fundraiser: 	1		14	1
129	2015-09-29 19:41:30.629397-04	24		3		18	1
130	2015-09-29 19:43:12.07863-04	25	Fundraiser: cleveland heights orchestra musician fall camplain fundraiser man - winter 2 hey hey hey	1		14	1
131	2015-09-29 19:45:11.458101-04	26	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
132	2015-09-29 19:46:59.793404-04	27	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
133	2015-09-29 19:49:11.719027-04	28	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
134	2015-09-29 19:52:33.75329-04	29	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
135	2015-09-29 19:54:29.394945-04	30	Cleveland Heights Library	3		8	1
136	2015-09-29 19:55:06.346556-04	31	ok	3		8	1
137	2015-09-29 20:49:14.371493-04	32	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
138	2015-09-29 20:52:29.622233-04	29	Fundraiser: asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf	1		14	1
139	2015-09-29 20:52:55.071403-04	33	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
140	2015-09-29 20:56:22.560832-04	35	Some Organization	3		8	1
141	2015-09-29 20:56:22.564803-04	34	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
142	2015-09-29 20:57:12.304621-04	36	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	3		8	1
143	2015-09-29 20:59:00.492677-04	38	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
144	2015-09-29 20:59:00.496824-04	37	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	3		8	1
145	2015-09-29 20:59:20.941715-04	39	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
146	2015-09-29 21:02:42.125565-04	40	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
147	2015-09-29 21:03:27.911223-04	41	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
148	2015-09-30 09:42:52.618313-04	42	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
149	2015-09-30 13:50:13.367576-04	43	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
150	2015-09-30 13:51:41.83748-04	44	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser 2	3		8	1
151	2015-09-30 14:18:45.46421-04	3	Pre-sell individual jars @$6.00 per jar, you keep $3.00 per jar.	1		15	1
152	2015-09-30 14:19:14.215692-04	4	Buy-Sell.  Purchase salsa by the case @$3.00 per jar and sell @$6.00 per jar.	1		15	1
153	2015-09-30 14:19:40.090259-04	5	Pre-sell mix and match cases at $72.00 per case, you keep $36.00 per case.	1		15	1
154	2015-09-30 16:41:34.413946-04	5	Pre-sell mix and match cases at $72.00 per case, you keep $36.00 per case.	2	Changed image.	15	1
155	2015-09-30 16:58:02.403685-04	4	Buy-Sell.  Purchase salsa by the case @$3.00 per jar and sell @$6.00 per jar.	2	Changed image.	15	1
156	2015-09-30 16:58:15.944573-04	3	Pre-sell individual jars @$6.00 per jar, you keep $3.00 per jar.	2	Changed image.	15	1
157	2015-09-30 19:18:54.194669-04	5	Pre-sell mix and match cases. $72.00 per case, you keep $36.00 per case.	2	Changed title.	15	1
158	2015-09-30 19:19:32.234807-04	4	Buy-Sell.  Purchase salsa by the case at $3.00 per jar and sell at $6.00.	2	Changed title.	15	1
159	2015-09-30 19:56:14.751046-04	3	Pre-sell individual jars. $6 per jar, you keep $3	2	Changed title.	15	1
160	2015-09-30 19:56:34.784902-04	4	Buy-Sell.  Purchase salsa by the case at $3 per jar and sell at $6.	2	Changed title.	15	1
161	2015-09-30 19:56:50.638307-04	5	Pre-sell mix and match cases. $72 per case, you keep $36 per case.	2	Changed title.	15	1
162	2015-09-30 19:57:15.743722-04	4	Buy-Sell.  Purchase salsa by the case at $3 per jar and sell at $6.	2	No fields changed.	15	1
163	2015-09-30 19:59:45.361409-04	3	Pre-sell individual jars at $6 per jar, you keep $3 per jar.	2	Changed title.	15	1
164	2015-09-30 20:00:20.44848-04	5	Pre-sell mix and match cases at $72 per case, you keep $36 per case.	2	Changed title.	15	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 164, true);


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
15	fundraiser category	fundraiser	fundraisercategory
16	fundraiser type	fundraiser	fundraisertype
17	address	address	address
18	shipment	shipment	shipment
19	selection	shipment	selection
20	generic discount	marketing	genericdiscount
21	single discount	marketing	singlediscount
22	email news letter	marketing	emailnewsletter
23	payment	payment	payment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_content_type_id_seq', 23, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-09-25 16:27:51.905136-04
2	auth	0001_initial	2015-09-25 16:27:52.024265-04
3	fundraiser	0001_initial	2015-09-25 16:27:52.078173-04
4	address	0001_initial	2015-09-25 16:27:52.148072-04
5	account	0001_initial	2015-09-25 16:27:52.264647-04
6	account	0002_profile_stripe_id	2015-09-25 16:27:52.394143-04
7	account	0003_auto_20150726_1453	2015-09-25 16:27:52.557362-04
8	account	0004_profile_slug	2015-09-25 16:27:52.701281-04
9	account	0005_auto_20150731_1641	2015-09-25 16:27:52.900422-04
10	account	0006_auto_20150731_1702	2015-09-25 16:27:53.187622-04
11	account	0007_remove_profile_description	2015-09-25 16:27:53.352175-04
12	account	0008_auto_20150820_1556	2015-09-25 16:27:53.639346-04
13	account	0009_profile_account	2015-09-25 16:27:53.84717-04
14	account	0010_auto_20150825_1533	2015-09-25 16:27:54.084549-04
15	address	0002_remove_address_fundraiser	2015-09-25 16:27:54.171065-04
16	address	0003_auto_20150801_0007	2015-09-25 16:27:54.271438-04
17	address	0004_auto_20150805_1459	2015-09-25 16:27:54.494312-04
18	address	0005_auto_20150805_1522	2015-09-25 16:27:54.637444-04
19	address	0006_address_shipping	2015-09-25 16:27:54.788719-04
20	address	0007_auto_20150818_1612	2015-09-25 16:27:54.950077-04
21	address	0008_auto_20150818_2100	2015-09-25 16:27:55.153849-04
22	address	0009_auto_20150820_1556	2015-09-25 16:27:55.385574-04
23	admin	0001_initial	2015-09-25 16:27:55.440166-04
24	payment	0001_initial	2015-09-25 16:27:55.457339-04
25	product	0001_initial	2015-09-25 16:27:55.513629-04
26	product	0002_auto_20150726_0322	2015-09-25 16:27:55.576512-04
27	product	0003_remove_category_product_type	2015-09-25 16:27:55.608809-04
28	product	0004_product_image	2015-09-25 16:27:55.659974-04
29	product	0005_auto_20150726_1404	2015-09-25 16:27:55.725887-04
30	fundraiser	0002_fundraisercategory	2015-09-25 16:27:55.785559-04
31	fundraiser	0003_fundraisertype	2015-09-25 16:27:55.918777-04
32	fundraiser	0004_remove_fundraiser_cases	2015-09-25 16:27:56.056893-04
33	fundraiser	0005_fundraisertype_image	2015-09-25 16:27:56.262336-04
34	fundraiser	0006_fundraiser_type	2015-09-25 16:27:56.475686-04
35	fundraiser	0007_auto_20150730_1921	2015-09-25 16:27:56.778093-04
36	fundraiser	0008_auto_20150731_1606	2015-09-25 16:27:57.072972-04
37	fundraiser	0009_auto_20150731_1641	2015-09-25 16:27:57.506413-04
38	fundraiser	0010_fundraiser_status	2015-09-25 16:27:57.887645-04
39	fundraiser	0011_fundraiser_title	2015-09-25 16:27:58.339117-04
40	fundraiser	0012_fundraiser_description	2015-09-25 16:27:58.86469-04
41	fundraiser	0013_fundraisertype_slug	2015-09-25 16:27:59.314672-04
42	fundraiser	0014_fundraisertype_jar_price	2015-09-25 16:27:59.780443-04
43	fundraiser	0015_fundraiser_slug	2015-09-25 16:28:00.291945-04
44	fundraiser	0016_fundraiser_discount	2015-09-25 16:28:00.857532-04
45	fundraiser	0017_auto_20150818_1550	2015-09-25 16:28:01.456227-04
46	fundraiser	0018_fundraiser_payment	2015-09-25 16:28:02.067912-04
47	fundraiser	0019_auto_20150818_1612	2015-09-25 16:28:02.718932-04
48	fundraiser	0020_remove_fundraiser_payment	2015-09-25 16:28:03.427087-04
49	fundraiser	0021_fundraiser_finalized	2015-09-25 16:28:04.153817-04
50	comment	0001_initial	2015-09-25 16:28:05.081018-04
51	fundraiser	0022_fundraiser_receipt_email_sent	2015-09-25 16:28:05.779786-04
52	marketing	0001_initial	2015-09-25 16:28:06.545385-04
53	marketing	0002_emailnewsletter	2015-09-25 16:28:07.269118-04
54	payment	0002_payment_fundraiser	2015-09-25 16:28:07.966952-04
55	payment	0003_auto_20150821_1629	2015-09-25 16:28:08.666151-04
56	product	0006_auto_20150805_1918	2015-09-25 16:28:08.73168-04
57	product	0007_category_order	2015-09-25 16:28:08.841272-04
58	product	0008_category_slug	2015-09-25 16:28:08.907222-04
59	sessions	0001_initial	2015-09-25 16:28:08.924212-04
60	shipment	0001_initial	2015-09-25 16:28:09.97976-04
61	shipment	0002_shipment_comment	2015-09-25 16:28:11.206897-04
62	product	0009_product_featured	2015-09-26 08:31:36.158557-04
63	fundraiser	0023_auto_20150928_2356	2015-09-28 19:56:23.426161-04
64	fundraiser	0024_auto_20150929_1309	2015-09-29 09:10:02.642422-04
65	account	0011_auto_20150929_1539	2015-09-29 11:39:28.645506-04
66	fundraiser	0025_auto_20150929_1536	2015-09-29 11:39:29.168343-04
67	fundraiser	0002_auto_20150929_2326	2015-09-29 19:27:01.608583-04
68	fundraiser	0003_auto_20150929_2328	2015-09-29 19:28:06.612822-04
69	fundraiser	0004_auto_20150929_2329	2015-09-29 19:29:26.168718-04
70	fundraiser	0005_auto_20150929_2350	2015-09-29 19:50:39.169457-04
71	fundraiser	0006_auto_20150930_0051	2015-09-29 20:51:20.322234-04
72	fundraiser	0007_auto_20150930_0051	2015-09-29 20:51:20.567014-04
73	fundraiser	0008_auto_20150930_0100	2015-09-29 21:00:53.352196-04
74	fundraiser	0009_auto_20150930_1817	2015-09-30 14:17:57.075-04
75	fundraiser	0010_fundraisercategory_image	2015-09-30 16:37:12.699154-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('django_migrations_id_seq', 75, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
latapd0gtmo844y9ky1lsex1j07d8gve	NjQ4YWEyYTNiOTFlMjQ3ZGNiYmE3ODE4NmE4NGI2MjcxMDEwNDIzMTp7InNlc3Npb25fZmluYWxpemVkX29yZGVyIjozNiwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJvcmRlcl9zdGVwIjpudWxsLCJmaW5hbGl6ZWRfb3JkZXIiOjM2LCJfYXV0aF91c2VyX2hhc2giOiJkNjA2ZjQ2M2EzMzEyMDIzNjIwNjY3MWQ2YmYwY2MzZWNhODNkMjdhIn0=	2015-10-14 13:53:32.84937-04
\.


--
-- Data for Name: fundraiser_fundraiser; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraiser (id, created, updated, account_id, type_id, profile_id, status, title, description, slug, discount, finalized, receipt_email_sent) FROM stdin;
36	2015-09-30 13:52:00.619723-04	2015-09-30 13:53:32.717272-04	1	1	45	unpaid	Cleveland Orchestra - Musicians Non Profit Fundraiser - Fall Fundraiser - 2	c	cleveland-orchestra-musicians-non-profit-fundraiser-fall-fundraiser-2-36	0.00	t	f
\.


--
-- Name: fundraiser_fundraiser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraiser_id_seq', 36, true);


--
-- Data for Name: fundraiser_fundraisercategory; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisercategory (id, title, description, name, type, image) FROM stdin;
4	Buy-Sell.  Purchase salsa by the case at $3 per jar and sell at $6.		Plan B	Buy-Sell	fundraiser_types/logo-yello.png
3	Pre-sell individual jars at $6 per jar, you keep $3 per jar.		Plan A	Pre-Sell	fundraiser_types/logo-red.png
5	Pre-sell mix and match cases at $72 per case, you keep $36 per case.		Plan C	Pre-Sell mix and match cases	fundraiser_types/logo-green.png
\.


--
-- Name: fundraiser_fundraisercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisercategory_id_seq', 5, true);


--
-- Data for Name: fundraiser_fundraisercategory_options; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisercategory_options (id, fundraisercategory_id, fundraisertype_id) FROM stdin;
24	4	1
25	4	2
26	3	1
27	5	1
28	5	2
29	5	3
\.


--
-- Name: fundraiser_fundraisercategory_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisercategory_options_id_seq', 29, true);


--
-- Data for Name: fundraiser_fundraisertype; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertype (id, title, image, slug, jar_price) FROM stdin;
2	Pick from 10	fundraiser_types/5_pack_stack.jpeg	fundraiser-type-2	3.00
1	Pick from 4	fundraiser_types/5_pack_stack_YFXL5Qq.jpeg	fundraiser-type-1	3.00
3	Pick from 23	fundraiser_types/5_pack_stack_PQUXFLa.jpeg	fundraiser-type-3	3.00
\.


--
-- Name: fundraiser_fundraisertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_id_seq', 3, true);


--
-- Data for Name: fundraiser_fundraisertype_selections; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY fundraiser_fundraisertype_selections (id, fundraisertype_id, product_id) FROM stdin;
56	2	1
57	2	3
58	2	9
59	2	12
60	2	14
61	2	15
63	2	18
64	1	1
65	1	3
66	1	12
67	1	9
68	3	1
69	3	2
70	3	3
71	3	4
72	3	5
74	3	7
75	3	8
76	3	9
77	3	10
78	3	11
79	3	12
80	3	13
81	3	14
82	3	15
84	3	17
85	3	18
86	3	19
87	3	20
88	3	21
89	3	22
90	3	23
\.


--
-- Name: fundraiser_fundraisertype_selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('fundraiser_fundraisertype_selections_id_seq', 90, true);


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

SELECT pg_catalog.setval('marketing_singlediscount_id_seq', 1, false);


--
-- Data for Name: payment_payment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY payment_payment (id, type, stripe_id, last_4, card_type, fundraiser_id) FROM stdin;
11	check	\N	\N	\N	36
\.


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('payment_payment_id_seq', 11, true);


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_category (id, title, "order", slug) FROM stdin;
4	x-hot	3	x-hot-None
1	Mild	0	mild-1
3	hot	2	hot-3
2	Medium	1	medium-2
5	xx-hot	3	xx-hot-None
\.


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_category_id_seq', 5, true);


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_product (id, product_code, slug, title, description, price, created, updated, image, featured) FROM stdin;
10	product- 10	original-x-hot-10	ORIGINAL X-HOT	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.\r\n\r\nX-Hot is Clovis Hot only hotter! Add the red Cayenne peppers please!	3.00	2015-09-25 17:37:59.023593-04	2015-09-25 17:37:59.02947-04	product_images/clovis_xhot.jpeg	f
23	product- 23	spanish-verde-xx-stupid-hot-23	SPANISH VERDE XX-STUPID-HOT	Stupid Hot.	3.00	2015-09-25 17:50:59.887626-04	2015-09-29 13:28:19.473596-04	product_images/verde_hot_qFmr4mE.jpeg	t
9	product- 9	original-mild-9	ORIGINAL MILD	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.\r\n\r\nClovis Mild is the first four pepper salsa in the US with two red dried chilies adn two green chilies. California Pear tomatoes make a natural smooth, and sweet taste - while the four chilies and spices make it one of the most complex salsa around. Thats why its the base of all our red salsas.	3.00	2015-09-25 17:37:29.519779-04	2015-09-29 13:28:05.351334-04	product_images/clovis_mild.jpeg	f
3	product- 3	cherry-mild-3	CHERRY MILD	Its the Michigan cherries that make Cherry Mild wonderfully sweet and tart. Make a great snack or as a compliment to meats, fish, or vegetables.	3.00	2015-09-25 17:16:32.533478-04	2015-09-29 13:28:05.355042-04	product_images/cherry_mild.jpeg	f
14	product- 14	mango-mild-14	MANGO MILD	Everyone loves the taste of mangos right? Try chunks of mango with Clovis Medium Spice!	3.00	2015-09-25 17:44:50.034675-04	2015-09-26 08:33:25.714582-04	product_images/clovis_mild_wHRvDlv.jpeg	t
24	product- 24	pineapple-mild-24	PINEAPPLE MILD	This salsa has the great tast of pineapple and it and superb texture. Use this just as a dip or inspire a new omlette recipe.	3.00	2015-09-25 18:00:41.649138-04	2015-09-29 13:28:19.454533-04	product_images/pineapple_mild.jpeg	t
17	product- 17	raspberry-bbq-chipotle-17	RASPBERRY BBQ CHIPOTLE	We searched all over the US for the quintessential essence of what good BBQ should taste like. Result: There is no clear winner because each region has its own preferences. So we chose the Motor City and spoke to many people and tasted many bbqs, to craft Raspberry BBQ.	3.00	2015-09-25 17:46:19.202616-04	2015-09-29 13:28:19.466921-04	product_images/raspb_bbq_chipotle.jpeg	t
1	product- 1	black-bean-and-corn-pablano-1	BLACK BEAN AND CORN PABLANO	Every one I speak to says this salsa tastes like chili. It is in the top three best selling salsas and is a great condiment.	3.00	2015-09-25 16:55:08.187085-04	2015-09-26 08:33:25.727833-04	product_images/black-bean-corn-pablano.jpg	t
18	product- 18	roasted-garlic-olives-18	ROASTED GARLIC & OLIVES	Fresh roasted garlic cloves, green and black olives, chilies, tomatoes and Jose Madrid spices.	3.00	2015-09-25 17:46:53.027118-04	2015-09-26 08:33:25.730821-04	product_images/roasted_garlic.jpeg	t
8	product- 8	clovis-medium-8	CLOVIS MEDIUM	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.	3.00	2015-09-25 17:19:36.91367-04	2015-09-26 08:33:25.733702-04	product_images/clovis_medium.jpeg	t
4	product- 4	chipotle-con-queso-4	CHIPOTLE CON QUESO	Smoked chipotle peppers. Chunks of tomatos and slices of cheddar.\r\n	3.00	2015-09-25 17:17:03.968719-04	2015-09-26 08:33:25.737005-04	product_images/chipotle_con_caso.jpeg	t
22	product- 22	spanish-verde-hot-22	SPANISH VERDE HOT	Verde Hot has the Verder Mild base, but with Serrano peppers to make it Hot. This is the "Salsa King's" favorite salsa.\r\n\r\nWon best green salsa in the US in Fort Worth, Texas in 2004 at the Salsa Shoot Out.\r\n	3.00	2015-09-25 17:49:25.386452-04	2015-09-26 08:33:25.741204-04	product_images/verde_hot.jpeg	t
20	product- 20	roasted-pineapple-habanero-hot-20	ROASTED PINEAPPLE HABANERO HOT	Made with Verde XX Hot as the base, along with Jose Madrid special spices, and fresh pinaple chunks.	3.00	2015-09-25 17:48:33.644122-04	2015-09-26 08:33:25.747752-04	product_images/roasted_pineapple_habenero.jpeg	t
21	product- 21	spanish-verde-mild-21	SPANISH VERDE MILD	Made with green chilies, tomatillo's, onions, cilantro, lime, and Jose Madrid spices.\r\n\r\nBest tomatillo salsa in the US!	3.00	2015-09-25 17:48:59.252869-04	2015-09-29 13:28:19.460731-04	product_images/verde_mild.jpeg	t
5	product- 5	chipotle-hot-5	CHIPOTLE HOT	Smoked jalapenos are diced and mixed with a blend of thick and chunky tomatoes and spices. If you've ever tried smoking your own jalepenos and enjoy savory and spicey, this one's for you.	3.00	2015-09-25 17:17:36.554037-04	2015-09-29 13:27:08.215784-04	product_images/chipotle-hot.jpeg	t
11	product- 11	garden-cilantro-salsa-hot-11	GARDEN CILANTRO SALSA HOT	New Mexico chili's blended with fresh cilantro, tomatoes, jalepenos, onions, and a hint of lime.	3.00	2015-09-25 17:38:30.235337-04	2015-09-29 13:27:08.204246-04	product_images/garden_cilantro_hot.jpeg	f
7	product- 7	original-hot-7	ORIGINAL HOT	The Clovis brand introduced Jose Madrid Salsa in 1989. The Clovis Medium salsa originated to serve in Zak's Restaraunt in Zanesville Ohio in 1989. It quickly became a flagship, so Clovis Mild and Medium were hence born. The Clovis series of salsas is named after Clovis New Mexico, the actual birthplace of Jose Madrid.	3.00	2015-09-25 17:18:15.453758-04	2015-09-29 13:27:08.21251-04	product_images/clovis_hot_oJLkJ94.jpeg	t
2	product- 2	cherry-chocolate-hot-2	CHERRY CHOCOLATE HOT	Yes, we added habanero to give this some heat\r\n\r\nPure cocoa mixed with cherries combine to make your taste buds dance. Try this as a marinade with your favorite roasting meat, you won't be dissapointed!	3.00	2015-09-25 17:16:03.49489-04	2015-09-29 13:27:08.218808-04	product_images/cherry_chocolate.jpeg	t
13	product- 13	jamaican-jerk-hot-13	JAMAICAN JERK HOT	This is a new one, made by popular demand.\r\n	3.00	2015-09-25 17:39:25.187371-04	2015-09-29 13:27:38.012837-04	product_images/jamaican_jerk.jpeg	f
15	product- 15	peach-15	PEACH	Peach is one of the original fruit salsas. One of the most versatile, great on any spread that needs a little kick!	3.00	2015-09-25 17:45:32.305869-04	2015-09-29 13:28:19.469868-04	product_images/peach-mild.jpg	t
12	product- 12	garden-cilantro-salsa-mild-12	GARDEN CILANTRO SALSA MILD	New Mexico chili's blended with fresh cilantro, tomatoes, jalepenos, onions, and a hint of lime. This one has a hotter version if you like cilantro and jalepenos.	3.00	2015-09-25 17:38:56.037099-04	2015-09-26 13:57:38.780462-04	product_images/garden_cilantro_mild.jpeg	t
19	product- 19	raspberry-mild-19	RASPBERRY MILD	The first fruit salsa developed along with the Peach salsa. Raspberry is one of the icons of Jose Madrid Salsa and has won nation awards in two countries!	3.00	2015-09-25 17:48:05.878577-04	2015-09-29 13:28:19.463994-04	product_images/raspberry_mild.jpeg	t
\.


--
-- Data for Name: product_product_category; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY product_product_category (id, product_id, category_id) FROM stdin;
7	1	1
8	2	3
10	4	2
11	5	3
13	7	3
14	3	1
15	8	2
16	9	1
17	10	4
18	11	3
20	13	3
21	14	1
22	15	1
24	17	1
25	18	2
26	19	1
27	20	3
28	21	1
29	22	3
30	23	5
31	24	1
32	12	1
\.


--
-- Name: product_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_product_category_id_seq', 32, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('product_product_id_seq', 24, true);


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
351	333	9	36
352	22	3	36
353	0	1	36
354	0	12	36
\.


--
-- Name: shipment_selection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_selection_id_seq', 354, true);


--
-- Data for Name: shipment_shipment; Type: TABLE DATA; Schema: public; Owner: mzakany
--

COPY shipment_shipment (id, created, updated, address_id, fundraiser_id, comment_id) FROM stdin;
36	2015-09-30 13:52:00.621286-04	2015-09-30 13:53:32.708853-04	1	36	11
\.


--
-- Name: shipment_shipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mzakany
--

SELECT pg_catalog.setval('shipment_shipment_id_seq', 36, true);


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
