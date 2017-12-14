select  
t1.descripcion						AS [PERIODO]
,bp.rut_funcionario					AS [RUT EVALUADO]
,bp.nombre							AS [NOMBRE EVALUADO]
,bp.apellido_paterno				AS [PATERNO EVALUADO]
,bp.apellido_materno				AS [MATERNO EVALUADO]
,bp.email							AS [EMAIL EVALUADO]
--,pj.rut_funcionario					AS [RUT_JEFE] 
--,pj.nombre							AS [NOMBRE JEFE] 
--,pj.apellido_paterno				AS [PATERNO JEFE] 
--,pj.apellido_materno				AS [MATERNO JEFE]
,case dh.id_angulo when 2 then ltrim(UPPER(pj.nombre +' '+pj.apellido_paterno+' '+pj.apellido_materno))
ELSE
	(select bp2.nombre+' '+bp2.apellido_paterno+' '+bp2.apellido_materno from BASE_personal bp2 where id_funcionario=(select dr1.id_evaluador from desempeno_raters dr1 where dr1.id_evaluado =dh.id_evaluador  and dr1.id_eval_version= dh.id_eval_version and dr1.tipo=2))
END

AS [JEFATURA]
,case dh.id_angulo when 2 then ltrim(UPPER(pj.rut_funcionario))
ELSE
	(select bp2.rut_funcionario from BASE_personal bp2 where id_funcionario=(select dr1.id_evaluador from desempeno_raters dr1 where dr1.id_evaluado =dh.id_evaluador  and dr1.id_eval_version= dh.id_eval_version and dr1.tipo=2))
END

AS [RUT_JEFE]
,case dh.id_angulo when 2 then ltrim(UPPER(pj.email))
ELSE
	(select bp2.email from BASE_personal bp2 where id_funcionario=(select dr1.id_evaluador from desempeno_raters dr1 where dr1.id_evaluado =dh.id_evaluador  and dr1.id_eval_version= dh.id_eval_version and dr1.tipo=2))
END

AS [MAIL_JEFE]
,pj.email							AS [EMAIL EVALUADOR]
,be.nombre							AS [EMPRESA]
,dnj.nombreUnidad					AS [GERENCIA]
,dnj2.nombreUnidad					AS [AREA]
,dnj3.nombreUnidad					AS [LUGAR DE TRABAJO]
,cc.nom_centro_costo				AS [UBICACION]
,c.nom_cargo						AS [CARGO]
,fc.descripcion						AS [FAMILIA CARGO]
,f.des_perfil						AS [PERFIL DESEMPEÑO]
,t.nom_tipo							AS [ANGULO]
,s.descripcion						AS [ESTADO EVALUACION]
,dh.promedio						AS [PROMEDIO DIMENSIONES]
,dh.des_promedio					AS [RESULTADO DIMENSIONES]
,dh.prom_obj						AS [PROMEDIO INDICADOR COMERCIAL]
,dh.des_prom_obj					AS [RESULTADO INDICADOR COMERCIAL]
,dh.prom_glob						AS [PROMEDIO GLOBAL]
,dh.des_prom_glob					AS [RESULTADO GLOBAL]
,CASE WHEN bp.evaluar = 1 THEN 'EVALUAR' ELSE 'NO EVALUAR' END AS [EVALUAR]
,CASE WHEN bp.estado_desempeno = 1 THEN 'ACTIVO' ELSE 'DESVINCULADO' END AS [ESTADO]
  
  	

		from desempeno_historico 					dh
		INNER JOIN BASE_personal 					bp 		ON dh.id_evaluado=bp.id_funcionario
		inner JOIN BASE_personal 					pj		ON pj.id_funcionario = dh.id_evaluador
		LEFT JOIN  desempeno_nivel_jerarquia		dnj		ON bp.id_gerencia=dnj.idUnidad			AND dnj.idNivel=1
		LEFT JOIN  desempeno_nivel_jerarquia		dnj2	ON bp.id_area=dnj2.idUnidad				AND dnj2.idNivel=2
		LEFT JOIN  desempeno_nivel_jerarquia		dnj3	ON bp.id_depto=dnj3.idUnidad			AND dnj3.idNivel=3
		LEFT JOIN desempeno_periodo 				t1		ON dh.id_eval_version=t1.id_eval_version
		LEFT JOIN desempeno_escala 					e		ON dh.id_eval_version=e.id_eval_version AND e.id_tipo_escala=1
		--LEFT JOIN pac_plan							pc      ON dh.id_evaluado=pc.id_evaluado		AND pc.id_eval_version=3
		--LEFT JOIN pac_estado_plan					pep     ON pc.id_estado=pep.id_estado
		LEFT JOIN BASE_empresas						be		ON bp.id_empresa=be.id_empresa
		LEFT JOIN desempeno_centro_costo			cc		ON bp.centro_costo	= cc.id_centro_costo
		LEFT JOIN desempeno_perfiles 				f		ON bp.perfil_desempeno	= f.id_perfil
		LEFT JOIN BASE_cargos						c		ON bp.id_cargo			= c.id_cargo
		LEFT JOIN BASE_familia_cargo				fc		ON bp.id_familia_cargo	= fc.id_familia_cargo
		LEFT JOIN desempeno_estado_rev				s		ON dh.id_estado	= s.id_estado_rev
		LEFT JOIN desempeno_tipo					t		ON dh.id_angulo				= t.tipo

where dh.id_eval_version=3
and 	 dh.promedio BETWEEN e.Desde and e.Hasta
and bp.id_funcionario not in  (2303,2306,2331,2029,14727,1376,14728,14729)
--AND bp.rut_funcionario='16682231-9'
ORDER BY bp.rut_funcionario DESC