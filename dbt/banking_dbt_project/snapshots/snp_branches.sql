{% snapshot snp_branches %}

{{
    config(
        target_schema=var("custom_schema", "snapshots"),
        target_database='db_banking',
        unique_key='branch_id',
        strategy='check',
        check_cols=['branch_name', 'address', 'status'],
        hard_deletes='ignore',
        dbt_valid_to_current="'9999-12-31'::date"
    )
}}

select * from {{ ref('stg_branches') }}

{% endsnapshot %}