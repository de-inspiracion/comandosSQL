select  a.appointment_id, sc.service_id, sc.name as nombre_servicio, sc.price as precio, a.reason as razon, a.appointment_date as fecha from appointment_services  aps
inner join service_catalog sc on sc.service_id = aps.service_id
inner join appointments a on a.appointment_id = aps.appointment_id
order by a.appointment_id
;

-- suma de costos por servicio 
select sum(sc.price) as total, sc.name from appointment_services  aps
inner join service_catalog sc on sc.service_id = aps.service_id
inner join appointments a on a.appointment_id = aps.appointment_id
group by sc.name
;

-- cantidad de servicios
select count(*), sc.name from appointment_services  aps
inner join service_catalog sc on sc.service_id = aps.service_id
inner join appointments a on a.appointment_id = aps.appointment_id
group by sc.name
;