!**********************************************************************************************************************************
! LICENSING
! Copyright (C) 2013  National Renewable Energy Laboratory
!
!    This file is part of HydroDyn.
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!    
!**********************************************************************************************************************************
! File last committed: $Date: 2015-08-11 08:28:58 -0600 (Tue, 11 Aug 2015) $
! (File) Revision #: $Rev: 622 $
! URL: $HeadURL: https://windsvn.nrel.gov/HydroDyn/branches/UserWaves/Source/HydroDyn_Output.f90 $
!**********************************************************************************************************************************
MODULE HydroDyn_Output

      ! This MODULE stores variables used for output.

   USE                              NWTC_Library
   USE                              HydroDyn_Types
   !USE                              HydroDyn_Output_Types
   USE                              Waves
   IMPLICIT                         NONE
   
   PRIVATE


  ! Parameters related to output length (number of characters allowed in the output data headers):

   INTEGER(IntKi), PARAMETER      :: OutStrLenM1 = ChanLen - 1


     !  Time: 

   INTEGER(IntKi), PARAMETER      :: Time      =    0


     ! Category:

   INTEGER(IntKi), PARAMETER      :: AddFxi    =    1
   INTEGER(IntKi), PARAMETER      :: AddFyi    =    2
   INTEGER(IntKi), PARAMETER      :: AddFzi    =    3
   INTEGER(IntKi), PARAMETER      :: AddMxi    =    4
   INTEGER(IntKi), PARAMETER      :: AddMyi    =    5
   INTEGER(IntKi), PARAMETER      :: AddMzi    =    6


     ! Category:

   INTEGER(IntKi), PARAMETER      :: HydroFxi  =    7
   INTEGER(IntKi), PARAMETER      :: HydroFyi  =    8
   INTEGER(IntKi), PARAMETER      :: HydroFzi  =    9
   INTEGER(IntKi), PARAMETER      :: HydroMxi  =   10
   INTEGER(IntKi), PARAMETER      :: HydroMyi  =   11
   INTEGER(IntKi), PARAMETER      :: HydroMzi  =   12


     ! Category:

   INTEGER(IntKi), PARAMETER      :: Wave1Elev =   13
   INTEGER(IntKi), PARAMETER      :: Wave1Elv1 =   14
   INTEGER(IntKi), PARAMETER      :: Wave2Elev =   15
   INTEGER(IntKi), PARAMETER      :: Wave2Elv1 =   16
   INTEGER(IntKi), PARAMETER      :: Wave3Elev =   17
   INTEGER(IntKi), PARAMETER      :: Wave3Elv1 =   18
   INTEGER(IntKi), PARAMETER      :: Wave4Elev =   19
   INTEGER(IntKi), PARAMETER      :: Wave4Elv1 =   20
   INTEGER(IntKi), PARAMETER      :: Wave5Elev =   21
   INTEGER(IntKi), PARAMETER      :: Wave5Elv1 =   22
   INTEGER(IntKi), PARAMETER      :: Wave6Elev =   23
   INTEGER(IntKi), PARAMETER      :: Wave6Elv1 =   24
   INTEGER(IntKi), PARAMETER      :: Wave7Elev =   25
   INTEGER(IntKi), PARAMETER      :: Wave7Elv1 =   26
   INTEGER(IntKi), PARAMETER      :: Wave8Elev =   27
   INTEGER(IntKi), PARAMETER      :: Wave8Elv1 =   28
   INTEGER(IntKi), PARAMETER      :: Wave9Elev =   29
   INTEGER(IntKi), PARAMETER      :: Wave9Elv1 =   30


     ! Category:

   INTEGER(IntKi), PARAMETER      :: WavesFxi  =   31
   INTEGER(IntKi), PARAMETER      :: WavesFyi  =   32
   INTEGER(IntKi), PARAMETER      :: WavesFzi  =   33
   INTEGER(IntKi), PARAMETER      :: WavesMxi  =   34
   INTEGER(IntKi), PARAMETER      :: WavesMyi  =   35
   INTEGER(IntKi), PARAMETER      :: WavesMzi  =   36


     ! Category:

   INTEGER(IntKi), PARAMETER      :: WRPSurge  =   37
   INTEGER(IntKi), PARAMETER      :: WRPSway   =   38
   INTEGER(IntKi), PARAMETER      :: WRPHeave  =   39
   INTEGER(IntKi), PARAMETER      :: WRPRoll   =   40
   INTEGER(IntKi), PARAMETER      :: WRPPitch  =   41
   INTEGER(IntKi), PARAMETER      :: WRPYaw    =   42
   INTEGER(IntKi), PARAMETER      :: WRPTVxi   =   43
   INTEGER(IntKi), PARAMETER      :: WRPTVyi   =   44
   INTEGER(IntKi), PARAMETER      :: WRPTVzi   =   45
   INTEGER(IntKi), PARAMETER      :: WRPRVxi   =   46
   INTEGER(IntKi), PARAMETER      :: WRPRVyi   =   47
   INTEGER(IntKi), PARAMETER      :: WRPRVzi   =   48
   INTEGER(IntKi), PARAMETER      :: WRPTAxi   =   49
   INTEGER(IntKi), PARAMETER      :: WRPTAyi   =   50
   INTEGER(IntKi), PARAMETER      :: WRPTAzi   =   51
   INTEGER(IntKi), PARAMETER      :: WRPRAxi   =   52
   INTEGER(IntKi), PARAMETER      :: WRPRAyi   =   53
   INTEGER(IntKi), PARAMETER      :: WRPRAzi   =   54

   !End of code generated by Matlab script
   
   
   INTEGER, PARAMETER             :: FHydro(6)      = (/HydroFxi,HydroFyi,HydroFzi,HydroMxi,HydroMyi,HydroMzi/)
   INTEGER, PARAMETER             :: FAdd(6)        = (/AddFxi,AddFyi,AddFzi,AddMxi,AddMyi,AddMzi/)
   INTEGER, PARAMETER             :: FWavesTot(6)   = (/WavesFxi,WavesFyi,WavesFzi,WavesMxi,WavesMyi,WavesMzi/)
   INTEGER, PARAMETER             :: WRPMotions(6)  = (/WRPSurge,WRPSway,WRPHeave,WRPRoll,WRPPitch,WRPYaw/)
   INTEGER, PARAMETER             :: WRPVel(6)      = (/WRPTVxi,WRPTVyi,WRPTVzi,WRPRVxi,WRPRVyi,WRPRVzi/)
   INTEGER, PARAMETER             :: WRPAcc(6)      = (/WRPTAxi,WRPTAyi,WRPTAzi,WRPRAxi,WRPRAyi,WRPRAzi/)
   INTEGER, PARAMETER             :: WaveElevi(9)   = (/Wave1Elev,Wave2Elev,Wave3Elev,Wave4Elev,Wave5Elev,Wave6Elev,Wave7Elev,Wave8Elev,Wave9Elev/)
   INTEGER, PARAMETER             :: WaveElevi1(9)  = (/Wave1Elv1,Wave2Elv1,Wave3Elv1,Wave4Elv1,Wave5Elv1,Wave6Elv1,Wave7Elv1,Wave8Elv1,Wave9Elv1/)
 
   
  CHARACTER(OutStrLenM1), PARAMETER  :: ValidParamAry(54) =  (/ &                  ! This lists the names of the allowed parameters, which must be sorted alphabetically
                               "ADDFXI   ","ADDFYI   ","ADDFZI   ","ADDMXI   ","ADDMYI   ","ADDMZI   ", &
                               "HYDROFXI ","HYDROFYI ","HYDROFZI ","HYDROMXI ","HYDROMYI ","HYDROMZI ", &
                               "WAVE1ELEV","WAVE1ELV1",  &
                               "WAVE2ELEV","WAVE2ELV1",  &
                               "WAVE3ELEV","WAVE3ELV1",  &
                               "WAVE4ELEV","WAVE4ELV1",  &
                               "WAVE5ELEV","WAVE5ELV1",  &
                               "WAVE6ELEV","WAVE6ELV1",  &
                               "WAVE7ELEV","WAVE7ELV1",  &
                               "WAVE8ELEV","WAVE8ELV1",  &
                               "WAVE9ELEV","WAVE9ELV1",  &
                               "WAVESFXI ","WAVESFYI ","WAVESFZI ","WAVESMXI ","WAVESMYI ","WAVESMZI ", &
                               "WRPHEAVE ","WRPPITCH ","WRPRAXI  ","WRPRAYI  ","WRPRAZI  ","WRPROLL  ", &
                               "WRPRVXI  ","WRPRVYI  ","WRPRVZI  ","WRPSURGE ","WRPSWAY  ","WRPTAXI  ", &
                               "WRPTAYI  ","WRPTAZI  ","WRPTVXI  ","WRPTVYI  ","WRPTVZI  ","WRPYAW   "/)
   INTEGER(IntKi), PARAMETER :: ParamIndxAry(54) =  (/ &                            ! This lists the index into AllOuts(:) of the allowed parameters ValidParamAry(:)
                                   AddFxi ,    AddFyi ,    AddFzi ,    AddMxi ,    AddMyi ,    AddMzi , &
                                 HydroFxi ,  HydroFyi ,  HydroFzi ,  HydroMxi ,  HydroMyi ,  HydroMzi , &
                                Wave1Elev , Wave1Elv1 ,  &
                                Wave2Elev , Wave2Elv1 ,  &
                                Wave3Elev , Wave3Elv1 ,  &
                                Wave4Elev , Wave4Elv1 ,  &
                                Wave5Elev , Wave5Elv1 ,  &
                                Wave6Elev , Wave6Elv1 ,  &
                                Wave7Elev , Wave7Elv1 ,  &
                                Wave8Elev , Wave8Elv1 ,  &
                                Wave9Elev , Wave9Elv1 ,  &
                                 WavesFxi ,  WavesFyi ,  WavesFzi ,  WavesMxi ,  WavesMyi ,  WavesMzi , &
                                 WRPHeave ,  WRPPitch ,   WRPRAxi ,   WRPRAyi ,   WRPRAzi ,   WRPRoll , &
                                  WRPRVxi ,   WRPRVyi ,   WRPRVzi ,  WRPSurge ,   WRPSway ,   WRPTAxi , &
                                  WRPTAyi ,   WRPTAzi ,   WRPTVxi ,   WRPTVyi ,   WRPTVzi ,    WRPYaw /)
   CHARACTER(ChanLen), PARAMETER :: ParamUnitsAry(54) =  (/ &                     ! This lists the units corresponding to the allowed parameters
                               "(N)       ","(N)       ","(N)       ","(N�m)     ","(N�m)     ","(N�m)     ",  &
                               "(N)       ","(N)       ","(N)       ","(N�m)     ","(N�m)     ","(N�m)     ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(m)       ","(m)       ",  &
                               "(N)       ","(N)       ","(N)       ","(N�m)     ","(N�m)     ","(N�m)     ",  &
                               "(m)       ","(rad)     ","(rad/s^2) ","(rad/s^2) ","(rad/s^2) ","(rad)     ",  &
                               "(rad/s)   ","(rad/s)   ","(rad/s)   ","(m)       ","(m)       ","(m/s^2)   ",  &
                               "(m/s^2)   ","(m/s^2)   ","(m/s)     ","(m/s)     ","(m/s)     ","(rad)     "/)


   REAL(ReKi)               :: AllOuts(MaxHDOutputs)          ! Array of all possible outputs
   
   
      ! ..... Public Subroutines ...................................................................................................
   PUBLIC :: HDOut_CloseSum
   PUBLIC :: HDOut_OpenSum
   PUBLIC :: HDOut_MapOutputs
   PUBLIC :: HDOut_WriteOutputs
   PUBLIC :: HDOut_OpenOutput
   PUBLIC :: HDOut_CloseOutput
   PUBLIC :: HDOut_GetChannels
   PUBLIC :: HDOUT_Init
   PUBLIC :: HDOut_WriteWvKinFiles
   
