function [data, auxData, metaData, txtData, weights] = mydata_Urogymnus_polylepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Urogymnus_polylepis'; 
metaData.species_en = 'Giant freshwater stingray'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 10];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 10]; 

%% set data
% zero-variate data;
data.ab = 7*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'PhomSeeh2019';   
  temp.am = C2K(27.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 30; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
data.Lp  = 110; units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 240;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase';

data.Wwi = 600e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-4 pups per litter, assumed 1 litter per yr';
  
% uni-variate data at f
% time-length
data.tL_C = [ ... % time since birth (yr), disc length (cm)
1.007	45.087
2.667	79.769
3.291	108.092
3.995	143.353
3.997	134.104
4.001	115.029
4.969	150.289
5.677	169.942
5.967	140.462
6.335	131.214
6.632	169.942
6.955	180.347
7.977	150.867
8.966	185.549];
data.tL_C(:,1) = 365 * (0 + data.tL_C(:,1)); % convert yr to d
units.tL_C = {'d', 'cm'};  label.tL_C = {'time since birth', 'disc length', 'Chao Phraya River'};  
  temp.tL_C = C2K(27.6); units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'PhomSeeh2019';
comment.tL_C = 'Data from Chao Phraya River';
%
data.tL_M = [ ... % time since birth (yr), disc length (cm)
0.945	40.046
0.971	35.047
1.968	50.095
1.968	44.381
2.964	60.857
4.012	118.764
4.012	112.335
5.009	120.954
5.034	149.527
5.034	125.241
5.290	120.967
5.341	153.827
5.341	151.684
5.647	154.556
5.980	157.429
6.005	150.287
6.005	126.716
6.005	119.573
6.618	128.888
6.976	160.333
7.666	185.366
7.666	161.081
7.666	138.938
7.973	179.667
7.973	184.667
8.663	200.414
8.995	162.572
9.020	202.574
9.302	181.158
9.685	211.177
9.991	184.048
10.017	201.907
10.375	159.781
11.039	194.098
11.652	250.556
11.704	225.559
12.036	249.860];
data.tL_M(:,1) = 365 * (0 + data.tL_M(:,1)); % convert yr to d
units.tL_M = {'d', 'cm'};  label.tL_M = {'time since birth', 'disc length', 'Mae Klong River'};  
  temp.tL_M = C2K(27.6); units.temp.tL_M = 'K'; label.temp.tL_M = 'temperature';
bibkey.tL_M = 'PhomSeeh2019';
comment.tL_M = 'Data from Mae Klong River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_C = 5 * weights.tL_C;
weights.tL_M = 5 * weights.tL_M;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_M','tL_C'}; subtitle1 = {'Data from Mae Klong and Chao Phraya River'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight for Dasyatis pastinaca: Ww in g =  0.01230 *(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DV7D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263548'; % Ency of Life
metaData.links.id_Wiki = 'Urogymnus_polylepis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4974508'; % Taxonomicon
metaData.links.id_WoRMS = '1011468'; % WoRMS
metaData.links.id_fishbase = 'Urogymnus-polylepis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Urogymnus_polylepis}}'; 
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
bibkey = 'PhomSeeh2019'; type = 'Article'; bib = [ ... 
'author = {Pisit Phomikong and Suwimon Seehirunwong and Tuantong Juatagate}, ' ...
'year = {2019}, ' ...
'title = {A Preliminary Estimate of Age and Growth of Two Populations of {D}asyatid Stingray \emph{Urogymnus polylepis} in {T}hailand}, ' ...
'journal = {JOURNAL OF FISHERIES AND ENVIRONMENT}, ' ...
'volume = {43(3)}, ' ...
'pages = {481-488}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Urogymnus-polylepis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  