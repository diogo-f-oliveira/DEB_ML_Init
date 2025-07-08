%% mydata_Solea_solea

%%
function [data, auxData, metaData, txtData, weights] = mydata_Solea_solea
  
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Solea_solea'; 
metaData.species_en = 'Common sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13);     % K
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap_T';'am'; 'Lh';'Lb';'Lj';'Lp';'Li';'Wd0';'Wdh';'Wdb';'Wdj';'Wwp';'Wwi'; 'Ri_L'; 'E0'; 'pAi'}; 
metaData.data_1     = {'T-ah'; 'T-ab'; 'T-aj';'t-L_T'; 't-Wd';'L-Ww'; 'L-N'; 'L-JX_T'};

metaData.COMPLETE = 3.3; % using criteria of LikaKear2011

metaData.author   = {'Lorna Teal'};    
metaData.date_subm = [2011 08 24];              
metaData.email    = {'lorna.teal@wur.nl'};            
metaData.address  = {'IMARES, IJmuiden'}; 

metaData.author_mod_1   = {'Florence Mounier'; 'Nina Marn'}; 
metaData.date_mod_1     = [2021 11 25];        
metaData.email_mod_1    = {'florence.mounier@inrae.fr'};
metaData.address_mod_1  = {'INRAE, Centre Nouvelle Aquitaine-Bordeaux, UR EABX, 50 av. de Verdun, 33612 Cestas, France'};

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nmarn@irb.hr'}; 
metaData.date_acc = [2021 11 30]; 


%% set data
%% zero-variate data
data.ah = 4.5;      units.ah = 'd';    label.ah = 'age at hatching'; bibkey.ah = 'Fond1979'; 
    temp.ah = C2K(13); units.temp.ah = 'K'; label.temp.ah = 'temperature';  
    comment.ah = 'Table 1: time from fertilization to stage 4 (hatching) at 13degC (reliable temperature)';
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Fond1979'; 
    temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'Table 1: time from fertilization to stage 5 (start of feeding) at 13degC (reliable temperature)';
data.tj = 28;      units.tj = 'd';    label.tj = 'time from birth to metamorphosis';  bibkey.tj = 'Fond1979';
    temp.tj = C2K(13); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
    comment.tj = 'Fig. 3: estimated time from feeding larvae to metamorphosis at 13degC"';