CONTAINS

!====================================================================================================
SUBROUTINE HDOut_CloseSum( UnSum, ErrStat, ErrMsg )


      ! Passed variables
      
   INTEGER,                 INTENT( IN    )   :: UnSum                ! the unit number for the HydroDyn summary file          
   INTEGER,                 INTENT(   OUT )   :: ErrStat              ! returns a non-zero value when an error occurs  
   CHARACTER(*),            INTENT(   OUT )   :: ErrMsg               ! Error message if ErrStat /= ErrID_None
  

      ! Local variables
   LOGICAL                                :: Err                                       ! determines if an error exists      

      ! Initialize ErrStat
         
   ErrStat = ErrID_None         
   ErrMsg  = ""
   
   Err = .FALSE.

      ! Write any closing information in the summary file
      
   IF ( UnSum > 0 ) THEN
      WRITE (UnSum,'(/,A/)', IOSTAT=ErrStat)  'This summary file was closed on '//CurDate()//' at '//CurTime()//'.'
      IF (ErrStat /= 0) THEN
         Err = .TRUE.
         ErrMsg  = 'Problem writing to summary file'
      END IF
   END IF   
   
      ! Close the file
   
   CLOSE( UnSum, IOSTAT=ErrStat )
   IF (ErrStat /= 0) THEN
      Err = .TRUE.
      ErrMsg  = 'Problem closing summary file'
   END IF
   
   IF ( Err ) ErrStat = ErrID_Fatal
      
                      
END SUBROUTINE HDOut_CloseSum            

