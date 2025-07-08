function [data, auxData, metaData, txtData, weights] = mydata_Oedalechilus_labeo
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Oedalechilus_labeo'; 
metaData.species_en = 'Boxlip mullet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 25];

%% set data
% zero-variate data

data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(19.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.9;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 25;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm for M. cephalus: pi/6*0.09^3';
data.Wwp = 22.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^2.96, see F1';
data.Wwi = 159.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^2.97, see F1';
  
data.Ri  = 6e4/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Planiliza parsia';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % yr class (yr), total length (cm), weight (g)
    0  7.3   3.2
    1 11.2  12.9
    2 13.6  24.2
    3 15.9  39.8
    4 17.5  50.3
    5 18.7  57.7
    6 20.3  73.6
    7 20.5  77.8
    8 21.2  88.8
    9 22.6 100.7
   10 23.9 148.3];
data.tLW(:,1) = (data.tLW(:,1) + 0.5) * 365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(19.3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'MatiFerr2012'; treat.tLW = {1 {'total length','weight'}};

% length-weight
data.LW_f = [ ...  % total length (cm), wet weight (g)
10.926	10.366
11.461	12.928
11.708	17.388
11.790	9.122
11.872	12.305
11.955	14.851
12.449	17.411
12.819	21.239
12.860	19.333
13.148	22.522
13.395	23.166
13.807	17.455
13.807	23.179
13.971	22.548
14.095	30.185
14.383	27.013
14.506	27.653
14.588	31.472
14.671	25.751
14.671	31.475
15.247	35.310
15.247	30.857
15.535	34.047
15.741	33.417
15.741	39.141
16.152	42.971
16.152	39.155
16.317	31.527
16.358	48.066
16.523	40.438
16.646	46.167
17.222	46.821
17.346	57.002
17.798	41.115
17.922	68.469
18.086	53.845
18.169	59.572
18.251	50.034
18.292	56.396
18.333	67.210
18.374	81.840
18.580	59.585
18.704	67.858
18.868	57.050
19.033	65.960
19.074	50.696
19.239	64.694
19.486	58.342
19.568	67.249
19.691	71.705
19.938	62.809
20.062	72.989
20.556	73.005
20.679	78.733
20.885	75.559
21.049	92.738
21.337	87.659
21.584	81.306
21.667	106.114
21.955	92.767
22.325	106.771
22.531	131.584
22.901	90.253
24.177	140.541
24.506	160.904];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight','females'};  
bibkey.LW_f = 'MatiFerr2012';
%
data.LW_m = [ ...
10.986	14.237
11.192	11.722
11.317	14.854
11.480	12.340
11.647	15.471
11.896	19.226
11.935	14.208
12.101	16.711
12.307	15.450
12.472	15.445
12.927	19.194
13.011	23.582
13.175	20.441
13.423	21.060
13.670	21.052
13.672	26.070
13.920	26.689
14.086	27.938
14.167	24.800
14.332	26.049
14.458	29.808
14.704	27.292
14.746	30.426
15.035	29.790
15.200	29.158
15.448	31.658
15.573	33.536
15.574	37.299
15.778	31.648
16.068	34.775
16.153	40.417
16.317	38.530
16.402	43.545
16.525	42.287
16.571	51.693
16.645	34.130
16.895	39.139
16.899	48.547
17.269	44.772
17.562	55.425
17.601	51.033
18.015	52.902
18.264	57.912
18.509	52.886
18.759	57.269
18.842	59.775
19.092	63.530
19.586	62.260
20.039	61.619
20.208	71.021
20.293	74.782
20.624	77.907
20.794	89.818
20.828	73.511
20.915	83.543
20.995	77.268
21.208	91.687
23.159	120.476
23.376	144.929];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight','males'};  
bibkey.LW_m = 'MatiFerr2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01122*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74HV8'; % Cat of Life
metaData.links.id_ITIS = '630337'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Oedalechilus_labeo'; % Wikipedia
metaData.links.id_ADW = 'Oedalechilus_labeo'; % ADW
metaData.links.id_Taxo = '181685'; % Taxonomicon
metaData.links.id_WoRMS = '126984'; % WoRMS
metaData.links.id_fishbase = 'Oedalechilus-labeo'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oedalechilus_labeo}}';
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
bibkey = 'MatiFerr2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2011.01907.x}, ' ...
'author = {S. Mati\''{c}-Skoko and J. Ferri and M. Kraljevi\''{c} and A. Pallaoro}, ' ... 
'year = {2012}, ' ...
'title = {Age estimation and specific growth pattern of boxlip mullet, \emph{Oedalechilus labeo} ({C}uvier, 1829) ({O}steichthyes, {M}ugilidae), in the eastern {A}driatic {S}ea}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {28(2)}, ' ...
'pages = {182–188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Oedalechilus-labeo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