data.ap = 2.58 * 365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'Deni1981'; 
    temp.ap = C2K(13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
    comment.ap = ['Page 409: smallest spawning females [RGS>5% and ovocytes diameter > 500 micro-m in february] were 33cm => ',...
        'age-length relationship for female log(1 - (LT/48.161))/-0.329 + 0.075 = 3.58 y => minus 1 year of maturation needed (see Page 204 Fig.67) => 2.58y'];
data.ap10 = 3 * 365; units.ap10 = 'd';    label.ap10 = 'age at puberty';            bibkey.ap10 = 'MollKraa2007';
  temp.ap10 = C2K(10);  units.temp.ap10 = 'K'; label.temp.ap10 = 'temperature';  comment.ap10 = '50% of age 3 are mature, temp is North Sea estimate';
data.ap_m = 1.94 * 365;     units.ap_m = 'd';    label.ap_m = 'age at puberty for male'; bibkey.ap_m = 'Dore1986, Deni1981';
    temp.ap_m = C2K(13); units.temp.ap_m = 'K'; label.temp.ap_m = 'temperature';
    comment.ap_m = 'Dorel 1986 - Bay of Biscay - page 74-75: length at maturity = 22cm => age-length relationship for male from Deni1981';  
data.am = 26 * 365;     units.am = 'd';    label.am = 'life span for female'; bibkey.am = 'Deni1981';
    temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';
    comment.am = 'table 118 P.383';
data.am_m = 24 * 365;     units.am_m = 'd';    label.am_m = 'life span for male'; bibkey.am_m = 'Deni1981';
    temp.am_m = C2K(13); units.temp.am_m = 'K'; label.temp.am_m = 'temperature';
    comment.am_m = 'table 119 P.383';

data.Lh = 0.325;    units.Lh = 'cm';   label.Lh = 'total length at hatching'; bibkey.Lh = 'Fond1979'; 
    comment.Lh = 'Page 92: 3 to 3.5 mm total length at hatching';
data.Lb = 0.425;    units.Lb = 'cm';   label.Lb = 'total length at birth'; bibkey.Lb = 'Fond1979'; 
    comment.Lb = 'Page 94: "active swimming first-feeding larvae were 4-4.5 mm long"';
data.Lj = 1;    units.Lj = 'cm';   label.Lj = 'total length at the end of metamorphosis'; bibkey.Lj = 'Fond1979'; 
    comment.Lj = 'Page 94: "metamorphosis started at 8 to 9mm length...10mm for complete metamorphosis"';
data.Lp = 27;       units.Lp = 'cm';   label.Lp = 'total length at puberty for female';  bibkey.Lp = {'Deni1981','MollKraa2007'};
    comment.Lp = 'Page 397: length-age relationship for female = 48.161 * (1 - exp(-0.329*(ap-0.075)) (Deni1981); 25 cm MollKraa2007';
data.Lp_m = 22;       units.Lp_m = 'cm';   label.Lp_m = 'total length at puberty for male';  bibkey.Lp_m = 'Dore1986';
   comment.Lp_m = 'Dorel 1986 - Bay of Biscay - page 74-75: length at maturity';
data.Li = 48;       units.Li = 'cm';   label.Li = 'ultimate total length for female';    bibkey.Li = {'Deni1981', 'Whee1978'};
    comment.Li = ['P. 397: Linf von Bertalanffy estimation for female (48 cm, Deni1981); ',...
        'size rarely goes above but specimen of 70 has been reported; North Sea data rarely above 45cm! (Whee1978)' ];
data.Li_m = 42;       units.Li_m = 'cm';   label.Li_m = 'ultimate total length for male';    bibkey.Li_m = 'Deni1981';
    comment.Li_m = 'P. 397: Linf von Bertalanffy estimation for male';

data.Wd0 = 0.12e-3; units.Wd0 = 'g';   label.Wd0 = 'dry weight at 0'; bibkey.Wd0 = 'DevaAlex1987'; 
  comment.Wd0 = 'Fig 5 (Page 137) for an egg diameter of 1.4mm, 1000 eggs = 0.12g, experimental data with in situ genitors (assume f=f_Deniel)';
data.Wdh = 51.9; units.Wdh = 'micro g';   label.Wdh = 'dry weight at hatching'; bibkey.Wdh = 'Day1996'; 
    comment.Wdh = 'Fig.1: Wd=51.9*exp(0.143*dph) micro-g with dph=0';
data.Wdb = 91.96; units.Wdb = 'micro g';   label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'Day1996'; 
    comment.Wdb = 'Fig.1: Wd=51.9*exp(0.143*dph) micro-g with dph=4 for first feeding';
data.Wdj = 1.8;    units.Wdj = 'mg';   label.Wdj = 'dry weight at metamorphosis'; bibkey.Wdj = 'GaloLaga1990';
    comment.Wdj = 'Fig 1A: control at 12degC';
data.Wwp = 173;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for female'; bibkey.Wwp = {'Deni1981','MollKraa2007'};
    comment.Wwp = ['length-gonad-free weight relationship for female estimated from raw dataset from Deniel (R2=0.9927): Wwp_soma = 0.0041*Lp^3.2312',...
        'in accordance with 200g from MollKraa2007 (f ~0.6, T = 10 (North sea guestimates)'];
data.Wwp_m = 87;     units.Wwp_m = 'g';   label.Wwp_m = 'wet weight at puberty for male'; bibkey.Wwp_m = 'Deni1981';
    comment.Wwp_m = 'length-gonad-free weight relationship for male estimated from raw dataset from Deniel (R2=0.9944): Wwpm_soma = 0.004*Lp_m^3.2304';
data.Wwi = 1109.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'Deni1981';
    comment.Wwi = ['length-gonad-free weight relationship for female estimated from raw dataset from Deniel (R2=0.9927): Wwi_soma = 0.0041*Li^3.2312',...
        'Ultimate wet weight in fishbase is 3000g'];
data.Wwi_m = 701;    units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight for male';  bibkey.Wwi_m = 'Deni1981';
    comment.Wwi_m = 'length-gonad-free weight relationship for male estimated from raw dataset from Deniel (R2=0.9944): Wwi_soma = 0.004*Li_m^3.2304';

data.R45  = 1.1e6/365; units.R45  = '#/d'; label.R45  = 'reprod rate at 45 cm'; bibkey.R45  = 'WittGree1995';   
    temp.R45 = C2K(10); units.temp.R45 = 'K'; label.temp.R45 = 'temperature';
data.Ri = 3027;      units.Ri = '#/d';  label.Ri = 'maximum reprod rate per day';bibkey.Ri = 'Deni1981';
    temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Page 243 - daily fecundity = absolute annual fecundity/365 => (Wwi^1.171 * 160.437)/365 for an individual of ulimate weight Wwi';
data.E0 = 2;    units.E0 = 'J';   label.E0 = 'reserve energy in egg'; bibkey.E0 = 'DevaAlex1987'; 
  comment.E0 = 'mean of batches with 100% viability from wild fish: 13.3% of dry weight is total lipids (assume 37500 J.gd^-1) and 65.9% is crude proteins (assume 18000 J.gd^-1) => E0 = Wd0 * (0.133*37500 + 0.659*18000)';
 
data.pAmi = 800; units.pAmi = 'J.d^-1.cm^-2';   label.pAmi = 'max surf.area specific assimilation rate, {pAm}postj, at T_ref';
bibkey.pAmi = 'Fond1989'; temp.data.pAmi = C2K(20);
comment.pAmi =  ['approximated from mean daily food consumption of dry mussel meat as function of total wet weight, ',...
    'length-weight relationship, and energy density of mussel meat; assumed at T_ref'];  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% uni-variate data

%___________
% Temperature - Age at hatching
data.Tah = [10  13  16  19;    % incubation temperature (degC)
            6.5 4.5 3.5 2.75]';  % age at hatching (d, fertilisation to hatching)
units.Tah = {'degC', 'd'};     label.Tah = {'incubation temperature', 'age at hatching'};  bibkey.Tah = 'Fond1979';
comment.Tah = 'fertilized eggs from natural spawning';

%___________
% Temperature - Age at first feeding
data.Tab = [10  13  16  19;    % incubation temperature (degC)
            11  8   6   4.5]';  % age at first feeding (d; fertilisation to first feeding)
units.Tab = {'degC', 'd'};     label.Tab = {'rearing temperature', 'age at first feeding'};  bibkey.Tab = 'Fond1979';
comment.Tab = 'fertilized eggs from natural spawning';

%___________
% Temperature - Time between age at first feeding and age at metamorphosis
data.Ttbj = [13  16  18  22;    % incubation temperature (degC)
            28   20   19	14]';  % average time between age at first feeding and age at metamorphosis (d)
units.Ttbj = {'degC', 'd'};     label.Ttbj = {'rearing temperature', 'time between first feeding and metamorphosis'};  bibkey.Ttbj = 'Fond1979';
comment.Ttbj = 'from Fig1,Fig3 and text, estimation from larvae growth rates, estimation at 10degC not taken as no larvae reached metamorphosis at this temp';

%___________
% Age-length relationship for larvae
data.tLlarvae = [1 3 6 10 14 21;    % days after hatching (d)
                 3.2 3.7 4.2 4.8 6.1 8.8]';  % physical length (mm)
units.tLlarvae = {'d', 'mm'};     label.tLlarvae = {'time since hatching (larvae)', 'total physical length'};  bibkey.tLlarvae = 'Lund2008';
  temp.tLlarvae = C2K([11.2, 16.1, 19.1]); units.temp.tLlarvae = 'K'; label.temp.tLlarvae = 'temperature';
  comment.tLlarvae = 'laboratory experiment: T = 11.2degC for incubation (fecundation to hatching), T = 16.1 degC from hatching to birth, T = 19.1 degC from birth';
  
%___________
% Age-dry weight relationship for larvae
data.tWdlarvae = [2	3	4	5	6	8	9	16	24	35 ;    % time since hatching (d)
    exp(4.36)	exp(4.33)	exp(4.44)	exp(4.45)	exp(4.65)	exp(5.105)	exp(5.38)	exp(6.255)	exp(7.73333)	exp(8.82125)]';  % mean total dry weight (micro g)
units.tWdlarvae = {'d', 'micro g'};     label.tWdlarvae = {'time since hatching (larvae)', 'total dry weight'};  bibkey.tWdlarvae = 'Day1996';
  temp.tWdlarvae = C2K([12,15]); units.temp.tWdlarvae = 'K'; label.temp.tWdlarvae = 'temperature';
  comment.tWdlarvae = 'laboratory experiment: T = 12degC for incubation (fecundation to hatching), then T = 15degC, mean values';
  
%___________

%t-L from Fonds1979 , larvae growth at different temps, extracted by plot reader 
data.tL_Fond10 = [ % age (time since birth), total length, reared at 10C (no metamorphosis, died)
    0.238	3.997
    2.919	4.136
    8.276	4.384
    17.348	5.043
    21.027	5.565
    21.037	6.378
    28.777	5.919 % no metamorphosis
    ]; data.tL_Fond10(:,2) =  data.tL_Fond10(:,2)/10; % mm to cm
units.tL_Fond10   = {'d', 'cm'};  label.tL_Fond10 = {'time since birth', 'total length'};  
temp.tL_Fond10    = C2K(10);  units.temp.tL_Fond10 = 'K'; label.temp.tL_Fond10 = 'temperature';
bibkey.tL_Fond10 = 'Fonds1979';

data.tL_Fond13 = [% age (time since birth), total length, reared at 13C
    0.276	4.211
    3.585	4.388
    3.473	4.595
    8.531	5.163
    17.069	7.355
    21.210	7.554
    38.094	14.259 % metamorphosis at ~10mm TL
    37.667	15.261
    ]; data.tL_Fond13(:,2) =  data.tL_Fond13(:,2)/10; % mm to cm
units.tL_Fond13   = {'d', 'cm'};  label.tL_Fond13 = {'time since birth', 'total length'};  
temp.tL_Fond13    = C2K(13);  units.temp.tL_Fond13 = 'K'; label.temp.tL_Fond13 = 'temperature';
bibkey.tL_Fond13 = 'Fonds1979';

data.tL_Fond16 =[
    0.178	4.263
    3.169	4.629
    8.828	5.800
    17.485	7.646
    21.388	9.306 % metamorphosis at ~10mm TL
    21.350	11.491
    34.156	14.859
    33.704	18.305
    ]; data.tL_Fond16(:,2) =  data.tL_Fond16(:,2)/10; % mm to cm
units.tL_Fond16   = {'d', 'cm'};  label.tL_Fond16 = {'time since birth', 'total length'};  
temp.tL_Fond16    = C2K(16);  units.temp.tL_Fond16 = 'K'; label.temp.tL_Fond16 = 'temperature';
bibkey.tL_Fond16 = 'Fonds1979';

data.tL_Fond19 =[
    0.088	4.168
    3.053	4.693
    8.956	6.926
    8.934	7.867
    19.999	9.891 % metamorphosis at ~10mm TL
    20.263	10.823
    19.977	11.137
    17.056	13.016
    28.951	17.326
    35.517	24.309
    ]; data.tL_Fond19(:,2) =  data.tL_Fond19(:,2)/10; % mm to cm
units.tL_Fond19   = {'d', 'cm'};  label.tL_Fond19 = {'time since birth', 'total length'};  
temp.tL_Fond19    = C2K(19);  units.temp.tL_Fond19 = 'K'; label.temp.tL_Fond19 = 'temperature';
bibkey.tL_Fond19 = 'Fonds1979';

data.tL_Fond22 = [
    0.201	4.706
    6.010	5.430
    15.301	10.620 % metamorphosis at 9mm TL
    19.572	14.608
    20.231	14.608
    27.272	16.133
    ]; data.tL_Fond22(:,2) =  data.tL_Fond22(:,2)/10; % mm to cm
units.tL_Fond22   = {'d', 'cm'};  label.tL_Fond22 = {'time since birth', 'total length'};  
temp.tL_Fond22    = C2K(22);  units.temp.tL_Fond22 = 'K'; label.temp.tL_Fond22 = 'temperature';
bibkey.tL_Fond22 = 'Fonds1979';


% t-L data from otolith back-calculation data for females!(IMARES data)
data.tL_Teal = [ ... % time since birth (a), length (cm)
1	8.909404598
2	19.91239656
3	26.95918876
4	31.44085313
5	34.39816096
6	36.2481578
7	37.61539273
8	38.32918647
9	39.16698018
10	39.22343839
11	39.87342987
12	40.96987132
13	42.20480305
14	42.43587572
15	44.03172643];
data.tL_Teal(:,1) = 365 * data.tL_Teal(:,1); % covert a to d
units.tL_Teal   = {'d', 'cm'};  label.tL_Teal = {'time since birth', 'total length'};  
temp.tL_Teal    = C2K(10);  units.temp.tL_Teal = 'K'; label.temp.tL = 'temperature';
bibkey.tL_Teal = 'Teal2011';
%___________
%  Age-Length relationship for juvenile and adult females
data.tL = [0.65420561	0.65420561	0.69781931	0.69781931	0.69781931	0.74143302	1.482866	1.5264798	1.5700935	1.6137072	1.6573209	1.9626168	2.1370717	2.1370717	2.2242991	2.2242991	2.2242991	2.2242991	2.2679128	2.3115265	2.3115265	2.3115265	2.3115265	2.3551402	2.3551402	2.3987539	2.3987539	2.4423676	2.4423676	2.4423676	2.4423676	2.529595	2.529595	2.529595	2.5732087	2.5732087	2.6168224	2.6168224	2.7040498	2.7040498	2.7476636	2.7912773	2.7912773	2.834891	2.834891	2.9221184	3.0529595	3.0965732	3.1401869	3.1401869	3.1401869	3.1838006	3.1838006	3.1838006	3.1838006	3.2274143	3.2274143	3.271028	3.271028	3.271028	3.271028	3.3146417	3.3582555	3.3582555	3.4018692	3.4018692	3.4454829	3.5327103	3.5327103	3.576324	3.6635514	3.7507788	3.7943925	3.8380062	3.8380062	3.8380062 3.8816199	3.9688474	4.0124611	4.0124611	4.0560748	4.0560748	4.0996885	4.0996885	4.1433022	4.2305296	4.2741433	4.2741433	4.3613707	4.3613707	4.3613707	4.3613707	4.4049844	4.4049844	4.4049844	4.4485981	4.4922118	4.623053	4.6666667	4.6666667	4.7975078	4.7975078	4.8847352	4.8847352	4.8847352	4.9283489	4.9283489	4.9283489	4.9719626	5.0155763	5.0155763	5.05919	5.1464174	5.1464174	5.1464174	5.2336449	5.2336449	5.2336449	5.2772586	5.2772586	5.3208723	5.4080997	5.4953271	5.4953271	5.4953271	5.5389408	5.6261682	5.6697819	5.7133956	5.8878505	5.9314642	5.9314642	5.9314642	5.9750779	5.9750779	5.9750779	6.0186916	6.0186916	6.0186916	6.1931464	6.1931464	6.3239875	6.3239875	6.3239875	6.3676012	6.411215	6.4548287	6.4984424	6.4984424	6.4984424	6.4984424	6.5856698	6.6292835	6.7165109	6.7601246	6.8037383	6.8037383	6.8909657	6.8909657	6.8909657	6.9345794	6.9345794	6.9345794	6.9781931	6.9781931	6.9781931	7.0218069	7.0218069	7.0218069	7.0218069	7.0218069	7.0654206	7.1090343	7.152648	7.1962617	7.2398754	7.2398754	7.3271028	7.3271028	7.3271028	7.4143302	7.5015576	7.6323988	7.6323988	7.6760125	7.6760125	7.8504673	7.8504673	7.8504673	7.894081	7.894081	7.894081	7.894081	7.9376947	7.9813084	8.0249221	8.0249221	8.0249221	8.0249221	8.1121495	8.1121495	8.1121495	8.5482866	8.635514	8.7227414	8.7663551	8.8099688	8.8971963	8.8971963	8.94081	8.94081	9.0280374	9.1588785	9.2024922	9.2024922	9.2461059	9.2461059	9.3333333	9.376947	9.4641745	9.4641745	9.5077882	9.6386293	9.7258567	9.7694704	9.8566978	10.074766	10.161994	10.336449	10.336449	10.598131	10.641745	10.641745	10.94704	10.990654	11.034268	11.077882	11.165109	11.252336	11.29595	11.426791	11.470405	11.557632	11.64486	11.688474	11.862928	11.862928	11.906542	12.168224	12.429907	12.560748	12.866044	12.953271	12.953271	12.996885	13.476636	13.520249	13.520249	13.563863	13.563863	13.607477	14	14.82866	15.046729	15.046729	15.439252	15.570093	15.744548	15.875389	16.267913	16.616822	17.227414	17.576324	18.579439	19.495327	20.193146	21.327103	21.632399	21.894081	26.47352;    % time since fecundation (y)
4.5632653	6.5795918	5.6244898	7.5346939	8.4897959	11.673469	15.493878	23.453061	22.497959	20.481633	21.436735	24.514286	20.481633	22.497959	23.453061	24.514286	25.469388	26.530612	27.379592	19.420408	21.436735	22.497959	28.440816	20.481633	29.502041	23.453061	24.514286	22.497959	25.469388	26.530612	27.379592	21.436735	28.440816	29.502041	24.408163	30.457143	23.453061	27.379592	25.469388	31.518367	22.497959	28.440816	32.473469	26.42449	27.379592	24.408163	31.412245	25.469388	23.453061	28.440816	32.473469	25.469388	26.42449	27.379592	35.55102	30.563265	31.412245	21.436735	28.440816	33.428571	34.489796	36.4	32.473469	35.55102	33.322449	34.383673	37.461224	30.563265	39.477551	32.473469	40.432653	30.563265	34.383673	33.428571	35.444898	36.506122   32.367347	40.326531	33.428571	38.522449	30.457143	35.444898	26.42449	34.383673	36.506122	40.220408	33.428571	38.310204	30.457143	32.473469	36.4	39.477551	27.379592	31.412245	37.461224	42.342857	41.281633	37.461224	39.371429	38.416327	34.383673	38.416327	31.412245	33.428571	35.444898	34.383673	37.461224	41.493878	40.326531	36.4	38.416327	37.355102	33.428571	41.493878	42.342857	36.4	38.416327	39.371429	44.146939	45.420408	37.355102	41.387755	42.44898	43.404082	46.269388	40.326531	45.314286	38.416327	39.371429	42.555102	36.4	39.371429	44.359184	38.522449	40.326531	45.314286	37.24898	41.493878	43.404082	39.371429	42.236735	38.310204	39.371429	43.404082	42.44898	44.359184	35.444898	37.355102	39.371429	43.404082	46.37551	44.359184	40.326531	43.404082	37.355102	42.342857	48.179592	35.444898	37.355102	40.326531	36.4	42.342857	47.22449	41.387755	44.359184	45.314286	39.477551	43.404082	49.346939	48.391837	46.269388	38.416327	40.326531	45.314286	43.404082	39.265306	42.342857	41.387755	47.22449	45.314286	36.4	46.269388	45.314286	44.465306	38.416327	41.281633	42.342857	43.404082	45.420408	34.489796	38.310204	39.265306	44.359184	37.355102	49.134694	41.281633	42.342857	43.297959	47.22449	39.265306	46.37551	44.359184	46.269388	47.330612	44.359184	45.314286	47.330612	43.297959	48.391837	42.342857	44.359184	45.314286	44.359184	40.220408	42.236735	43.297959	48.285714	42.236735	45.314286	46.269388	49.240816	44.359184	47.330612	44.359184	49.240816	38.204082	46.37551	43.297959	47.330612	45.314286	45.314286	42.236735	48.073469	48.073469	49.240816	51.257143	44.359184	47.22449	45.420408	50.302041	43.297959	46.269388	49.240816	46.269388	38.310204	44.359184	43.191837	45.208163	50.195918	49.134694	50.195918	51.257143	49.240816	46.269388	47.22449	43.404082	41.281633	45.314286	46.163265	47.22449	44.359184	48.179592	46.269388	41.281633	51.044898	48.285714	49.134694	48.285714	51.363265	51.363265	50.302041	50.302041	49.134694	50.408163	48.391837	50.195918	48.285714	47.22449	47.330612	48.285714]';  % physical length at f and T
  tL_large = [15	53.5;
              22	53.5;
              14.5	55.5;
              18	56.5;
              16	59.5;
              18.5	59.5];
data.tL = [data.tL; tL_large]; % added from raw datasets (large individuals were mentionned in the text but were missing from the points in his graph)
units.tL = {'y', 'cm'};     label.tL = {'time since fertilization', 'total length', 'female'};  bibkey.tL = 'Deni1981';
  temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'female values (histological observations of gonads), age from otolith measurments';

%___________
%  Age-Length relationship for juvenile and adult males
data.tL_m = [0.50731707	0.50731707	0.58536585	0.62439024	0.66341463	0.66341463	0.70243902	0.70243902	0.70243902	0.74146341	1.3658537	1.404878	1.4829268	1.5219512	1.5609756	1.6	1.8341463	1.9902439	2.0682927	2.0682927	2.0682927	2.1073171	2.1073171	2.1463415	2.1853659	2.2243902	2.302439	2.302439	2.3414634	2.3414634	2.3414634	2.4195122	2.4195122	2.497561	2.497561	2.497561	2.5365854	2.5756098	2.6146341	2.6146341	2.6146341	2.6146341	2.6536585	2.6536585	2.7707317	2.7707317	2.8097561	2.8097561	2.8097561	2.8487805	2.8878049	2.9268293	3.004878	3.004878	3.004878	3.1219512	3.1609756	3.1609756	3.2	3.2	3.2390244	3.2780488	3.3170732	3.3170732	3.3170732	3.3560976	3.395122	3.4341463	3.4341463	3.5121951	3.5121951	3.5121951	3.5902439	3.6292683	3.6292683	3.6682927	3.7073171	3.7463415	3.8243902	3.8243902	3.8634146	3.902439	3.902439	3.9414634	3.9414634	3.9804878	3.9804878	4.0195122	4.0195122	4.0585366	4.097561	4.1365854	4.2146341	4.2536585	4.2926829	4.2926829	4.2926829	4.2926829	4.3317073	4.3317073	4.4097561	4.4487805	4.5268293	4.6439024	4.6439024	4.6439024	4.7219512	4.8	4.8	4.8390244	4.8780488	4.8780488	4.9170732	4.995122	4.995122	4.995122	5.0341463	5.0341463	5.0341463	5.0731707	5.1121951	5.1902439	5.1902439	5.1902439	5.1902439	5.2292683	5.3073171	5.3073171	5.3073171	5.3463415	5.4243902	5.4243902	5.502439	5.502439	5.502439	5.5804878	5.6585366	5.8536585	5.8536585	5.8536585	5.8926829	5.9707317	6.0097561	6.0097561	6.0487805	6.0487805	6.3219512	6.3219512	6.3219512	6.3609756	6.6341463	6.6341463	6.7902439	6.7902439	6.8292683	6.8292683	6.9463415	6.9463415	6.9463415	6.9853659	7.0243902	7.297561	7.297561	7.297561	7.3365854	7.3756098	7.4146341	7.4536585	7.804878	7.8439024	7.8439024	7.9219512	7.9609756	8.1170732	8.2341463	8.3512195	8.3902439	8.4292683	8.4292683	8.8195122	9.1317073	9.4439024	9.4439024	9.5219512	9.8341463	10.029268	10.029268	10.497561	10.614634	10.692683	10.965854	11.278049	11.395122	11.746341	11.82439	12.097561	12.214634	12.487805	12.604878	12.682927	12.956098	13.112195	14.243902	15.336585	16.429268	17.6	18.770732	19.707317	20.253659	21.15122	22.556098; % time since fecundation (y)
          5.71875	8.8125	6.75	7.6875	4.78125	8.8125	5.8125	6.84375	11.90625	7.78125	17.90625	17.4375	21.00	22.96875	21.00	22.03125	22.96875	26.0625	22.03125	23.0625	24.00	25.03125	27.09375	26.0625	28.03125	24.00	21.09375	27.09375	23.0625	26.0625	28.03125	30.00	33.09375	25.03125	28.03125	29.0625	24.00	27.09375	22.03125	23.0625	26.0625	29.0625	28.03125	31.03125	26.0625	28.03125	25.03125	30.00	36.09375	31.03125	35.0625	30.00	24.00	30.00	31.03125	32.0625	28.03125	34.125	23.0625	30.00	28.96875	34.125	27.00	35.0625	36.09375	33.09375	32.0625	28.96875	31.125	27.00	32.0625	35.0625	28.03125	31.125	36.09375	33.09375	28.96875	34.125	28.96875	30.00	35.0625	33.09375	40.03125	32.0625	34.125	35.0625	38.0625	32.0625	37.125	31.125	36.09375	33.09375	40.125	37.125	33.09375	34.125	35.0625	36.09375	30.09375	38.0625	34.125	32.0625	33.09375	34.125	36.09375	37.125	33.09375	27.9375	38.0625	31.96875	35.0625	39.09375	31.96875	33.09375	38.0625	41.15625	37.125	39.09375	40.125	38.0625	36.09375	33.09375	34.125	35.0625	41.0625	37.125	33.09375	34.125	34.96875	39.09375	31.03125	36.09375	36.09375	38.0625	40.03125	37.125	33.00	34.125	37.125	38.0625	40.03125	42.09375	36.09375	39.09375	38.0625	41.0625	38.0625	40.03125	43.125	35.15625	39.09375	41.15625	38.0625	41.15625	36.09375	37.125	37.03125	38.0625	41.15625	31.96875	40.03125	39.09375	41.0625	42.09375	38.0625	40.03125	42.09375	39.09375	38.0625	34.96875	39.09375	40.125	40.96875	40.125	41.0625	42.09375	43.03125	39.00	41.0625	40.125	40.96875	39.00	40.96875	39.00	42.00	39.00	40.03125	46.125	40.03125	39.00	42.84375	44.0625	43.03125	43.03125	44.0625	42.09375	47.15625	42.09375	40.96875	47.15625	42.84375	47.15625	42.00	44.0625	42.00	40.96875	44.0625	47.0625	45.00	43.875	46.96875]';  % physical length at f and T
units.tL_m = {'y', 'cm'};     label.tL_m = {'time since fertilization', 'total length', 'male'};  bibkey.tL_m = 'Deni1980';
  temp.tL_m = C2K(13); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
  comment.tL = 'male values (histological observations of gonads), age from otolith measurments';

%___________
%  Length-gonad-free et weight for adult females
data.LWw = [7.1	4.9	3.2	3.9	6.2	5	4.2	9.1	7.3	10	23.3	9.7	8.5	9.3	8.9	48.7	44.7	38	37.5	36	45.5	42.5	45	43	39.5	36	37	41	42	49	50	44	37.5	35.5	36.2	43.2	59	44.7	40.5	40.2	42.5	50	44	48	45	41	43.5	40	45.4	42	49.5	44	38.5	43	45	40.5	44	33.5	44	43.7	42	39	43	45.5	38.8	21	47	47	41	40.2	45	39.5	49.6	34.5	29	26	42.4	34.5	37.8	34.5	46.5	39	25	36.1	42.5	39.2	43.5	43.5	48.2	46	42.1	39.6	42.3	42.7	42	32.5	29.5	23.7	22.7	26.3	24.3	42.3	39	39.5	33.5	37.5	36.5	36.5	39.2	28.6	45	42	37	35.8	27.3	35.2	43.8	30.7	41.5	28.5	25.7	34.5	44.5	38.8	31.2	47	41.5	31.5	30.5	29	28.5	34	31.5	29	32.5	35.5	30.5	49	41	31	22	32.2	33.7	39	22	33.5	36.5	45	56	42	33	25	22	46.5	43	38	42.5	32	25	42	20.5	36.5	33	34.5	38	33	49.5	33	27	41.5	32.5	39	39.5	32	51.5	37	38	23	34	33.5	38	29.5	47.7	29.5	37	24	35.5	35	40	39.5	44	39	29.5	46	45	48.5	43	50	46.5	55	21.4	20.5	25.5	22.5	24.2	22.5	24.5	23	24.7	22.5	29.1	23.1	43	42.5	37	38.5	32	45.5	39.5	29	21	21	21.7	40.5	27	26	45.5	48.5	43	35 43	35	40.5	40	36	39.5	39.5	48.5	26.5	24.5	42.5	47	39.5	45.5	48	38.5	32	22.5	41	25.5	30	26.5	24	20	31.5	22.5	22	25.5	23	24.5	27	26	25	40.5	23	29.5	25.5	37	26.5	27	31	28	36.5	32.5	45	43.5	36	29.5	38.5	28	25	23.5	45	25	37.5	23.5	51.5	23.5	25	24	38.5	25	39	23.5	32	26	25.5	25	21.5	26	24.5	26.5	42.5	38.5	51.5	40.5	36.5	42.5	39.5	24.5	27	24.5	25	25	26	23.5	20.5	25.5	21.5	25.5	26	47.5	38.5	37.5	28.5	25	42.5	39.5	41.5	23	22	27	35	39	25	36	29	48	47	42	32.5	46	43	41	41.5	45.5	37	51.5	45.5	39.5	42.5	45.5	44.5	43.5	46	28.5	41.5	30	30	50.5	45	40	39	25.5	45.5	32	38	47	38	48.5	32	30	41.5	27	40.5	32.5	27	49	37.5	35	34	33.5	37.5	32	28	28.5	37.5	43	40	24	35	33	39	47.5	40	48.5	33.5	25.5	19	27	35.5	27	22	21	44	53.5	46	48	41	37	43.5	36.5	28.5	44	29.5	43	38.5	45	45	44	44	19.5	46	37	44	37	32	28.5	31	33.5	24	15	31	29.5	40	36	32	33.5	29.5	42	49	33.5	36.5	26	31	27	40	36	37.5	32.5	32	38	37	47	43.5	48	43.5	36	35	37	50	44.5	40.5	37	33	38.5	40	35	42	36	29	35	39.5	36	42.5	47	51	45	36	34.5    34.5	37.5	23	35	31.5	36	35.5	41	29.5	50	44	30	25.5	41	48.5	37	37.5	44	35	39	44	41.5	34.5	38	38	39.5	38	38.5	37.5	42	46.5	35.5	49	47	53.8	36	44	38.5	47.5	35	43	46	44.5	47	38.5	37	8.5	9.4	10.8	8.5	8.6	11.2	8.9	8.7	7.9	11.9	6.8	40	23.5	23.5	42	39	38	42.5;
    2	0.5	0.15	0.25	1	0.5	0.55	4.8	2.9	5.5	100	6.1	5.4	5.1	4.6	1069	746.8	481.8	414.6	435.7	1005.7	708.4	908.1	866.5	598.9	442.9	487.6	647.5	820.3	1179.7	1181.9	903.8	508.5	406.4	371.1	712.7	1679	900.1	594	598.4	788.4	1117.6	869.3	967.8	775.6	677.6	750.4	576.7	791.4	766.8	1184.5	777.8	538.6	811.5	1016.9	585	865.9	378.2	900.6	846	738.8	528.7	785.4	782.2	466.1	77.3	944.5	930.6	614.9	665.45	950.75	552.3	1242.1	349.9	216.9	131.28	634.35	340.9	457.5	372.9	1140.7	573.45	159.7	481.5	658.2	494.6	750.5	732.2	1109.4	783.1	726.3	582.7	693.45	709.8	660.42	338.5	236.82	99.5	101.219	168.365	118.42	648.88	538.35	606.9	356.22	518.75	497.92	391.5	644	191.5	922	707.5	316.5	440.5	174.1	446	803.5	254.5	627.5	189.5	142.7	388	823	347	233	777.9	587.4	277.8	258.25	209	223.85	382.2	303.1	225	312.8	391.4	281.7	1002	676	288	90	297.8	355.9	542	85	324.7	431.6	928	1466	645	337	139	65	881	705	495	684	312.2	134	685.7	58	384	393.2	382	554.5	329.6	1289	324.5	181.4	666	334.4	524	635.9	298.5	1363.9	476.1	514.5	175	357.9	351.4	490.5	250	1085	330.5	466.3	120	461.8	360.1	689	630	830	570.7	200	952	839	1313	837	1617	1030	1244	85	70	138	93	120	107	127	108	155	127	250	106	822	618	518	590	412	913	511	235	85	80.9	95.7	725.3	191.4	139.6	1120.3	1298.5	812.1	377.9 812.1	377.9	715.5	641.7	487.8	599.1	583.8	1307.8	171.2	135	863	960	555	1083	1273	700	304	95	553.2	139.4	268.7	175	118	70	286.4	95	95	139.8	105	128	186.1	144	145	646.5	103	227	130	514	175	169	285	189	471	347	753	805	445.5	213.6	560	170	125	95	863	135	490	116	1145	112	131	129	505	140	532.5	119	282	144	140	131	73	144	121	144	678	568	1183	663	423	707	609	151	180	133	143	128	146	110	70	141	116	136	131	955	584	462	204	123	720	557	752	97	85	170	409.4	599	112	499.7	194	998.1	1056.4	853	358	830.5	857	702	645	929	415.5	1302	915	572	479	806	893	645	1030	235	690	240	234	1225	901	651	570	135	1079	310	606	1003	533	839.6	258.2	248.1	780	145.4	730	300	178	1110	560	420	400	300	540	320	200	202.9	606.2	888.3	561.4	112.5	413	373	592	1097	607	1106	388	160	50	152	472	170	85	70	692	1435	973	1186	781	559	825	473	191	858	234	752	473	870	869	824	834	50	1135	513	841	457	290	180	255	335	110	24	265	220	570	375	255	350	240	663	1214	345	445	150	255	165	630	400	485	280	285	510	525	962	535	1051	826	457	441	497	1182	1001	702	437	335	590	657	280	753	480	228.7	445	640	500	740	990	1138	966	427	375 360	474	90	380	265	377.2	400	593	235	1215	844	235	140	893.5	1169	517.3	592.4	850.2	402.7	648.3	971	796.8	426	564.5	505.5	697.9	583.7	647.1	434.3	696.3	1163.5	503.6	1192.6	982.4	1470.9	460	874.5	502.1	1063.6	437.4	756	726.6	990.8	926.1	491.5	568.7	4.2	5.9	9.5	4.2	4.5	10.5	5.2	5	3.6	13.2	2.5	692	118	105	651	599	488	801]';
units.LWw = {'cm', 'g'};     label.LWw = {'total physical length for female', 'gonad-free wet weight', 'female'};  bibkey.LWw = 'Deni1981';
 temp.LWw = C2K(13); units.temp.LWw = 'K'; label.temp.LWw = 'temperature'; comment.LWw = 'gonad-free wet weights from raw data provided by Ifremer';

%___________
%  Length-gonad-free et weight for adult males
data.LWw_m = [7.1	4.9	3.2	3.9	6.2	5	4.2	9.1	7.3	10	23.3	9.7	8.5	9.3	8.9	31.5	34.5	32.5	36	39	31.2	41	34.4	40.2	39.2	46.5	40.5	40	36	39	36	38.5	41.5	31	43	37	34	40.3	40.2	32.9	30	32.4	46.4	40.7	35.8	26	40.1	41.5	38	24.5	24	22.5	25.5	39.8	32.5	33	31.7	37.8	28.4	29.3	32	29.8	28.5	36.6	25.5	34.5	31.5	36.5	31.5	27.5	21	29.5	36	28	34.5	34	33.5	33	36.5	29.5	37.5	26.5	28.5	26.5	32.5	32.5	31	38	39.5	42.5	33	40	38.5	49.5	22	34	22	26.8	23.8	24.8	20.5	22.5	20	35.5	27	40	38	38.5	35	21.5	21	21	24	34	32.5	37.5	29	29	27	27	22.5	39	37	25.5	25	33	30.5	29.5	23	25.5    23	25.5	29	25.5	23	39	27	26	25.5	25.5	40	24.5	42	26	20	30.5	35	22.5	29.5	39.5	34	27	27	23.5	32	25	24	26	22.5	25.5	24.5	26	23.5	24.5	25	41.5	33.5	24	26	24.5	24	23.5	24	24	24.5	25.5	37.5	28.5	25	24	47	40	27	34	24	39	41.5	34	33.5	40	42.5	41	28	28	40	28.5	46.5	45.5	27.5	38.5	35.5	33.5	32	39	38	40.5	30.5	40	28.5	36.5	35.5	26	36.5	46	28	27.5	38.5	35.5	42.5	32.5	27	35.5	31.5	27	46.5	48	32	28	26.5	33.5	32.5	25	36	29	30	28	35	43	25.5	25	32	42.5	32	33.5	48.5	34.5	43.5	44	31.5	29.5	40	29.5	33	33.5	29	41.5	29	35	17	36.5	28	37.5	38	28.5	27	38	38	41	32.5	30	30	40	27.5	20	33.5	42	38.5	30	35	30	27	38.5	26	37.5	37.5	48	43.5	37	39	37.5	36	11.8	8.6	9.3	11	8.4	8.4	8.8	23.5	26.5	38	40	29	33.5;
    2	0.5	0.15	0.25	1	0.5	0.55	4.8	2.9	5.5	100	6.1	5.4	5.1	4.6	272.88	258.6	304.55	379.3	494.2	264.65	619.1	355.7	568.1	556.1	869.1	619.1	560.9	386.45	585.95	427.4	511.45	692.4	249.8	735.83	489.8	349.6	565.22	623.15	320.55	225.81	314.8	925.46	613.6	388.72	137.944	583.48	592.4	484.31	122.45	127.971	113.976	146.918	631.6	293.8	295	275	500	200	203	299	188	208	488	154	409.73	262.2	459.7	256.68	174.8	69.98	234.9	359.72	170	354.9	314.9	309.7	298	378.8	239.9	509.8	156	220	158	304.8	329.9	253	607.7	517.8	712.4	363	589.6	586.5	1084.4	102	460	95	195	139	140	80	100	74	409.7	204	685.6	509.5	536.6	436.8	80.5	88.9	77.1	110	403.5	304.7	511.7	264.73	214.86	172.91	162.82	85	543	487	140	138	327.7	260	237	110	145 110	145	203	151	110	510	165	163	148	159	590	136	645	147	61	258	380	103	217	525	400	160	170	110	291	122	102	147	101	146	129	158	90	115	128	630	300	125	163	123	108	111	126	113	131	140	502	201	142	110	962	587	168	368	136	568	649.7	384.8	414.9	647.5	693.6	619.8	278	227	595	160	1259.5	865.7	165.9	561.8	437.7	309.8	330	635	505	510	290	640	210	435	460	143	460	936	179.9	190	519.6	409.7	759.2	299.8	155.9	409.7	321.8	173.9	999.3	1119.1	314.7	185.9	163.9	349.8	299.9	126	400	220	240	180	310	883.7	136.9	134.9	280	780	328	343	680	360	755	928	298	250	633	226	380	345	250	650	215	380	37	430	175	480	500	210	175	500	500	610	285	240	240	614.4	190	70	365	735	520	210	390	240	145	565	160	539.3	496.7	875.7	745	485.5	544.2	491.3	460	12.1	4.8	6	11.3	4.4	4.5	5.2	102	165	540	540	200	340]';  % physical length at f and T
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'total physical length for male', 'gonad-free wet weight', 'male'};  bibkey.LWw_m = 'Deni1981';
  temp.LWw_m = C2K(13); units.temp.LWw_m = 'K'; label.temp.LWw_m = 'temperature'; comment.LWw_m = 'gonad-free wet weights from raw data provided by Ifremer';