!====================================================================================================
SUBROUTINE HDOut_OpenSum( UnSum, SummaryName, HD_Prog, ErrStat, ErrMsg )


      ! Passed variables
      
   INTEGER,                 INTENT(   OUT )   :: UnSum                ! the unit number for the HydroDyn summary file          
   CHARACTER(*),            INTENT( IN    )   :: SummaryName          ! the name of the HydroDyn summary file
   TYPE(ProgDesc),          INTENT( IN    )   :: HD_Prog              ! the name/version/date of the hydrodynamics program
   INTEGER,                 INTENT(   OUT )   :: ErrStat              ! returns a non-zero value when an error occurs  
   CHARACTER(*),            INTENT(   OUT )   :: ErrMsg               ! Error message if ErrStat /= ErrID_None
           

       ! Initialize ErrStat
         
   ErrStat = ErrID_None         
   ErrMsg  = ""       
      

   CALL GetNewUnit( UnSum )

   CALL OpenFOutFile ( UnSum, SummaryName, ErrStat, ErrMsg ) 
   IF (ErrStat >=AbortErrLev) RETURN
      
      
         ! Write the summary file header
      
   WRITE (UnSum,'(/,A/)', IOSTAT=ErrStat)  'This summary file was generated by '//TRIM( HD_Prog%Name )//&
                     ' '//TRIM( HD_Prog%Ver )//' on '//CurDate()//' at '//CurTime()//'.'
                      
END SUBROUTINE HDOut_OpenSum 

!====================================================================================================
SUBROUTINE HDOut_WriteWvKinFiles( Rootname, HD_Prog, NStepWave, NNodes, NWaveElev, nodeInWater, WaveElev, WaveKinzi0, &
                                    WaveTime, WaveVel0, WaveAcc0, WaveDynP0, ErrStat, ErrMsg )

      ! Passed variables
   CHARACTER(*),                  INTENT( IN    )   :: Rootname             ! filename including full path, minus any file extension.
   TYPE(ProgDesc),                INTENT( IN    )   :: HD_Prog              ! the name/version/date of the hydrodynamics program
   INTEGER,                       INTENT( IN    )   :: NStepWave            ! Number of time steps for the wave kinematics arrays
   INTEGER,                       INTENT( IN    )   :: NNodes               ! Number of simulation nodes for the wave kinematics arrays
   INTEGER,                       INTENT( IN    )   :: NWaveElev            ! Number of locations where wave elevations were requested
   LOGICAL,                       INTENT( IN    )   :: nodeInWater(0:,: )     !
   REAL(SiKi),                    INTENT( IN    )   :: WaveElev  (0:,: )     ! Instantaneous wave elevations at requested locations
   REAL(SiKi),                    INTENT( IN    )   :: WaveKinzi0(:    )     ! The z-location of all the nodes
   REAL(SiKi),                    INTENT( IN    )   :: WaveTime (0:    )     ! The time values for the wave kinematics  (time)
   REAL(SiKi),                    INTENT( IN    )   :: WaveVel0 (0:,:,:)     ! The wave velocities (time,node,component)
   REAL(SiKi),                    INTENT( IN    )   :: WaveAcc0 (0:,:,:)     ! The wave accelerations (time,node,component)
   REAL(SiKi),                    INTENT( IN    )   :: WaveDynP0(0:,:)       ! The wave dynamic pressure (time,node)
   INTEGER,                       INTENT(   OUT )   :: ErrStat              ! returns a non-zero value when an error occurs  
   CHARACTER(*),                  INTENT(   OUT )   :: ErrMsg               ! Error message if ErrStat /= ErrID_None
      
      ! Local variables
   INTEGER                                    :: UnWv                       ! file unit for writing the various wave kinematics files
   CHARACTER(1024)                            :: WvName                     ! complete filename for one of the output files
   CHARACTER(5)                               :: extension(7)     
   INTEGER                                    :: i, j, iFile
   CHARACTER(64)                              :: Frmt, Sfrmt
   CHARACTER(10)                              :: Delim
      ! Initialize ErrStat      
   ErrStat = ErrID_None         
   ErrMsg  = ""       
      
   extension  = (/'.Vxi ','.Vyi ','.Vzi ','.Axi ','.Ayi ','.Azi ','.DynP'/)
   Delim         = ''
   !Frmt = '('//TRIM(Int2LStr(NNodes))//'(:,A,ES11.4e2))'
   Frmt  = '(:,A,ES11.4e2)'
   Sfrmt = '(:,A,A11)'
   
   
         
   DO iFile = 1,7
      
      CALL GetNewUnit( UnWv )

      WvName = Rootname // TRIM(extension(iFile))
      CALL OpenFOutFile ( UnWv, WvName, ErrStat, ErrMsg ) 
         IF (ErrStat >=AbortErrLev) RETURN
      
      
      
            ! Write the summary file header    
     ! WRITE (UnWv,'(/,A/)', IOSTAT=ErrStat)  'This wave kinematics file was generated by '//TRIM( HD_Prog%Name )//&
      WRITE (UnWv,'(A)', IOSTAT=ErrStat)  'This wave kinematics file was generated by '//TRIM( HD_Prog%Name )//&
                        ' '//TRIM( HD_Prog%Ver )//' on '//CurDate()//' at '//CurTime()//'.'
        
      
      DO i= 0,NStepWave-1
         DO j = 1, NNodes
            IF (   .NOT. nodeInWater(i,j) )  THEN
               WRITE(UnWv,Sfrmt,ADVANCE='no')   Delim,  '##########'
            ELSE
                  
               SELECT CASE (iFile)
                  CASE (1)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveVel0 (i,j,1)  
                  CASE (2)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveVel0 (i,j,2)  
                  CASE (3)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveVel0 (i,j,3)  
                  CASE (4)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveAcc0 (i,j,1)  
                  CASE (5)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveAcc0 (i,j,2)  
                  CASE (6)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveAcc0 (i,j,3)  
                  CASE (7)              
                     WRITE(UnWv,Frmt,ADVANCE='no')   Delim,  WaveDynP0(i,j  )  
                  END SELECT
            END IF
         END DO
         WRITE (UnWv,'()', IOSTAT=ErrStat)          ! write the line return   
      END DO
      
      CLOSE( UnWv, IOSTAT=ErrStat )
      IF (ErrStat /= 0) THEN
         ErrStat = ErrID_Fatal
         ErrMsg  = 'Problem closing wave kinematics file'
         RETURN
      END IF      
   END DO
   
   IF ( NWaveElev > 0 ) THEN
   
      CALL GetNewUnit( UnWv )

      WvName = Rootname // '.Elev'
      CALL OpenFOutFile ( UnWv, WvName, ErrStat, ErrMsg ) 
         IF (ErrStat >=AbortErrLev) RETURN
      
      
      
            ! Write the summary file header    
      WRITE (UnWv,'(A)', IOSTAT=ErrStat)  'This wave kinematics file was generated by '//TRIM( HD_Prog%Name )//&
                        ' '//TRIM( HD_Prog%Ver )//' on '//CurDate()//' at '//CurTime()//'.'
        
      
      DO i= 0,NStepWave-1
         
         Frmt = '('//TRIM(Int2LStr(NWaveElev))//'(:,A,ES11.4e2))'
         WRITE(UnWv,Frmt)   ( Delim,  WaveElev(i,j)  , j=1,NWaveElev )   
         
      END DO
      
      CLOSE( UnWv, IOSTAT=ErrStat )
      IF (ErrStat /= 0) THEN
         ErrStat = ErrID_Fatal
         ErrMsg  = 'Problem closing wave elevations file'
         RETURN
      END IF     
      
   END IF
   
   
