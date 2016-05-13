SELECT 
participant.id,participant.birthdate,participant.gender,participant.handedness,scan.date,session.value,sequence_type.name,repetition.value,dicom.path 

FROM mri.dicom dicom 
LEFT JOIN (mri.repetition repetition, mri.sequence_type sequence_type, mri.sequence sequence, mri.session session, mri.scan scan, mri.participant participant) 
ON (dicom.repetition_id=repetition.id AND sequence.sequence_type_id=sequence_type.id AND repetition.sequence_id=sequence.id AND sequence.session_id=session.id AND session.scan_id=scan.id AND scan.participant_id=participant.id) 

WHERE sequence_type.name='al_B1mapping_v2d'

ORDER BY participant.id,participant.birthdate,scan.date, session.value, sequence_type.name, repetition.value, dicom.path;