%___________
% Length - annual egg production
data.LN = [34.5	35	35.5	37	37.5	37.5	38	38	38	38.5	39	39.5	41	41.5	42	44	44	46.5	47	48.5	49	53.8;    % total physical length (cm)
134557	218920	222000	302412	181037	359512	248761	289372	387073	292250	536423	435944	557593	322081	378955	582348	472630	725325	506779	591855	813061	897092]';  % annual egg production (#/year)
units.LN = {'cm', '# y-1'};     label.LN = {'total physical length','annual egg production'};  bibkey.LN = 'Deni1981';
  temp.LN = C2K(13);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; comment.LN = 'Table 64 page 242, histological estimations, determinate fecundity';

% data from WittGree1995 for the Southern Bigth (NS)
%  assume f ~0.6, T = 273 + 10 K (North sea guestimates)
data.LN_Witt = [... % Length (cm) vs fecundity (annual egg prod) 
25	100000
30	200000
35	400000
40	700000
45	1100000];
units.LN_Witt   = {'cm', '#'};  label.LN_Witt = {'total length', 'fecundity'};  
temp.LN_Witt    = C2K(10);  units.temp.LN_Witt = 'K'; label.temp.LN_Witt = 'temperature';
bibkey.LN_Witt = 'WittGree1995';
    