END SUBROUTINE HDOut_WriteWvKinFiles 

!====================================================================================================
SUBROUTINE HDOut_MapOutputs( CurrentTime, y, NWaveElev, WaveElev, WaveElev1, F_Add, F_Waves, F_Hydro, q, qdot, qdotdot, AllOuts, ErrStat, ErrMsg )
! This subroutine writes the data stored in the y variable to the correct indexed postions in WriteOutput
! This is called by HydroDyn_CalcOutput() at each time step.
!---------------------------------------------------------------------------------------------------- 
   REAL(DbKi),                         INTENT( IN    )  :: CurrentTime    ! Current simulation time in seconds
   TYPE(HydroDyn_OutputType),          INTENT( INOUT )  :: y              ! HydroDyn's output data
   INTEGER,                            INTENT( IN    )  :: NWaveElev      ! Number of wave elevation locations to output
   REAL(ReKi),                         INTENT( IN    )  :: WaveElev(:)    ! Instantaneous total elevation of incident waves at each of the NWaveElev points where the incident wave elevations can be output (meters)   
   REAL(ReKi),                         INTENT( IN    )  :: WaveElev1(:)    ! Instantaneous first order elevation of incident waves at each of the NWaveElev points where the incident wave elevations can be output (meters)   
   REAL(ReKi),                         INTENT( IN    )  :: F_Add(6)
   REAL(ReKi),                         INTENT( IN    )  :: F_Waves(6)
   REAL(ReKi),                         INTENT( IN    )  :: F_Hydro(6)
   REAL(ReKi),                         INTENT( IN    )  :: q(6)           ! WRP translations and rotations
   REAL(ReKi),                         INTENT( IN    )  :: qdot(6)        ! WRP translational and rotational velocities
   REAL(ReKi),                         INTENT( IN    )  :: qdotdot(6)     ! WRP translational and rotational accelerations
   REAL(ReKi),                         INTENT(   OUT )  :: AllOuts(MaxHDOutputs)
   INTEGER(IntKi),                     INTENT(   OUT )  :: ErrStat        ! Error status of the operation
   CHARACTER(*),                       INTENT(   OUT )  :: ErrMsg         ! Error message if ErrStat /= ErrID_None

   INTEGER                                              :: I
   
   ErrStat = ErrID_None
   ErrMsg = ""
   
   
   ! TODO:  use y%mesh for the forces instead of individual parameters

   !AllOuts(Time)      = REAL(CurrentTime,ReKi)
   
   AllOuts(FAdd)            = F_Add
   AllOuts(FWavesTot)       = F_Waves
   AllOuts(FHydro)          = F_Hydro
   AllOuts(WRPMotions)      = q
   AllOuts(WRPVel)          = qdot
   AllOuts(WRPAcc)          = qdotdot
   
   DO I=1,NWaveElev
      AllOuts(WaveElevi(I)) = WaveElev(I)
      AllOuts(WaveElevi1(I))= WaveElev1(I)
   END DO
   
   
   
END SUBROUTINE HDOut_MapOutputs

!====================================================================================================
SUBROUTINE HDOut_WriteOutputs( Time, y, p, Decimate, ErrStat, ErrMsg )
! This subroutine writes the data stored in WriteOutputs (and indexed in OutParam) to the file
! opened in HDOut_Init()
!---------------------------------------------------------------------------------------------------- 

      ! Passed variables    
   REAL(DbKi),                   INTENT( IN    ) :: Time
   TYPE(HydroDyn_OutputType),    INTENT( INOUT ) :: y                    ! HydroDyn's output data
   TYPE(HydroDyn_ParameterType), INTENT( IN    ) :: p                    ! HydroDyn parameter data
   INTEGER,                      INTENT( INOUT ) :: Decimate             ! Output decimatation counter
   INTEGER,                      INTENT(   OUT ) :: ErrStat              ! returns a non-zero value when an error occurs  
   CHARACTER(*),                 INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None
   
      ! Local variables
   INTEGER                                :: I                           ! Generic loop counter
   CHARACTER(200)                         :: Frmt                        ! a string to hold a format statement
   
   
  IF (p%UnOutFile < 0 ) RETURN
  
      ! Initialize ErrStat and determine if it makes any sense to write output
!TODO: We should not have this check here, once per timestep!  This should be resolved during initialization. GJH 7/7/2014    
   IF ( ( (.NOT. ALLOCATED( p%OutParam )) .AND. (.NOT. ALLOCATED( p%WAMIT%OutParam ) ) .AND. (.NOT. ALLOCATED( p%WAMIT2%OutParam ) )&
          .AND. (.NOT. ALLOCATED( p%Waves2%OutParam ) ) .AND. ( .NOT. ALLOCATED( p%Morison%OutParam ) ) ) )  THEN
      ErrStat = ErrID_Warn
      ErrMsg  = ' Cannot write output to file because there are not a valid output list.'
      RETURN
   ELSE
      ErrStat = ErrID_None
      ErrMsg  = ''
   END IF
   
   
      ! Write the output parameters to the file
      
   !Frmt = '(F8.3,'//TRIM(Int2LStr(p%WAMIT%NumOuts+p%Morison%NumOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
   !Frmt = '('//TRIM( p%OutFmt )//','//TRIM(Int2LStr(p%NumOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
   
   !WRITE(p%UnOutFile,Frmt) Time, ( p%Delim, y%WAMIT%WriteOutput(I), I=1,p%WAMIT%NumOuts), ( p%Delim, y%Morison%WriteOutput(I), I=1,p%Morison%NumOuts)
   
   IF ((Decimate .EQ. p%OutDec) .OR. (Decimate .EQ. 0))  THEN
      
      Decimate = 1  !reset counter  
            
      Frmt = '(F10.4)'
   
      WRITE(p%UnOutFile,Frmt,ADVANCE='no')  Time
      
      IF ( p%NumTotalOuts > 0 ) THEN
         Frmt = '('//TRIM(Int2LStr(p%NumTotalOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim,  y%WriteOutput(I)  , I=1,p%NumTotalOuts )   
      END IF
      
      !   ! HydroDyn Outputs
      !IF (ALLOCATED( p%OutParam ) .AND. p%NumOuts > 0) THEN
      !!IF (p%DoOutput) THEN
      !   Frmt = '('//TRIM(Int2LStr(p%NumOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
      !   WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim,  y%WriteOutput(I)  , I=1,p%NumOuts )   
      !END IF
      !
      !   ! WAMIT Outputs
      !IF (ALLOCATED( p%WAMIT%OutParam ) .AND. p%WAMIT%NumOuts > 0) THEN
      !!IF (p%WAMIT%DoOutput) THEN
      !   Frmt = '('//TRIM(Int2LStr(p%WAMIT%NumOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
      !   WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim,  y%WAMIT%WriteOutput(I)  , I=1,p%WAMIT%NumOuts )
      !END IF
      !
      !   ! Morison Outputs
      !IF (ALLOCATED( p%Morison%OutParam ) .AND. p%Morison%NumOuts > 0) THEN
      !!IF (p%Morison%DoOutput) THEN
      !   Frmt = '('//TRIM(Int2LStr(p%Morison%NumOuts))//'(:,A,'//TRIM( p%OutFmt )//'))'
      !   WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim,  y%Morison%WriteOutput(I), I=1,p%Morison%NumOuts )
      !END IF
          
      WRITE (p%UnOutFile,'()', IOSTAT=ErrStat)          ! write the line return
   
   ELSE      
      Decimate = Decimate + 1
   ENDIF
   
   RETURN
   
