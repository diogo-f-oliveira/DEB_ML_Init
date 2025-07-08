function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_maccoyii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_maccoyii'; 
metaData.species_en = 'Southern bluefin tuna'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 01 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05];

%% set data
% zero-variate data

data.am = 40 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'GunnClea2008';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 160;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'GunnClea2008'; 
data.Li  = 245;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'Wiki';

data.Wwb  = 6.06e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm for Thunnus obesus: pi/6*0.105^3';
data.Wwi  = 260e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight';   bibkey.Wwi  = 'Wiki';

data.Ri = 15e6/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(29); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length data
data.tL_f = [ ... % yr class (yr), fork length 
1.900	95.102
1.954	82.585
2.823	112.517
3.040	96.735
3.094	100.544
3.094	104.898
3.963	102.449
3.963	104.354
3.963	111.429
3.963	113.333
3.963	114.422
3.963	115.510
3.963	117.687
3.963	119.320
4.723	120.136
4.831	122.313
4.831	123.401
4.831	125.578
4.831	127.483
5.862	135.102
5.862	136.463
5.917	122.313
5.917	123.946
5.917	128.571
5.917	130.748
5.917	132.109
5.917	132.925
6.840	137.551
6.894	140.272
6.948	142.721
7.002	147.347
7.762	143.537
7.871	148.980
8.848	156.871
8.902	141.361
9.011	145.986
12.865	162.041
15.036	162.313
15.036	167.483
15.036	177.823
15.905	173.197
16.068	163.673
18.890	167.483
18.890	174.558
20.790	174.014
20.899	167.483
21.767	175.646
23.776	181.361
23.830	170.748
23.830	178.912
24.807	183.537
26.001	179.728
26.001	172.381
26.055	201.224
28.824	173.469
28.878	168.027
28.932	181.905
29.855	191.156
30.887	180.544
31.972	169.932
31.972	184.354
35.881	194.966
38.866	187.619];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert a to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(29);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GunnClea2008';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), fork length           
1.791	96.190
1.900	79.592
2.986	95.918
3.094	103.265
3.745	102.721
3.908	111.973
3.908	114.694
3.908	116.871
3.908	118.503
3.963	106.259
3.963	122.313
4.940	117.143
4.994	119.048
4.994	120.408
4.994	122.313
4.994	125.306
4.994	128.299
4.994	129.932
5.971	120.136
5.971	122.313
6.025	125.578
6.080	128.844
6.080	131.020
6.080	134.286
6.785	134.830
6.894	142.993
6.948	140.544
6.948	141.633
6.948	142.177
7.002	138.367
7.002	139.184
7.002	146.259
7.871	156.054
7.925	145.714
9.011	147.075
9.065	154.694
9.879	154.966
9.988	158.231
10.911	159.592
11.779	161.224
12.919	162.313
13.951	160.952
15.905	163.946
15.905	178.639
15.959	167.483
15.959	169.116
15.959	173.469
16.013	168.571
16.936	167.211
16.936	172.109
17.859	177.551
17.859	182.177
17.913	186.259
18.890	183.265
20.899	175.646
20.953	179.456
21.876	175.102
21.984	190.884
22.853	185.442
22.907	183.265
22.907	191.973
23.016	180.000
24.047	191.973
24.807	182.177
24.916	191.973
26.001	169.932
26.055	193.878
26.924	185.442
26.978	175.646
26.978	180.000
26.978	181.088
26.978	191.429
27.901	179.728
28.010	182.177
29.801	191.701
29.910	178.912
29.910	194.966
30.995	189.796
30.995	191.973
30.995	194.150
31.972	189.524
32.841	184.354
32.841	188.435
33.058	190.884
33.058	204.218
33.872	195.510
33.926	184.082
40.929	183.537];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert a to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(29);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GunnClea2008';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'Maintains a body temperature 10C above the ambient water temperature';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56P77'; % Cat of Life
metaData.links.id_ITIS = '172431'; % ITIS
metaData.links.id_EoL = '46577338'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_maccoyii'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_maccoyii'; % ADW
metaData.links.id_Taxo = '189036'; % Taxonomicon
metaData.links.id_WoRMS = '219720'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-maccoyii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_maccoyii}}';
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
bibkey = 'GunnClea2008'; type = 'Article'; bib = [ ... 
'author = {John S. Gunna and Naomi P. Clear and Thor I. Carter and Anthony J. Rees  and Clive A. Stanley and Jessica H. Farley and John M. Kalish}, ' ... 
'year = {2008}, ' ...
'title = {Age and growth in southern bluefin tuna, \emph{Thunnus maccoyii} ({C}astelnau): {D}irect estimation from otoliths, scales and vertebrae}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {92}, ' ...
'pages = {207-220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thunnus-maccoyii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