%___________
% Length - ingestion rate at 10degC
data.LJX_T10 = [6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;    % physical length (cm)
0.062	0.097	0.142	0.198	0.268	0.352	0.452	0.568	0.701	0.854	1.027	1.221	1.437	1.677	1.941	2.231	2.548	2.893	3.266	3.669	4.104	4.571	5.070	5.604	6.174]';  % ingestion rate (g wet of food.d^-1.ind^-1)
units.LJX_T10 = {'cm', 'g ww.d-1'};     label.LJX_T10 = {'total physical length', 'ingestion rate', '10 C'};  bibkey.LJX_T10 = 'Fond1977';
 temp.LJX_T10 = C2K(10);  units.temp.LJX_T10 = 'K'; label.temp.LJX_T10 = 'temperature'; comment.LJX_T10 = 'laboratory experiment, food = mussel meat, energy density of mussels = 18750 J.gdry^-1 (Fond1989), water content of mussels estimated 80%';

% Length - ingestion rate at 14degC
data.LJX_T14 = [6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;    % physical length (cm)
0.126	0.186	0.261	0.352	0.461	0.587	0.733	0.898	1.084	1.292	1.523	1.777	2.055	2.357	2.686	3.041	3.423	3.832	4.27	4.737	5.234	5.761	6.32	6.91	7.532]';  % ingestion rate (g wet of food.d^-1.ind^-1)
units.LJX_T14 = {'cm', 'g ww.d-1'};     label.LJX_T14 = {'total physical length', 'ingestion rate' , '14 C'};  bibkey.LJX_T14 = 'Fond1977';
  temp.LJX_T14 = C2K(14); units.temp.LJX_T14 = 'K'; label.temp.LJX_T14 = 'temperature';comment.LJX_T14 = 'laboratory experiment, food = mussel meat, energy density of mussels = 18750 J.gdry^-1 (Fond1989), water content of mussels estimated 80%';