END SUBROUTINE HDOut_WriteOutputs

!====================================================================================================
SUBROUTINE HDOUT_Init( HydroDyn_ProgDesc, InitInp, y,  p, OtherState, InitOut, ErrStat, ErrMsg )
! This subroutine initialized the output module, checking if the output parameter list (OutList)
! contains valid names, and opening the output file if there are any requested outputs
! NOTE: This routine must be called only after any sub-modules OUT_Init() subroutines have been called.
!----------------------------------------------------------------------------------------------------

   

      ! Passed variables

   TYPE(ProgDesc),                INTENT( IN    ) :: HydroDyn_ProgDesc    ! 
   TYPE(HydroDyn_InitInputType ), INTENT( IN    ) :: InitInp              ! data needed to initialize the output module     
   TYPE(HydroDyn_OutputType),     INTENT( INOUT ) :: y                    ! This module's internal data
   TYPE(HydroDyn_ParameterType),  INTENT( INOUT ) :: p 
   TYPE(HydroDyn_OtherStateType), INTENT( INOUT ) :: OtherState
   TYPE(HydroDyn_InitOutputType), INTENT( INOUT ) :: InitOut
   INTEGER,                       INTENT(   OUT ) :: ErrStat              ! a non-zero value indicates an error occurred           
   CHARACTER(*),                  INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None
   
      ! Local variables
   INTEGER                                        :: I                    ! Generic loop counter      
   INTEGER                                        :: J                    ! Generic loop counter      
!   INTEGER                                        :: Indx                 ! Counts the current index into the WaveKinNd array
!   CHARACTER(1024)                                :: OutFileName          ! The name of the output file  including the full path.
!   CHARACTER(200)                                 :: Frmt                 ! a string to hold a format statement
   LOGICAL                                        :: hasWAMITOuts         ! Are there any WAMIT-related outputs
   LOGICAL                                        :: hasWAMIT2Outs        ! Are there any WAMIT-related outputs
   LOGICAL                                        :: hasWaves2Outs        ! Are there any WAMIT-related outputs
   LOGICAL                                        :: hasMorisonOuts       ! Are there any Morison-related outputs
   
   
   
   
   
   !-------------------------------------------------------------------------------------------------      
   ! Initialize local variables
   !-------------------------------------------------------------------------------------------------      
     
         
   ErrStat = ErrID_None         
   ErrMsg  = ""  
      
  


   !-------------------------------------------------------------------------------------------------      
   ! Check that the variables in OutList are valid      
   !-------------------------------------------------------------------------------------------------      
      
   
   CALL HDOUT_ChkOutLst( InitInp%OutList(1:p%NumOuts), y, p, ErrStat, ErrMsg )
   IF ( ErrStat /= 0 ) RETURN
   
   
  !IF ( ALLOCATED( p%OutParam ) .AND. p%NumOuts > 0 ) THEN           ! Output has been requested so let's open an output file            
  !    
  !    ALLOCATE( y%WriteOutput( p%NumOuts ),  STAT = ErrStat )
  !    IF ( ErrStat /= ErrID_None ) THEN
  !       ErrMsg  = ' Error allocating space for WriteOutput array.'
  !       ErrStat = ErrID_Fatal
  !       RETURN
  !    END IF
  !    y%WriteOutput = 0.0_ReKi
  !    
  !      ALLOCATE ( InitOut%WriteOutputHdr(p%NumOuts), STAT = ErrStat )
  !    IF ( ErrStat /= ErrID_None ) THEN
  !       ErrMsg  = ' Error allocating space for WriteOutputHdr array.'
  !       ErrStat = ErrID_Fatal
  !       RETURN
  !    END IF
  !    
  !    ALLOCATE ( InitOut%WriteOutputUnt(p%NumOuts), STAT = ErrStat )
  !    IF ( ErrStat /= ErrID_None ) THEN
  !       ErrMsg  = ' Error allocating space for WriteOutputHdr array.'
  !       ErrStat = ErrID_Fatal
  !       RETURN
  !    END IF   
  !
  !    DO I = 1,p%NumOuts
  !       
  !       InitOut%WriteOutputHdr(I) = TRIM( p%OutParam(I)%Name  )
  !       InitOut%WriteOutputUnt(I) = TRIM( p%OutParam(I)%Units )      
  !    
  !    END DO   
  !    
  ! END IF   ! there are any requested outputs   

      
     
         ! Aggregate the sub-module initialization outputs for the glue code
      !IF ( p%OutSwtch == 2 .OR. p%OutSwtch == 3 ) THEN
         
         hasWAMITOuts   = .FALSE.
         hasWAMIT2Outs  = .FALSE.
         hasWaves2Outs  = .FALSE.
         hasMorisonOuts = .FALSE.
         p%NumTotalOuts   = p%NumOuts
         OtherState%LastOutTime = 0.0_DbKi
         OtherState%Decimate    = 0
         p%OutDec               = 1             !TODO: Remove this once the parameter has been added to the HD input file GJH 7/8/2014
         
         IF (ALLOCATED( p%WAMIT%OutParam ) .AND. p%WAMIT%NumOuts > 0) THEN
            hasWAMITOuts = .TRUE.
            p%NumTotalOuts = p%NumTotalOuts + p%WAMIT%NumOuts       
         END IF
         IF (ALLOCATED( p%WAMIT2%OutParam ) .AND. p%WAMIT2%NumOuts > 0) THEN
            hasWAMIT2Outs = .TRUE.
            p%NumTotalOuts = p%NumTotalOuts + p%WAMIT2%NumOuts       
         END IF
         IF (ALLOCATED( p%Waves2%OutParam ) .AND. p%Waves2%NumOuts > 0) THEN
            hasWaves2Outs = .TRUE.
            p%NumTotalOuts = p%NumTotalOuts + p%Waves2%NumOuts       
         END IF
         IF (ALLOCATED( p%Morison%OutParam ) .AND. p%Morison%NumOuts > 0) THEN
            hasMorisonOuts = .TRUE.
            p%NumTotalOuts = p%NumTotalOuts + p%Morison%NumOuts       
         END IF
      
            ! Allocate the aggregate arrays
         
         ALLOCATE ( InitOut%WriteOutputHdr ( p%NumTotalOuts ) , STAT=ErrStat )
         IF ( ErrStat /= 0 )  THEN
            ErrMsg  = ' Error allocating memory for the WriteOutputHdr array.'
            ErrStat = ErrID_Fatal
            RETURN
         END IF
         
         ALLOCATE ( InitOut%WriteOutputUnt ( p%NumTotalOuts ) , STAT=ErrStat )
         IF ( ErrStat /= 0 )  THEN
            ErrMsg  = ' Error allocating memory for the WriteOutputUnt array.'
            ErrStat = ErrID_Fatal
            RETURN
         END IF
         
         ALLOCATE ( y%WriteOutput         ( p%NumTotalOuts ) , STAT=ErrStat )
         IF ( ErrStat /= 0 )  THEN
            ErrMsg  = ' Error allocating memory for the WriteOutput array.'
            ErrStat = ErrID_Fatal
            RETURN
         END IF
         y%WriteOutput = 0.0_ReKi  ! bjj added this only so the Intel Inspector wouldn't complaing about uninitialized memory access (was harmless)
         
                  
            ! Initialize the HD-level Hdr and Unt elements
         DO I = 1,p%NumOuts
         
            InitOut%WriteOutputHdr(I) = TRIM( p%OutParam(I)%Name  )
            InitOut%WriteOutputUnt(I) = TRIM( p%OutParam(I)%Units )      
      
         END DO    
            
            
         J = p%NumOuts + 1
         
         IF ( hasWAMITOuts ) THEN
            DO I=1, p%WAMIT%NumOuts
               InitOut%WriteOutputHdr(J) = InitOut%WAMIT%WriteOutputHdr(I)
               InitOut%WriteOutputUnt(J) = InitOut%WAMIT%WriteOutputUnt(I)
               J = J + 1
            END DO
         END IF
         IF ( hasWAMIT2Outs ) THEN
            DO I=1, p%WAMIT2%NumOuts
               InitOut%WriteOutputHdr(J) = InitOut%WAMIT2%WriteOutputHdr(I)
               InitOut%WriteOutputUnt(J) = InitOut%WAMIT2%WriteOutputUnt(I)
               J = J + 1
            END DO
         END IF
         IF ( hasWaves2Outs ) THEN
            DO I=1, p%Waves2%NumOuts
               InitOut%WriteOutputHdr(J) = InitOut%Waves2%WriteOutputHdr(I)
               InitOut%WriteOutputUnt(J) = InitOut%Waves2%WriteOutputUnt(I)
               J = J + 1
            END DO
         END IF
         
         IF ( hasMorisonOuts ) THEN
            DO I=1, p%Morison%NumOuts
               InitOut%WriteOutputHdr(J) = InitOut%Morison%WriteOutputHdr(I)
               InitOut%WriteOutputUnt(J) = InitOut%Morison%WriteOutputUnt(I)
               J = J + 1
            END DO
         END IF
         
      !END IF
      
      IF ( p%OutSwtch == 1 .OR. p%OutSwtch == 3 ) THEN
         CALL HDOut_OpenOutput( HydroDyn_ProgDesc, InitInp%OutRootName, p, InitOut, ErrStat, ErrMsg )
         IF (ErrStat >= AbortErrLev ) RETURN
      END IF
      
      IF ( p%OutSwtch == 1 ) THEN ! Only HD-level output writing
         ! HACK  WE can tell FAST not to write any HD outputs by simply deallocating the WriteOutputHdr array!
         DEALLOCATE ( InitOut%WriteOutputHdr )
      END IF

   RETURN

