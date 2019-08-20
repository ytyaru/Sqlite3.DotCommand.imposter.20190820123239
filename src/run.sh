SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
"create table users(id integer primary key, name text not null, class text not null);" \
"create index idx_users_id on users(id);" \
"insert into users(name,class) values('Yamada','A');" \
"insert into users(name,class) values('Suzuki','B');" \
"insert into users(name,class) values('Tanaka','A');" \
".imposter idx_users_id users_imposter" \
".headers on" \
".mode column" \
"select * from users_imposter;"