% Length - ingestion rate at 18degC
data.LJX_T18 = [6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;    % physical length (cm)
0.263	0.366	0.487	0.627	0.785	0.963	1.161	1.378	1.615	1.872	2.15	2.448	2.768	3.107	3.469	3.851	4.255	4.68	5.127	5.595	6.086	6.599	7.134	7.691	8.27]';  % ingestion rate (g wet of food.d^-1.ind^-1)
units.LJX_T18 = {'cm', 'gw.d-1'};     label.LJX_T18 = {'total physical length', 'ingestion rate', '18 C' };  bibkey.LJX_T18 = 'Fond1977';
  temp.LJX_T18 =C2K(18); units.temp.LJX_T18 = 'K'; label.temp.LJX_T18 = 'temperature'; comment.LJX_T18 = 'laboratory experiment, food = mussel meat, energy density of mussels = 18750 J.gdry^-1 (Fond1989), water content of mussels estimated 80%';

% Length - ingestion rate at 22degC
data.LJX_T22 = [6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29	30;    % physical length (cm)
0.468	0.617	0.785	0.97	1.172	1.391	1.626	1.878	2.145	2.428	2.727	3.041	3.37	3.713	4.072	4.445	4.833	5.234	5.65	6.08	6.524	6.982	7.454	7.939	8.438]';  % ingestion rate (g wet of food.d^-1.ind^-1)
units.LJX_T22 = {'cm', 'g ww.d-1'};     label.LJX_T22 = {'total physical length', 'ingestion rate',  '22 C'};  bibkey.LJX_T22 = 'Fond1977';
 temp.LJX_T22 =C2K(22); units.temp.LJX_T22 = 'K'; label.temp.LJX_T22 = 'temperature'; comment.LJX_T22 = 'laboratory experiment, food = mussel meat, energy density of mussels = 18750 J.gdry^-1 (Fond1989), water content of mussels estimated 80%';
 