END SUBROUTINE HDOUT_Init

!====================================================================================================
SUBROUTINE HDOut_OpenOutput( HydroDyn_ProgDesc, OutRootName,  p, InitOut, ErrStat, ErrMsg )
! This subroutine initialized the output module, checking if the output parameter list (OutList)
! contains valid names, and opening the output file if there are any requested outputs
!----------------------------------------------------------------------------------------------------

   

      ! Passed variables

   TYPE(ProgDesc)               , INTENT( IN    ) :: HydroDyn_ProgDesc
   CHARACTER(1024),               INTENT( IN    ) :: OutRootName          ! Root name for the output file
   TYPE(HydroDyn_ParameterType),  INTENT( INOUT ) :: p   
   TYPE(HydroDyn_InitOutPutType ),INTENT( IN    ) :: InitOut            !
   INTEGER,                       INTENT(   OUT ) :: ErrStat              ! a non-zero value indicates an error occurred           
   CHARACTER(*),                  INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None
   
      ! Local variables
   INTEGER                                        :: I                    ! Generic loop counter      
!   INTEGER                                        :: J                    ! Generic loop counter      
!   INTEGER                                        :: Indx                 ! Counts the current index into the WaveKinNd array
   CHARACTER(1024)                                ::  OutFileName         ! The name of the output file  including the full path.
   CHARACTER(200)                                 :: Frmt                 ! a string to hold a format statement
                
   !-------------------------------------------------------------------------------------------------      
   ! Initialize local variables
   !-------------------------------------------------------------------------------------------------      
   ErrStat = ErrID_None
   ErrMsg = ""
      
   
   
   !-------------------------------------------------------------------------------------------------      
   ! Open the output file, if necessary, and write the header
   !-------------------------------------------------------------------------------------------------      
   p%UnOutFile = -1
   IF ( (ALLOCATED( p%OutParam         ) .AND. p%NumOuts > 0         ) .OR. &
        (ALLOCATED( p%WAMIT%OutParam   ) .AND. p%WAMIT%NumOuts > 0   ) .OR. &
        (ALLOCATED( p%WAMIT2%OutParam  ) .AND. p%WAMIT2%NumOuts > 0  ) .OR. &
        (ALLOCATED( p%Waves2%OutParam  ) .AND. p%Waves2%NumOuts > 0  ) .OR. &
        (ALLOCATED( p%Morison%OutParam ) .AND. p%Morison%NumOuts > 0 ) ) THEN           ! Output has been requested so let's open an output file            
      
         ! Open the file for output
      OutFileName = TRIM(OutRootName)//'.HD.out'
      CALL GetNewUnit( p%UnOutFile )
   
      CALL OpenFOutFile ( p%UnOutFile, OutFileName, ErrStat, ErrMsg ) 
      IF (ErrStat >=AbortErrLev) RETURN
      
      
         ! Write the output file header
      
      WRITE (p%UnOutFile,'(/,A/)', IOSTAT=ErrStat)  'These predictions were generated by '//TRIM(HydroDyn_ProgDesc%Name)//&
                      ' on '//CurDate()//' at '//CurTime()//'.'
   
         ! Write the names of the output parameters:
      Frmt = '(A8)'
      WRITE(p%UnOutFile,Frmt,ADVANCE='no')  TRIM( 'Time' )
      
      IF (ALLOCATED( p%OutParam ) .AND. p%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WriteOutputHdr(I)   ), I=1,p%NumOuts )
      END IF
      
      IF (ALLOCATED( p%WAMIT%OutParam ) .AND. p%WAMIT%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%WAMIT%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WAMIT%WriteOutputHdr(I)   ), I=1,p%WAMIT%NumOuts )
      END IF
      
      IF (ALLOCATED( p%WAMIT2%OutParam ) .AND. p%WAMIT2%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%WAMIT2%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WAMIT2%WriteOutputHdr(I)   ), I=1,p%WAMIT2%NumOuts )
      END IF
      
      IF (ALLOCATED( p%Waves2%OutParam ) .AND. p%Waves2%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%Waves2%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%Waves2%WriteOutputHdr(I)   ), I=1,p%Waves2%NumOuts )
      END IF
      
      IF (ALLOCATED( p%Morison%OutParam ) .AND. p%Morison%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%Morison%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%Morison%WriteOutputHdr(I) ), I=1,p%Morison%NumOuts )
      END IF
      
      
      WRITE (p%UnOutFile,'()', IOSTAT=ErrStat)          ! write the line return
      
      
         ! Write the units of the output parameters:
         
     
      Frmt = '(A8)'
      WRITE(p%UnOutFile,Frmt,ADVANCE='no')  TRIM( '(sec)' )
      
      IF (ALLOCATED( p%OutParam ) .AND. p%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WriteOutputUnt(I)   ), I=1,p%NumOuts )
      END IF
      
      IF (ALLOCATED( p%WAMIT%OutParam ) .AND. p%WAMIT%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%WAMIT%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WAMIT%WriteOutputUnt(I)   ), I=1,p%WAMIT%NumOuts )
      END IF
      
      IF (ALLOCATED( p%WAMIT2%OutParam ) .AND. p%WAMIT2%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%WAMIT2%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%WAMIT2%WriteOutputUnt(I)   ), I=1,p%WAMIT2%NumOuts )
      END IF
      
      IF (ALLOCATED( p%Waves2%OutParam ) .AND. p%Waves2%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%Waves2%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%Waves2%WriteOutputUnt(I)   ), I=1,p%Waves2%NumOuts )
      END IF
      
      IF (ALLOCATED( p%Morison%OutParam ) .AND. p%Morison%NumOuts > 0) THEN
         Frmt = '('//TRIM(Int2LStr(p%Morison%NumOuts))//'(:,A,'//TRIM( p%OutSFmt )//'))'
         WRITE(p%UnOutFile,Frmt,ADVANCE='no')   ( p%Delim, TRIM( InitOut%Morison%WriteOutputUnt(I) ), I=1,p%Morison%NumOuts )
      END IF
      
     
      
      WRITE (p%UnOutFile,'()', IOSTAT=ErrStat)          ! write the line return                               
      
      
   
      
   END IF   ! there are any requested outputs   

   RETURN

