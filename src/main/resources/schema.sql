
CREATE TABLE communities (
                             id bigint NOT NULL,
                             name character varying(150) NOT NULL,
                             created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                             updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE communities OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 70501)
-- Name: communities_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE communities_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communities_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 202
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE communities_id_seq OWNED BY communities.id;


--
-- TOC entry 204 (class 1259 OID 70513)
-- Name: communities_users; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE communities_users (
                                   community_id bigint NOT NULL,
                                   user_id bigint NOT NULL,
                                   created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE communities_users OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 70532)
-- Name: friendship; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE friendship (
                            user_id bigint NOT NULL,
                            friend_id bigint NOT NULL,
                            friendship_status_id bigint NOT NULL,
                            confirmed_at timestamp(0) without time zone,
                            created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                            updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE friendship OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 70543)
-- Name: friendship_statuses; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE friendship_statuses (
                                     id bigint NOT NULL,
                                     name character varying(150) NOT NULL,
                                     created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                                     updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE friendship_statuses OWNER TO postgres;



CREATE TABLE likes (
                       id bigint NOT NULL,
                       user_id bigint NOT NULL,
                       target_id bigint NOT NULL,
                       target_type character varying(24) NOT NULL,
                       created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE likes OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 70553)
-- Name: likes_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE likes_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 208
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- TOC entry 211 (class 1259 OID 70566)
-- Name: media; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE media (
                       id bigint NOT NULL,
                       user_id bigint NOT NULL,
                       filename character varying(255) NOT NULL,
                       size integer NOT NULL,
                       metadata text,
                       media_type_id bigint NOT NULL,
                       created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                       updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE media OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 70564)
-- Name: media_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 210
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- TOC entry 213 (class 1259 OID 70582)
-- Name: media_types; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE media_types (
                             id bigint NOT NULL,
                             name character varying(255) NOT NULL,
                             created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                             updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE media_types OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 70580)
-- Name: media_types_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE media_types_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_types_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 212
-- Name: media_types_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE media_types_id_seq OWNED BY media_types.id;


--
-- TOC entry 215 (class 1259 OID 70594)
-- Name: messages; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE messages (
                          id bigint NOT NULL,
                          from_user_id bigint NOT NULL,
                          to_user_id bigint NOT NULL,
                          body text NOT NULL,
                          is_important smallint,
                          is_delivered smallint,
                          created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE messages OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 70592)
-- Name: messages_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 214
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- TOC entry 217 (class 1259 OID 70609)
-- Name: posts; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE posts (
                       id bigint NOT NULL,
                       user_id bigint NOT NULL,
                       community_id bigint,
                       head character varying(255),
                       body text NOT NULL,
                       media_id bigint,
                       is_public smallint DEFAULT 0,
                       is_archived smallint DEFAULT 0,
                       created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                       updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE posts OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 70607)
-- Name: posts_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 216
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- TOC entry 218 (class 1259 OID 70624)
-- Name: profiles; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE profiles (
                          user_id bigint NOT NULL,
                          gender character varying(3),
                          birthday date,
                          city character varying(130),
                          country character varying(130),
                          created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                          updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE profiles OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 70633)
-- Name: users; Type: TABLE; Schema:  Owner: postgres
--

CREATE TABLE users (
                       id bigint NOT NULL,
                       first_name character varying(100) NOT NULL,
                       last_name character varying(100) NOT NULL,
                       email character varying(100) NOT NULL,
                       phone character varying(100) NOT NULL,
                       created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP,
                       updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 70631)
-- Name: users_id_seq; Type: SEQUENCE; Schema:  Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema:  Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2746 (class 2604 OID 70506)
-- Name: communities id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY communities ALTER COLUMN id SET DEFAULT nextval('communities_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 70558)
-- Name: likes id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 70569)
-- Name: media id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 70585)
-- Name: media_types id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media_types ALTER COLUMN id SET DEFAULT nextval('media_types_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 70597)
-- Name: messages id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 70612)
-- Name: posts id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 70636)
-- Name: users id; Type: DEFAULT; Schema:  Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2775 (class 2606 OID 70511)
-- Name: communities PRIMARY00000; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY communities
    ADD CONSTRAINT "PRIMARY00000" PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 70518)
-- Name: communities_users PRIMARY00001; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY communities_users
    ADD CONSTRAINT "PRIMARY00001" PRIMARY KEY (community_id, user_id);


--
-- TOC entry 2781 (class 2606 OID 70538)
-- Name: friendship PRIMARY00003; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY friendship
    ADD CONSTRAINT "PRIMARY00003" PRIMARY KEY (user_id, friend_id);


--
-- TOC entry 2785 (class 2606 OID 70551)
-- Name: friendship_statuses PRIMARY00004; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY friendship_statuses
    ADD CONSTRAINT "PRIMARY00004" PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 70562)
-- Name: likes PRIMARY00005; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT "PRIMARY00005" PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 70577)
-- Name: media PRIMARY00006; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media
    ADD CONSTRAINT "PRIMARY00006" PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 70590)
-- Name: media_types PRIMARY00007; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media_types
    ADD CONSTRAINT "PRIMARY00007" PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 70604)
