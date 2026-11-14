import db from './db.js'

const getAllcategories = async() => {
    const query = `
    SELECT
        c.category_id,
        c.name,
        COALESCE(
            array_agg(sp.title ORDER BY sp.title)
                FILTER (WHERE sp.project_id IS NOT NULL),
            ARRAY[]::varchar[]
        ) AS project_titles
    FROM public.category c
    LEFT JOIN public.service_project_category spc
        ON spc.category_id = c.category_id
    LEFT JOIN public.service_project sp
        ON sp.project_id = spc.project_id
    GROUP BY c.category_id, c.name
    ORDER BY c.name;
`;

    const result = await db.query(query);

    return result.rows;
}

export {getAllcategories}  