END SUBROUTINE HDOut_OpenOutput

!====================================================================================================
FUNCTION   HDOut_GetChannels    ( NUserOutputs, UserOutputs, OutList, foundMask, ErrStat, ErrMsg )
! This routine checks the names of inputted output channels, checks to see if they
! below to the list of available Morison channels.

!----------------------------------------------------------------------------------------------------    
   INTEGER,                       INTENT( IN    ) :: NUserOutputs         ! Number of user-specified output channels
   CHARACTER(10),                 INTENT( IN    ) :: UserOutputs (:)      ! An array holding the names of the requested output channels.
   CHARACTER(10),                 INTENT(   OUT ) :: OutList (:)          ! An array holding the names of the matched WAMIT output channels. 
   LOGICAL,                       INTENT( INOUT ) :: foundMask (:)        ! A mask indicating whether a user requested channel belongs to a module's output channels.
   INTEGER,                       INTENT(   OUT ) :: ErrStat              ! a non-zero value indicates an error occurred           
   CHARACTER(*),                  INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None

   INTEGER                                           HDOut_GetChannels     ! The number of channels found in this module

   ! Local variables.
   
   INTEGER                                :: I                                         ! Generic loop-counting index.
   INTEGER                                :: count                                     ! Generic loop-counting index.
   INTEGER                                :: INDX                                      ! Index for valid arrays
   
   CHARACTER(10)                          :: OutListTmp                                ! A string to temporarily hold OutList(I).
   CHARACTER(28), PARAMETER               :: OutPFmt   = "( I4, 3X,A 10,1 X, A10 )"    ! Output format parameter output list.
   LOGICAL                                :: CheckOutListAgain
   LOGICAL                                :: newFoundMask (NUserOutputs)        ! A mask indicating whether a user requested channel belongs to a module's output channels.
       ! Initialize ErrStat
         
   ErrStat = ErrID_None         
   ErrMsg  = "" 
   HDOut_GetChannels = 0
   
   newFoundMask    = .FALSE.

    DO I = 1,NUserOutputs
      IF (.NOT. foundMask(I) ) THEN
      OutListTmp         = UserOutputs(I)

      CheckOutListAgain  = .FALSE.
      
      ! Reverse the sign (+/-) of the output channel if the user prefixed the
      !   channel name with a '-', '_', 'm', or 'M' character indicating "minus".
      
      
      
      IF      ( INDEX( '-_', OutListTmp(1:1) ) > 0 ) THEN
        
         OutListTmp                   = OutListTmp(2:)
      ELSE IF ( INDEX( 'mM', OutListTmp(1:1) ) > 0 ) THEN ! We'll assume this is a variable name for now, (if not, we will check later if OutListTmp(2:) is also a variable name)
         CheckOutListAgain            = .TRUE.
         
      END IF
      
      CALL Conv2UC( OutListTmp )    ! Convert OutListTmp to upper case
   
   
      Indx =  IndexCharAry( OutListTmp(1:9), ValidParamAry )
      
      IF ( CheckOutListAgain .AND. Indx < 1 ) THEN    ! Let's assume that "M" really meant "minus" and then test again         
           ! ex, 'MTipDxc1' causes the sign of TipDxc1 to be switched.
         OutListTmp                   = OutListTmp(2:)
         
         Indx = IndexCharAry( OutListTmp(1:9), ValidParamAry )         
      END IF
      
      IF ( Indx > 0 ) THEN     
            newFoundMask(I)    = .TRUE.
            foundMask(I)       = .TRUE.
            HDOut_GetChannels = HDOut_GetChannels + 1
        
      !ELSE
      !   foundMask(I) = .FALSE.           
      END IF
    END IF  
END DO
   
IF ( HDOut_GetChannels > 0 ) THEN
   
   count = 1
   ! Test that num channels does not exceed max possible channels due to size of OutList
   !ALLOCATE ( OutList(GetWAMITChannels) , STAT=ErrStat )
   IF ( ErrStat /= 0 )  THEN
      ErrMsg  = ' Error allocating memory for the OutList array in the GetHydroDynChannels function.'
      ErrStat = ErrID_Fatal
      RETURN
   END IF
   
   DO I = 1,NUserOutputs
      IF ( newFoundMask(I) ) THEN
         OutList(count) = UserOutputs(I)
         count = count + 1
      END IF
      
   END DO
   
END IF

END FUNCTION HDOut_GetChannels