% Length - ingestion rate at 26degC
data.LJX_T26 = [10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25;    % physical length (cm)
1.531	1.711	1.895	2.081	2.269	2.46	2.653	2.848	3.045	3.244	3.445	3.647	3.851	4.057	4.264	4.472]';  % ingestion rate (g wet of food.d^-1.ind^-1)
units.LJX_T26 = {'cm', 'g ww.d-1'};     label.LJX_T26 = {'total physical length', 'ingestion rate', '26 C'};  bibkey.LJX_T26 = 'Fond1977';
 temp.LJX_T26 = C2K(26); units.temp.LJX_T26 = 'K'; label.temp.LJX_T26 = 'temperature'; comment.LJX_T26 = 'laboratory experiment, food = mussel meat, energy density of mussels = 18750 J.gdry^-1 (Fond1989), water content of mussels estimated 80%';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set weights for all real data

weights = setweights(data, []);

%% overwriting weights

% to force higher ingestion
weights.pAmi = weights.pAmi *10;   

% two independent sources giving the same data for E0
weights.E0 = weights.E0 * 10;

% Ultimate length for male may be more accurate than female for an exploited fish
weights.Li_m = weights.Li_m * 5;

% Ri data is constructed from weight-fecundity relationship thus if predicted Wi is far from Wi in data, used to estimate Ri data, a fit to Ri data will be poorly informative
weights.Ri = weights.Ri /10;