-- Name: messages PRIMARY00008; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "PRIMARY00008" PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 70621)
-- Name: posts PRIMARY00009; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT "PRIMARY00009" PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 70630)
-- Name: profiles PRIMARY00010; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT "PRIMARY00010" PRIMARY KEY (user_id);


--
-- TOC entry 2808 (class 2606 OID 70641)
-- Name: users PRIMARY00011; Type: CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "PRIMARY00011" PRIMARY KEY (id);


--
-- TOC entry 2779 (class 1259 OID 70519)
-- Name: communities_users_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX communities_users_user_id_fk ON communities_users USING btree (user_id);


--
-- TOC entry 2809 (class 1259 OID 70642)
-- Name: email; Type: INDEX; Schema:  Owner: postgres
--

CREATE UNIQUE INDEX email ON users USING btree (email);


--
-- TOC entry 2782 (class 1259 OID 70539)
-- Name: friendship_friend_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX friendship_friend_id_fk ON friendship USING btree (friend_id);


--
-- TOC entry 2783 (class 1259 OID 70540)
-- Name: friendship_friendship_status_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX friendship_friendship_status_id_fk ON friendship USING btree (friendship_status_id);


--
-- TOC entry 2789 (class 1259 OID 70563)
-- Name: likes_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX likes_user_id_fk ON likes USING btree (user_id);


--
-- TOC entry 2792 (class 1259 OID 70579)
-- Name: media_media_type_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX media_media_type_id_fk ON media USING btree (media_type_id);


--
-- TOC entry 2793 (class 1259 OID 70578)
-- Name: media_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX media_user_id_fk ON media USING btree (user_id);


--
-- TOC entry 2799 (class 1259 OID 70605)
-- Name: messages_from_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX messages_from_user_id_fk ON messages USING btree (from_user_id);


--
-- TOC entry 2800 (class 1259 OID 70606)
-- Name: messages_to_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX messages_to_user_id_fk ON messages USING btree (to_user_id);


--
-- TOC entry 2776 (class 1259 OID 70512)
-- Name: name; Type: INDEX; Schema:  Owner: postgres
--

CREATE UNIQUE INDEX name ON communities USING btree (name);


--
-- TOC entry 2786 (class 1259 OID 70552)
-- Name: name00000; Type: INDEX; Schema:  Owner: postgres
--

CREATE UNIQUE INDEX name00000 ON friendship_statuses USING btree (name);


--
-- TOC entry 2796 (class 1259 OID 70591)
-- Name: name00001; Type: INDEX; Schema:  Owner: postgres
--

CREATE UNIQUE INDEX name00001 ON media_types USING btree (name);


--
-- TOC entry 2810 (class 1259 OID 70643)
-- Name: phone; Type: INDEX; Schema:  Owner: postgres
--

CREATE UNIQUE INDEX phone ON users USING btree (phone);


--
-- TOC entry 2803 (class 1259 OID 70623)
-- Name: posts_media_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX posts_media_id_fk ON posts USING btree (media_id);


--
-- TOC entry 2804 (class 1259 OID 70622)
-- Name: posts_user_id_fk; Type: INDEX; Schema:  Owner: postgres
--

CREATE INDEX posts_user_id_fk ON posts USING btree (user_id);


--
-- TOC entry 2811 (class 2606 OID 70656)
-- Name: communities_users fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY communities_users
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2824 (class 2606 OID 70671)
-- Name: profiles fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2818 (class 2606 OID 70757)
-- Name: media fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2823 (class 2606 OID 70767)
-- Name: posts fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2815 (class 2606 OID 70772)
-- Name: friendship fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY friendship
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2820 (class 2606 OID 70777)
-- Name: messages fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk1 FOREIGN KEY (from_user_id) REFERENCES users(id);


--
-- TOC entry 2816 (class 2606 OID 70782)
-- Name: likes fk1; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT fk1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2812 (class 2606 OID 70661)
-- Name: communities_users fk2; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY communities_users
    ADD CONSTRAINT fk2 FOREIGN KEY (community_id) REFERENCES communities(id);


--
-- TOC entry 2819 (class 2606 OID 70691)
-- Name: messages fk2; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk2 FOREIGN KEY (to_user_id) REFERENCES users(id);


--
-- TOC entry 2813 (class 2606 OID 70706)
-- Name: friendship fk2; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY friendship
    ADD CONSTRAINT fk2 FOREIGN KEY (friend_id) REFERENCES users(id);


--
-- TOC entry 2821 (class 2606 OID 70732)
-- Name: posts fk2; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT fk2 FOREIGN KEY (media_id) REFERENCES media(id);


--
-- TOC entry 2817 (class 2606 OID 70752)
-- Name: media fk2; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk2 FOREIGN KEY (media_type_id) REFERENCES media_types(id);


--
-- TOC entry 2814 (class 2606 OID 70711)
-- Name: friendship fk3; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY friendship
    ADD CONSTRAINT fk3 FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id);


--
-- TOC entry 2822 (class 2606 OID 70737)
-- Name: posts fk3; Type: FK CONSTRAINT; Schema:  Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT fk3 FOREIGN KEY (community_id) REFERENCES communities(id);


