function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_nothus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_nothus'; 
metaData.species_en = 'Silver seatrout'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 04];

%% set data
% zero-variate data

data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'LopeSanc2010';   
  temp.am = C2K(26.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15.8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 36;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 50;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.01230*Lp^3.01, see F1';
data.Wwi = 595;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.01, see F1';

data.GSI  = 0.03; units.GSI  = '#/d'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(26.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cynoscion_guatucupa';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
3.032	0.138
3.963	0.168
3.964	0.163
4.122	0.151
5.957	0.156
6.011	0.203
6.012	0.189
6.037	0.256
6.064	0.171
6.941	0.185
7.021	0.201
7.022	0.210
7.023	0.218
7.048	0.235
7.978	0.207
7.979	0.233
8.059	0.217
8.963	0.272
8.964	0.233
8.989	0.289
9.920	0.247
9.921	0.262
9.947	0.425
9.973	0.331
10.984	0.290
10.985	0.278
11.011	0.246
11.968	0.329
12.021	0.407
12.977	0.343
12.978	0.365
12.979	0.375
13.005	0.388
13.963	0.497
15.027	0.348
16.995	0.617
19.016	0.647
19.973	0.603];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.8);  units.temp.tL = 'K'; label.temp.tL_CKfm = 'temperature';
bibkey.tL = 'FlorSanc1998'; 
%
data.tL1 = [ ... % time since birth (yr), total length (cm)
 3	12.875
 4	17.872
 5	20.782
 6	25.664
 7	29.269
 8	30.557
 9	32.191
10	33.362
11	34.070
12	34.893
13	35.252];
data.tL1(:,1) = 365 * (0.9+data.tL1(:,1)); % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length'};  
temp.tL1 = C2K(26.8);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'LopeSanc2010'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.121	18.114
10.426	25.265
10.730	25.286
10.768	18.158
10.920	23.714
11.111	27.689
11.415	21.371
11.567	24.551
11.568	30.889
11.834	30.907
12.062	26.169
12.177	34.099
12.481	33.327
12.519	38.876
12.748	42.853
13.014	34.948
13.167	49.219
13.204	41.299
13.471	42.109
13.508	31.020
13.776	50.845
13.889	42.138
14.042	49.278
14.308	42.958
14.766	58.835
14.956	54.094
15.565	58.889
15.718	73.952
16.479	80.342
16.936	77.996
17.089	85.929
17.355	89.116
17.393	81.988
17.851	101.034
17.964	93.911
18.232	113.736
18.307	102.649
18.992	101.111
19.070	118.546
19.108	123.302
19.109	134.394
19.183	104.293
19.221	110.634
19.982	115.439
20.555	138.453
20.630	127.367
20.707	136.087
21.049	132.149
21.088	143.243
21.280	162.270
21.355	144.845
21.660	157.542
21.965	163.109
22.308	178.977
22.728	186.136
22.954	161.591
23.527	191.736
23.642	197.289
24.099	203.659
24.252	215.553
24.519	223.493
24.861	219.555
25.128	229.873
25.851	235.468
25.892	262.407
26.004	241.024
26.119	255.292
26.155	233.112
26.271	248.965
26.349	274.322
26.616	279.094
26.883	290.996
26.958	272.779
27.644	287.086
27.759	296.601
27.950	315.628
28.598	320.425
28.637	338.650
28.977	307.775
29.130	313.331
29.132	347.398
29.474	333.953
29.587	321.285
29.590	364.067
29.969	345.078
30.123	357.765];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'LopeSanc2010';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 5 * weights.tL1;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'data Wwp and Wwi are ignorned due to inconsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C7MT'; % Cat of Life
metaData.links.id_ITIS = '169240'; % ITIS
metaData.links.id_EoL = '46578975'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion_nothus'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_nothus'; % ADW
metaData.links.id_Taxo = '172634'; % Taxonomicon
metaData.links.id_WoRMS = '159305'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-nothus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion_nothus}}';
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
bibkey = 'LopeSanc2010'; type = 'article'; bib = [ ... 
'doi = {10.1016/s0165-7836(00)00152-1}, ' ...
'author = {Jonathan Franco L\''{o}pez and Carlos Bedia S\''{a}nchez and H\''{e}ctor Barrera Escorcia and Luis G. Abarca Arenas and Tom\''{a}s Corro Ferreira and Horacio V\''{a}zquez-L\''{o}pez}, ' ... 
'year = {2010}, ' ...
'title = {Biological and Ecological Aspects Regarding \emph{Cynoscion nothus} {H}olbrook, 1855 ({P}erciforms: {S}ciaenidae)}, ' ...
'journal = {Research Journal of Fisheries and Hydrobiology}, ' ...
'volume = {5(2)}, ' ...
'pages = {66-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FlorSanc1998'; type = 'article'; bib = [ ... 
'doi = {10.1006/ecss.1998.0395}, ' ...
'author = {Flores-Coto, C. and S\''{a}nchez-Iturbe, A. and Zavala-Garc\''{i}a, F. and Warlen, S. M.}, ' ... 
'year = {1998}, ' ...
'title = {Age, Growth, Mortality and Food Habits of Larval \emph{Stellifer lanceolatus}, \emph{Cynoscion arenarius} and \end{Cynoscion nothus} ({P}isces: {S}ciaenidae), from the Southern {G}ulf of {M}exico}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {47(5)}, ' ...
'pages = {593–602}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-nothus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