% Favour growth relationships compared to zero-variate data
weights.tL_Fond10 = weights.tL_Fond10 * 10; weights.tL_Fond13 = weights.tL_Fond13 * 10;
weights.tL_Fond16 = weights.tL_Fond16 * 10; weights.tL_Fond19 = weights.tL_Fond19 * 10;
weights.tL_Fond22 = weights.tL_Fond22 * 10;
weights.tL_m = weights.tL_m * 15;
weights.tL( data.tL(:,1) >=12 ) = weights.tL( data.tL(:,1) >=12 ) / 2; % we neglect the old ones
weights.tL_m(data.tL_m(:,1)>=12) = weights.tL_m(data.tL_m(:,1)>=12)/ 2; % we neglect the old ones
weights.LWw = weights.LWw * 10;
weights.LWw_m = weights.LWw_m * 10;

% Estimation method overestimate annual egg production for fast growing fish (i.e., length<40cm)
weights.LN( data.LN(:,1) <40 ) = weights.LN( data.LN(:,1) <40 ) / 2; % we neglect the small ones
weights.LN = weights.LN*20;

% TA estimation for the best fit at most common temperature in the Gironde estuary - France (10-20degC)
weights.LJX_T10 = weights.LJX_T10 *2;
weights.LJX_T14 = weights.LJX_T14 * 2;
weights.LJX_T18 = weights.LJX_T18 * 2; 
weights.LJX_T22 = weights.LJX_T22;
weights.LJX_T26 = weights.LJX_T26/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set pseudodata and respective weights

[data, units, label, weights] = addpseudodata(data, units, label, weights);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% pack auxData and txtData for output

auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
  txtData.comment = comment;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Group plots

set1 = {'tL','tL_m'}; subtitle1 = {'Data for female, male'};
set2 = {'LWw','LWw_m'}; subtitle2 = {'Data for female, male'};
set3 = {'tL_Fond22','tL_Fond19','tL_Fond16','tL_Fond13','tL_Fond10'}; subtitle3 = {'Larvae growth at 22degC, 19degC, 16degC, 13degC, 10degC'};
set4 = {'LJX_T26','LJX_T22','LJX_T18','LJX_T14','LJX_T10'}; subtitle4 = {'Ingestion at 26degC, 22degC, 18degC, 14degC, 10degC'};
metaData.grp.sets = {set1, set2, set3, set4};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Facts

