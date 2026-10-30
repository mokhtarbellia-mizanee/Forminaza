create table if not exists backups(id text primary key, data jsonb not null, updated_at timestamptz default now());
alter table backups enable row level security;
create or replace function put_backup(p_id text, p_data jsonb) returns void language sql security definer set search_path=public as $$
  insert into backups(id,data,updated_at) values(p_id,p_data,now())
  on conflict(id) do update set data=excluded.data, updated_at=now();
$$;
create or replace function get_backup(p_id text) returns jsonb language sql security definer set search_path=public as $$
  select data from backups where id=p_id;
$$;
grant execute on function put_backup(text,jsonb), get_backup(text) to anon;