!====================================================================================================
SUBROUTINE HDOut_ChkOutLst( OutList, y, p, ErrStat, ErrMsg )
! This routine checks the names of inputted output channels, checks to see if any of them are ill-
! conditioned (returning an error if so), and assigns the OutputDataType settings (i.e, the index,  
! name, and units of the output channels). 
! Note that the HydroDyn module must be initialized prior to calling this function (if it
! is being used) so that it can correctly determine if the Lines outputs are valid.
!----------------------------------------------------------------------------------------------------    
   
   
   
      ! Passed variables
      
   TYPE(HydroDyn_OutputType),     INTENT( INOUT ) :: y                                ! This module's internal data
   TYPE(HydroDyn_ParameterType),  INTENT( INOUT ) :: p                                   ! parameter data for this instance of the HD module   
!   INTEGER,                 INTENT(IN   ) :: NumMemberNodes(*)                         ! the number of nodes on each of the first 9 members
   CHARACTER(10),                 INTENT( IN    ) :: OutList (:)                               ! An array holding the names of the requested output channels.         
   INTEGER,                       INTENT(   OUT ) :: ErrStat              ! a non-zero value indicates an error occurred           
   CHARACTER(*),                  INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None
   
      ! Local variables.
   
   INTEGER                                :: I                                         ! Generic loop-counting index.
!   INTEGER                                :: J                                         ! Generic loop-counting index.
   INTEGER                                :: INDX                                      ! Index for valid arrays
   
   CHARACTER(10)                          :: OutListTmp                                ! A string to temporarily hold OutList(I).
   CHARACTER(28), PARAMETER               :: OutPFmt = "( I4, 3X,A 10,1 X, A10 )"      ! Output format parameter output list.
   LOGICAL                                :: InvalidOutput(MaxHDOutputs)               ! This array determines if the output channel is valid for this configuration
   LOGICAL                                :: CheckOutListAgain
    
     !-------------------------------------------------------------------------------------------------
   ! Allocate and set index, name, and units for the output channels
   ! If a selected output channel is not available in this module, set error flag.
   !-------------------------------------------------------------------------------------------------

   ALLOCATE ( p%OutParam(0:p%NumOuts) , STAT=ErrStat )
   IF ( ErrStat /= 0_IntKi )  THEN
      ErrStat = ErrID_Fatal
      ErrMsg  = "Error allocating memory for the HydroDyn OutParam array."
      RETURN
   ELSE
      ErrStat = ErrID_None
      ErrMsg  = ""
   ENDIF

   InvalidOutput = .FALSE.
   

      ! Set index, name, and units for all of the output channels.
      ! If a selected output channel is not available by this module set ErrStat = ErrID_Warn.

   DO I = 1,p%NumOuts

      p%OutParam(I)%Name  = OutList(I)
      OutListTmp          = OutList(I)

      ! Reverse the sign (+/-) of the output channel if the user prefixed the
      !   channel name with a "-", "_", "m", or "M" character indicating "minus".


      CheckOutListAgain = .FALSE.

      IF      ( INDEX( "-_", OutListTmp(1:1) ) > 0 ) THEN
         p%OutParam(I)%SignM = -1                         ! ex, "-TipDxc1" causes the sign of TipDxc1 to be switched.
         OutListTmp          = OutListTmp(2:)
      ELSE IF ( INDEX( "mM", OutListTmp(1:1) ) > 0 ) THEN ! We'll assume this is a variable name for now, (if not, we will check later if OutListTmp(2:) is also a variable name)
         CheckOutListAgain   = .TRUE.
         p%OutParam(I)%SignM = 1
      ELSE
         p%OutParam(I)%SignM = 1
      END IF

      CALL Conv2UC( OutListTmp )    ! Convert OutListTmp to upper case


      Indx = IndexCharAry( OutListTmp(1:OutStrLenM1), ValidParamAry )


         ! If it started with an "M" (CheckOutListAgain) we didn't find the value in our list (Indx < 1)

      IF ( CheckOutListAgain .AND. Indx < 1 ) THEN    ! Let's assume that "M" really meant "minus" and then test again
         p%OutParam(I)%SignM = -1                     ! ex, "MTipDxc1" causes the sign of TipDxc1 to be switched.
         OutListTmp          = OutListTmp(2:)

         Indx = IndexCharAry( OutListTmp(1:OutStrLenM1), ValidParamAry )
      END IF


      IF ( Indx > 0 ) THEN ! we found the channel name
         p%OutParam(I)%Indx     = ParamIndxAry(Indx)
         IF ( InvalidOutput( ParamIndxAry(Indx) ) ) THEN  ! but, it isn't valid for these settings
            p%OutParam(I)%Units = "INVALID"
            p%OutParam(I)%SignM = 0
         ELSE
            p%OutParam(I)%Units = ParamUnitsAry(Indx) ! it's a valid output
         END IF
      ELSE ! this channel isn't valid
         p%OutParam(I)%Indx  = 1                 ! pick any valid channel 
         p%OutParam(I)%Units = "INVALID"
         p%OutParam(I)%SignM = 0                    ! multiply all results by zero

         ErrStat = ErrID_Warn
         ErrMsg  = p%OutParam(I)%Name//" is not an available output channel. "//TRIM(ErrMsg)
      END IF

   END DO

   RETURN
   
END SUBROUTINE HDOut_ChkOutLst


!====================================================================================================
SUBROUTINE HDOut_CloseOutput ( p, ErrStat, ErrMsg )
! This function cleans up after running the HydroDyn output module. It closes the output file,
! releases memory, and resets the number of outputs requested to 0.
!----------------------------------------------------------------------------------------------------

         ! Passed variables

   TYPE(HydroDyn_ParameterType),  INTENT( INOUT ) :: p                    ! parameter data for this instance of the HydroDyn module        
   INTEGER,                       INTENT(   OUT ) :: ErrStat              ! a non-zero value indicates an error occurred           
   CHARACTER(*),                  INTENT(   OUT ) :: ErrMsg               ! Error message if ErrStat /= ErrID_None

!      ! Internal variables
   LOGICAL                               :: Err


   !-------------------------------------------------------------------------------------------------
   ! Initialize error information
   !-------------------------------------------------------------------------------------------------
      
         
   ErrStat = ErrID_None         
   ErrMsg  = ""    
      
   Err     = .FALSE.

         ! Write the summary file header
   IF ( p%UnOutFile > -1 ) THEN   
      WRITE (p%UnOutFile,'(/,A/)', IOSTAT=ErrStat)  'This output file was closed on '//CurDate()//' at '//CurTime()//'.'
   
   !-------------------------------------------------------------------------------------------------
   ! Close our output file
   !-------------------------------------------------------------------------------------------------
      CLOSE( p%UnOutFile, IOSTAT = ErrStat )
      IF ( ErrStat /= 0 ) Err = .TRUE.

   END IF
 
   !-------------------------------------------------------------------------------------------------
   ! Make sure ErrStat is non-zero if an error occurred
   !-------------------------------------------------------------------------------------------------
   IF ( Err ) THEN
      ErrStat = ErrID_Fatal
      ErrMsg  = ' Error closing HydroDyn output file.'
   END IF
   
   RETURN

END SUBROUTINE HDOut_CloseOutput
!====================================================================================================


!====================================================================================================
END MODULE HydroDyn_Output