F1 = 'In situ datasets from Douarnenez bay (Deni1980) concerns a commercially exploited fish population';
F2 = 'Bigger female/male ever observed in Douarnenez bay: 59 cm for 1679g / 49.5 cm / 1259.5g';
F3 = 'Common sole has a determinate fecundity.';
metaData.bibkey.F1 = 'Deni1980'; metaData.bibkey.F2 = 'Deni1980';
metaData.bibkey.F3 = 'Witthames1995';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Discussion points
D1 = 'Ref for in situ temperature - Augris 2005 - Figure I-22 : Douarnenez bay average surface temperature for the year 1998  [Augr2005]';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = ['mod_1: Different to v1 2015/08/28: ab, tj, Tab and Taj data (Fond1979) replaced with correct values;',...
    'added multiple zero-variate and uni-variate data, diffentiate males from females, completness from 2.5 to 3.5.', ...
    'Template discussion points and facts removed from v1, included facts and discussion points about Solea solea.'] ;
D4 = 'Linked publication: Model parameterization (prior to AmP submission) and implications described in Mournier et al., 2020 [MounPecq2020]';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Links
metaData.links.id_CoL = '4Y5CH'; % Cat of Life
metaData.links.id_ITIS = '173002'; % ITIS -> extremely slow to load
metaData.links.id_EoL = '46570285'; % Ency of Life
metaData.links.id_Wiki = 'Solea_solea'; % Wikipedia
metaData.links.id_ADW = 'Solea_solea'; % ADW
metaData.links.id_Taxo = '46991'; % Taxonomicon
metaData.links.id_WoRMS = '127160'; % WoRMS
metaData.links.id_fishbase = 'Solea-solea'; % fishbase

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
    'author = {Kooijman, S.A.L.M.}, ' ...
    'year = {2010}, ' ...
    'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
    'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
    'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
    'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKear2011'; type = 'Article'; bib = [ ...  % used for the estimation method
    'author = {Lika, K. and Kearney, M.R. and Freitas, V. and van der Veer, H.W. and van der Meer, J. and Wijsman, J.W.M. and Pecquerie, L. and Kooijman, S.A.L.M.},'...
    'year = {2011},'...
    'title = {The ''''covariation method'''' for estimating the parameters of the standard Dynamic Energy Budget model \textrm{I}: Philosophy and approach},'...
    'journal = {Journal of Sea Research},'...
    'volume = {66},'...
    'number = {4},'...
    'pages = {270-277},'...
    'DOI = {10.1016/j.seares.2011.07.010},'...
    'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S1385110111001055}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% --------------------------------------------------------------------------------------------------
bibkey = 'Augr2005'; type = 'Book'; bib = [ ...
    'author = {Augris, C.}, '...
    'year = {2005}, '...
    'title = {Atlas thematique de l environnement marin de la baie de Douarnenez (Finistre)}, '...
    'publisher = {Editions Quae}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Day1996'; type = 'Article'; bib = [ ...
    'author = {Day, O. J. and Jones, D. A. and Howell, B. R.}, '...
    'year = {1996}, '...
    'title = {Food consumption, growth and respiration of sole, \textit{Solea solea} ({L}.), during early ontogeny in a hatchery environment}, '...
    'journal = {Aquaculture Research}, '...
    'volume = {27}, '...
    'pages = {831-839}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Deni1981'; type = 'Misc'; bib = [ ...
    'author = {Deniel, C.}, '...
    'year = {1981}, '...
    'title = {Les poissons plats [{T}eleosteens, {P}leuronectiformes] en baie de {D}ouarnenez : reproduction, croissance et migration}, '...
    'note = {PhD thesis, Universite de Bretagne Occidentale - Brest}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DevaAlex1987'; type = 'Article'; bib = [ ...
    'author = {Devauchelle, N. and Alexandre, J. C. and Corre, N. L. E. and Letty, Y.}, '...
    'year = {1987}, '...
    'title = {Spawning of Sole (\textit{Solea solea}) in Captivity}, '...
    'journal = {Aquaculture}, '...
    'volume = {66}, '...
    'pages = {125-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dore1986'; type = 'Book'; bib = [ ...
    'author = {Dorel, D.}, '...
    'year = {1986}, '...
    'title = {Poissons de l {A}tlantique {N}ord-{E}st: relations taille-poids}, '...
    'publisher = {IFREMER}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fond1977'; type = 'Article'; bib = [ ...
    'author = {Fonds, M. and Saksena, V. P.}, '...
    'year = {1977}, '...
    'title = {The daily food intake of young soles (\textit{Solea solea}, {L}.) in relation to their size and the water temperature}, '...
    'journal = {3rd meeting of the ICES working group on Mariculture, Brest (France), 10-13 Mai 1977 - Actes de Colloques du C.N.E.X.O.}, '...
    'volume = {4}, '...
    'page = {51-58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fond1979'; type = 'Article'; bib = [ ...
    'author = {Fonds, M.}, '...
    'year = {1979}, '...
    'title = {Laboratory observations on the influence of temperature and salinity on the development of the eggs and growth of the larvae of \textit{Solea solea} ({P}isces)}, '...
    'journal = {Marine Ecology - Progress Series}, '...
    'volume = {1}, '...
    'pages = {91-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fond1989'; type = 'Article'; bib = [ ...
    'author = {Fonds, M. and Drinkwaard, B. and Resink, J. W. and Eysink, G. G. J. and Toet, W.}, '...
    'year = {1989}, '...
    'title = {Measurements of metabolism, food intake and growth of \textit{Solea solea} ({L}.) fed with mussel meat or with dry food}, '...
    'journal = {Aquaculture: a biotechnology in progress}, '...
    'volume = {2}, '...
    'pages = {1851-874}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaloLaga1990'; type = 'Article'; bib = [ ...
    'author = {Galois, R. and Lagardre, F. and Richard, P.}, '...
    'year = {1990}, '...
    'title = {Changes in biochemical composition and otolith microstructure of larval common soleas, \textit{Solea solea} ({L}.) under experimental starvation.}, '...
    'journal = {La mer}, '...
    'volume = {28}, '...
    'pages = {273-285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lund2008'; type = 'Article'; bib = [ ...
    'author = {Lund, I. and Steenfeldt, S. J. and Suhr, K. I. and Hansen, B. W.}, '...
    'year = {2008}, '...
    'title = {A comparison of fatty acid composition and quality aspects of eggs and larvae from cultured and wild broodstock of common sole (\textit{Solea solea}, {L}.)},'...
    'journal = {Aquaculture Nutrition}, '...
    'volume = {14(6)}, '...
    'pages = {544-555}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MounPecq2020'; type = 'Article'; bib = [ ...
    'author = {Florence Mounier and Laure Pecquerie and Jeremy Lobry and Adriana E. Sardi and Pierre Labadie and Helene Budzinski and Veronique Loizeau},'...
    'year = {2020}, '...
    'title = {Dietary bioaccumulation of persistent organic pollutants in the common sole \textit{Solea solea} in the context of global change. Part 1: Revisiting parameterisation and calibration of a {DEB} model to consider inter-individual variability in experimental and natural conditions},'...
    'journal = {Ecological Modelling}, '...
    'volume = {433}, '...
    'doi = {10.1016/j.ecolmodel.2020.109224},'...
    'pages = {109224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WittGree1995'; type = 'Article'; bib = [ ...
    'author = {Witthames, P.R. and Greer Walker, M.}, '...
    'year = {1995}, '...
    'title = {Determinacy of fecundity and oocyte atresia in sole (\textit{Solea solea}) from the {C}hannel, the {N}orth {S}ea and the {I}rish {S}ea)},'...
    'journal = {Aquatic Living Resources}, '...
    'volume = {8}, '...
    'pages = {91-109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%

