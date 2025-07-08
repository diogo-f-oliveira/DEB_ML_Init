function [data, auxData, metaData, txtData, weights] = mydata_Caenorhabditis_elegans

%% set metaData
metaData.phylum     = 'Nematoda'; 
metaData.class      = 'Secernentea'; 
metaData.order      = 'Rhabditida'; 
metaData.family     = 'Rhabditidae';
metaData.species    = 'Caenorhabditis_elegans'; 
metaData.species_en = 'Roundworm'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biB', 'biD'};
metaData.ecoCode.gender  = {'Hsmm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'; 't-R_T'; 't-S'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Benoit Goussen'};    
metaData.date_subm = [2011 03 18];              
metaData.email    = {'benoit.goussen@irsn.fr'};            
metaData.address  = {'IRSN, Snt-Paul-Lez-Durance'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2011 05 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 01 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 11/24;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ByerCassa1976';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 65/24;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ByerCassa1976';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'ByerCassa1976';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 250e-4;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ByerCassa1976';
data.Lp = 1060e-4; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ByerCassa1976';
data.Li = 1400e-4; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ByerCassa1976';

data.Wwb = 0.024;  units.Wwb = 'mug'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ByerCassa1976';
data.Wwp = 1.8;    units.Wwp = 'mug'; label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'ByerCassa1976';
data.Wwi = 4.3;    units.Wwi = 'mug'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ByerCassa1976';

data.Ri  = 218;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ByerCassa1976';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time - length
data.tL = [ ... % time since birth (d), length (cm)
      0.3750 0.4167 0.4583 0.5000 0.5417 0.5833 0.8333 1.0000 1.0833 1.1250 1.3750 1.4167 1.4583 1.7083 2.0000 2.0417 2.0833 2.1250 2.2083 2.2500 2.2917 2.3333 2.3750 2.4167 2.7083 3.0417 3.0833 3.1667 3.2083 3.2500 3.2917 3.3750 3.4167 4.2083 4.2500 4.2917 5.0417 5.2500 5.2917 5.3333 5.3750 6.0833;   
      0.01894425 0.02011505 0.01920180 0.02050526 0.02059703 0.02346835 0.02504555 0.02702025 0.02688985 0.03055057 0.03467179 0.03562762 0.03766673 0.04243932 0.05235964 0.05336163 0.05408902 0.05509132 0.05890744 0.05985175 0.06255456 0.06772758 0.06972510 0.06828496 0.07625998 0.09128211 0.09064438 0.09069574 0.09335214 0.09554735 0.09310580 0.09615224 0.09729675 0.10784522 0.11002046 0.10764648 0.11322616 0.12230277 0.12238967 0.12103148 0.12101595 0.12650128]'; 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length', '20 C'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gous2011';
%
% T = 16 + 273 K: 
data.tL_16 = [... % time since birth (d), length (cm)
    [36.5 48 60 75 180]./24;
    [360 490 650 900 1150]./1e4]';
units.tL_16  = {'d', 'cm'};  label.tL_16 = {'time since birth', 'length', '16 C'};  
temp.tL_16   = C2K(16);  units.temp.tL_16 = 'K'; label.temp.tL_16 = 'temperature';
bibkey.tL_16 = 'ByerCassa1976';
%
% T = 20 + 273 K
data.tL_20 = [ ... % time since birth (d), length (cm)
    [13.65758755	15.05836576	18.32684825	19.26070039	19.72762646	22.76264591	23.46303502	24.16342412	26.0311284	26.49805447	27.89883268	29.76653696	31.16731518	31.86770428	33.73540856	35.83657588	37.47081712	38.40466926	39.3385214	41.43968872	43.54085603	43.54085603	45.64202335	47.50972763	47.9766537	50.31128405	51.71206226	53.11284047	54.98054475	55.68093385	57.08171206	58.48249027	59.41634241	62.21789883	63.61867704	65.25291829	66.18677043	67.58754864	69.92217899	71.08949416	71.78988327	73.42412451	74.82490272	75.29182879	77.62645914	79.26070039	82.06225681	83.22957198	86.49805447	90.23346304	93.50194553	98.40466926	102.60700389	107.27626459	109.61089494	114.28015564	118.71595331	122.45136187	126.42023346	129.92217899]./24;
    [258.75706215	281.3559322	302.07156309	311.48775895	320.9039548	332.20338983	339.73634652	343.50282486	362.33521657	354.80225989	386.8173258	426.3653484	418.83239171	443.31450094	447.08097928	467.79661017	524.29378531	563.84180791	578.90772128	614.68926554	586.44067797	642.93785311	680.60263653	648.58757062	723.91713748	725.80037665	765.34839925	786.06403013	786.06403013	844.44444444	859.51035782	851.97740113	895.29190207	998.8700565	1019.58568738	1055.36723164	1017.70244821	1094.91525424	1123.16384181	1093.03201507	1126.93032015	1155.17890772	1125.04708098	1204.14312618	1204.14312618	1213.55932203	1224.85875706	1285.12241055	1349.15254237	1384.93408663	1290.77212806	1290.77212806	1341.61958569	1335.96986817	1411.29943503	1396.23352166	1381.16760829	1418.83239171	1420.71563089	1371.75141243]./1e4]';
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'length', '20 C'};  
temp.tL_20   = C2K(20);  units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'ByerCassa1976';
%
% T = 25 + 273 K
data.tL_25 = [ ... time since birth (d), length (cm)
     [18 25.5 31 39 88]./24;  
     [380 510 620 940 1110]./1e4]';
units.tL_25  = {'d', 'cm'};  label.tL_25 = {'time since birth', 'length', '25 C'};  
temp.tL_25   = C2K(25);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'ByerCassa1976';

% time - reprod
% T = 16 + 273 K: 
data.tR_16 = [ ... % time since birth (d), reprod rate (#/d)
    [89.43255798	93.420719	97.98451389	101.2681928	106.0417147	110.0521871	113.7999429	118.1038101	122.2598643	125.7002807	129.9734698	133.8723852	137.8270791	141.8347626	146.06054	150.3538092	154.169057	158.0289275	162.173826	165.7932913	169.9047228	173.7924825	177.7025537	182.1966255	185.6063637	189.5164349]./24;
    [0.27770635	0.6375821	1.37947069	2.37647608	2.71491199	3.2446332	3.77442413	4.53761313	4.17557596	4.3657457	4.89539719	4.57589111	4.68099867	5.1894892	5.35821909	4.04073149	3.08430494	2.46756931	2.02060941	1.57378896	0.87206087	0.46763206	0.23304871	0.44417024	0.40080247	0.16621912] * 24]';
units.tR_16  = {'d', '#/d'};  label.tR_16 = {'time since birth', 'reprod rate', '16 C'};  
temp.tR_16   = C2K(16);  units.temp.tR_16 = 'K'; label.temp.tR_16 = 'temperature';
bibkey.tR_16 = 'ByerCassa1976';
%
% T = 19.8 + 273 K: 
data.tR_20 = [ ... % time since birth (d), reprod rate (#/d)
    [53.18766013	57.19794341	57.30544455	61.00851905	61.22352337	65.18833997	65.26907395	69.12808908	69.22454262	73.24927276	73.26584416	77.08704046	77.31564384	81.23074423	81.32040332	85.06214238	85.15264721	89.0520301	89.10131938	93.21018073	93.3087588	97.16522601	97.17839814	101.365442	101.6429093	105.3404579	106.1167684	109.4956337	109.889946	113.0589162	113.4685251	117.2587073	118.078775	121.2655913	125.3770021]./24;
    [0.03305896	0.03305896	0.21487735	0.26446383	0.62810061	2.85950449	2.00000033	4.11570309	3.8677694	4.42975274	5.07438086	5.71900899	6.6115708	6.90909162	6.39669476	7.95041352	7.47107464	7.15702532	9.07438053	8.9090913	8.74380173	6.76033088	7.27272742	6.14876107	4.94214895	4.77686004	2.97520693	2.41322358	1.75206729	1.02479373	0.95867843	0.39669574	0.29752148	0.26446383	0.19834853] * 24]';
units.tR_20  = {'d', '#/d'};  label.tR_20 = {'time since birth', 'reprod rate', '19.8 C'};  
temp.tR_20   = C2K(19.8);  units.temp.tR_20 = 'K'; label.temp.tR_20 = 'temperature';
bibkey.tR_20 = 'ByerCassa1976';
%
% T = 25 + 273 K: 
data.tR_25 = [ ... % time since birth (d), reprod rate (#/d)
    [42.09894343	45.79092075	49.93247257	54.56822169	58.15087319	62.60813119	66.12161738	70.4427759	74.60440798	78.42579136	82.43403263	86.80539177	90.19281861]./24;
    [0	0.05574288	1.58330616	4.87294635	6.14588089	8.07675742	6.82317104	5.71799026	5.39841446	2.48869541	1.00143207	0.27840358	0.06519036] * 24]';
units.tR_25  = {'d', '#/d'};  label.tR_25 = {'time since birth', 'reprod rate', '25 C'};  
temp.tR_25   = C2K(25);  units.temp.tR_25 = 'K'; label.temp.tR_25 = 'temperature';
bibkey.tR_25 = 'ByerCassa1976';

% T = 20 + 273 K: 
data.tS = [ ... % time since birth (d), fraction alive
        0 9 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30;
        [100 97 88 84 79 76 55 52 45 40 36 33 29 21 17 14 12 9 5 0]/ 100]';
units.tS  = {'d', '-'};  label.tS = {'time since birth', 'fraction alive'};  
temp.tS   = C2K(20);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'SutpKaeb2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tR_16 = 0 * weights.tR_16; 
weights.tR_20 = 0 * weights.tR_20; 
weights.tR_25 = 0 * weights.tR_25; 
weights.tS(end) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Group plots
set1 = {'tL_25','tL_20','tL_16'}; subtitle1 = {'ByerCassa1976 data at 25, 20, 16 C'};
set2 = {'tR_25','tR_20','tR_16'}; subtitle2 = {'ByerCassa1976 data at 25, 20, 16 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'L^3/W varies over a factor 35';
D2 = 'puberty correcponds with start of female function';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hatched larvae develop through 4 stages or molts';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Males and hermaphrodites exist. Hermaphrodites first produce sperm in stage 4, then eggs only';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '87THG'; % Cat of Life
metaData.links.id_ITIS = '63332'; % ITIS
metaData.links.id_EoL = '403869'; % Ency of Life
metaData.links.id_Wiki = 'Caenorhabditis_elegans'; % Wikipedia
metaData.links.id_ADW = 'Caenorhabditis_elegans'; % ADW
metaData.links.id_Taxo = '13102'; % Taxonomicon
metaData.links.id_WoRMS = '583290'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caenorhabditis_elegans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ByerCassa1976'; type = 'Article'; bib = [ ... 
'author = {Byerly, L. and Cassada, R. C. and Russell, R. L.}, ' ... 
'year = {1976}, ' ...
'title = {The life cycle of the nematode \emph{Caenorhabditis elegans}: I. {W}ild-type growth and reproduction}, ' ...
'journal = {Developmental Biology}, ' ...
'volume = {51}, ' ...
'number = {1}, '...
'pages = {23--33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SutpKaeb2009'; type = 'Article'; bib = [ ... 
'author = {Sutphin G. L. and Kaeberlein M.}, ' ... 
'year = {2009}, ' ...
'title = {Measuring \emph{Caenorhabditis elegans} Life Span on Solid Media}, ' ...
'howpublished = {\url{http://www.jove.com/index/Details.stp?ID=1152}}, ' ...
'doi = {10.3791/1152}, ' ...
'journal = {JoVE}, ' ...
'volume = {27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gous2011'; type = 'Misc'; bib = [...
'author = {Benoit Goussen}, ' ... 
'year = {2011}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

