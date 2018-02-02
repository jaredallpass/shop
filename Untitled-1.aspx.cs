with KilledCounts as (
	                            SELECT AccidentPersons.AccidentVehicleId, count(accidentpersons.id) as PersonCount
	                            FROM AccidentPersons
	                            JOIN InjurySeverities on InjurySeverities.Id = AccidentPersons.InjurySeverityId 
	                            Where InjurySeverities.code = '1'
	                            Group by AccidentVehicleId),
	                            SeriousCounts as (
	                            SELECT AccidentPersons.AccidentVehicleId, count(accidentpersons.id) as PersonCount
	                            FROM AccidentPersons
                                JOIN InjurySeverities on InjurySeverities.Id = AccidentPersons.InjurySeverityId 
                                Where InjurySeverities.code = '2'
	                            Group by AccidentVehicleId),
	                            SlightCounts as (
	                            SELECT AccidentPersons.AccidentVehicleId, count(accidentpersons.id) as PersonCount
	                            FROM AccidentPersons
	                            JOIN InjurySeverities on InjurySeverities.Id = AccidentPersons.InjurySeverityId 
	                            Where InjurySeverities.code = '3'
	                            Group by AccidentVehicleId),
	                            NoInjuryCounts as (
	                            SELECT AccidentPersons.AccidentVehicleId, count(accidentpersons.id) as PersonCount
	                            FROM AccidentPersons
	                            JOIN InjurySeverities on InjurySeverities.Id = AccidentPersons.InjurySeverityId 
	                            Where InjurySeverities.code = '4'
	                            Group by AccidentVehicleId),
	                            UnknownCounts as (
	                            SELECT AccidentPersons.AccidentVehicleId, count(accidentpersons.id) as PersonCount
                                FROM AccidentPersons
	                            JOIN InjurySeverities on InjurySeverities.Id = AccidentPersons.InjurySeverityId 
	                            Where InjurySeverities.code = '0'
	                            Group by AccidentVehicleId)
                                SELECT VehicleManeuvres.name AS Manouevre,
                                   count(KilledCounts.PersonCount)																						  as IsFatal,
                                   count(iif(KilledCounts.PersonCount is null, SeriousCounts.PersonCount, null))										  as IsSerious,
                                   count(iif(coalesce(KilledCounts.PersonCount, SeriousCounts.PersonCount) is null, SlightCounts.PersonCount, null)) as   IsSlight,
	                               count(iif(coalesce(KilledCounts.PersonCount
                                                      , SeriousCounts.PersonCount
                                                      , SlightCounts.PersonCount) is null
                                                      , NoInjuryCounts.PersonCount, null))                                                              as IsNoInjury,
								   count(iif(coalesce(KilledCounts.PersonCount
                                                      , SeriousCounts.PersonCount
                                                      , SlightCounts.PersonCount 
                                                      , NoInjuryCounts.PersonCount) is null                                                           
													  , UnknownCounts.PersonCount, null))																  as IsUnknownInjury, 
								   sum(coalesce(KilledCounts.PersonCount, 0)) as Killed, 
								   sum(coalesce(SeriousCounts.PersonCount, 0)) as Serious, 
								   sum(coalesce(SlightCounts.PersonCount, 0)) as Slight, 
								   sum(coalesce(NoInjuryCounts.PersonCount, 0)) as NoInjury,
								   sum(coalesce(UnknownCounts.PersonCount, 0)) as Unknown,
								   sum(isnull(KilledCounts.PersonCount, 0)
                                       + isnull(SeriousCounts.PersonCount, 0)
                                       + isnull(SlightCounts.PersonCount, 0)
                                       + isnull(NoInjuryCounts.PersonCount, 0)
                                       + isnull(UnknownCounts.PersonCount, 0))                                                                         as TotalPersons,
	                               count(*)                                                                                                               as TotalAccidents,
                                   ROW_NUMBER() OVER (PARTITION BY grouping_id(VehicleManeuvres.name)
						              ORDER BY
						              (SELECT NULL)) 
										AS rCount
                                FROM Accidents
                                join AccidentVehicles on AccidentVehicles.ManeuvreId = VehicleManeuvres.Id
                                left join KilledCounts on KilledCounts.AccidentVehicleId = AccidentVehicles.Id
                                left join SeriousCounts on SeriousCounts.AccidentVehicleId = AccidentVehicles.Id
                                left join SlightCounts on SlightCounts.AccidentVehicleId = AccidentVehicles.Id
                                left join NoInjuryCounts on NoInjuryCounts.AccidentVehicleId = AccidentVehicles.Id
                                left join UnknownCounts on UnknownCounts.AccidentVehicleId = AccidentVehicles.Id 
                                join Accidents on Accidents.id = AccidentVehicles.AccidentId
                                join Authorities on Authorities.Id = Accidents.CapturingAuthorityId