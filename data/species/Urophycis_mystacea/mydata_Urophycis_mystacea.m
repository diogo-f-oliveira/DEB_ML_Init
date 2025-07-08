function [data, auxData, metaData, txtData, weights] = mydata_Urophycis_mystacea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Urophycis_mystacea'; 
metaData.species_en = 'Brazilian codling'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 29];

%% set data
% zero-variate data;

data.am = 12*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'BalbRoss2019';   
  temp.am = C2K(15.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43.9;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
data.Li  = 66.5;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 2.3e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'NAFO';
  comment.Wwb = 'based on egg diameter of 0.76 mm of several Urophycis species: pi/6*0.076^3';
data.Wwp  = 378;  units.Wwp  = 'g';   label.Wwp  = 'ultimate wet weight';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on W = 0.00295*Lp^3.11, see F1';
data.Wwi  = 1.38e3;  units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on W = 0.00295*Li^3.11, see F1';

data.Ri = 1e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(15.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Urophycis tenuis after weight correction: fecundity 15e6*1.38e3/21e3';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.947	25.907
0.999	22.422
0.999	20.430
1.016	19.435
1.980	30.523
1.980	30.150
1.980	29.403
1.980	28.532
1.997	27.661
1.997	27.038
1.997	26.789
1.997	25.793
2.032	31.271
2.032	25.296
2.978	32.028
2.996	42.982
2.996	41.737
2.996	36.883
2.996	36.385
2.996	33.397
2.996	32.775
2.996	31.779
3.013	35.762
3.013	34.393
3.030	39.621
3.047	38.003
3.065	31.033
3.960	35.772
3.960	34.029
3.960	33.158
3.977	55.316
3.977	47.598
3.977	46.229
3.977	43.117
3.977	42.370
3.977	34.528
3.977	29.673
3.994	45.856
3.994	41.125
3.994	40.503
3.994	39.756
3.994	39.009
3.994	37.640
3.994	37.515
3.994	35.897
3.994	32.661
3.994	31.914
3.994	30.295
4.011	36.520
4.029	46.354
4.063	44.114
4.958	40.139
4.976	59.185
4.976	51.343
4.976	47.235
4.993	55.327
4.993	46.364
5.010	54.829
5.010	53.459
5.010	45.742
5.010	44.746
5.010	42.630
5.010	38.397
5.027	59.684
5.027	56.821
5.027	48.729
5.027	44.497
5.027	41.883
5.027	41.136
5.044	54.331
5.044	43.626
5.044	37.153
5.974	48.366
5.974	47.868
5.991	57.951
5.991	56.084
5.991	51.727
5.991	47.370
6.009	50.482
6.009	49.984
6.009	49.611
6.009	46.499
6.026	53.470
6.060	52.475
6.990	53.978
7.007	60.327
7.007	50.991
7.024	55.970
7.024	49.995
7.024	46.509
7.042	52.609
7.971	54.611
8.006	57.972
8.006	56.105
8.006	53.988
8.006	53.242
8.006	52.246
8.023	55.607
8.023	52.868
8.987	56.613
9.004	59.974
9.022	61.343
9.022	57.858
9.022	55.742
9.039	58.854
10.003	63.096
12.000	63.366];
data.tL_f(:,1) = (0.75 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};   label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BalbRoss2019';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
1.033	18.688
1.033	22.920
1.050	21.302
1.928	29.901
1.945	28.407
1.980	35.254
1.980	34.133
1.997	24.922
2.049	26.167
2.049	22.682
2.066	32.018
2.961	29.787
2.996	30.534
2.996	42.858
3.013	36.260
3.030	27.671
3.030	28.916
3.030	38.501
3.891	34.278
3.908	36.643
3.960	32.287
4.011	30.669
5.062	39.020
6.026	39.653];
data.tL_m(:,1) = (0.75 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};   label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BalbRoss2019';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females,  males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: wet weight in g = 0.00295*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DY6N'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46565106'; % Ency of Life
metaData.links.id_Wiki = 'Urophycis_mystacea'; % Wikipedia
metaData.links.id_ADW = 'Urophycis_mystacea'; % ADW
metaData.links.id_Taxo = '692066'; % Taxonomicon
metaData.links.id_WoRMS = '272521'; % WoRMS
metaData.links.id_fishbase = 'Urophycis-mystacea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urophycis_mystacea}}';
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
bibkey = 'BalbRoss2019'; type = 'Article'; bib = [ ... 
'doi = {10.20950/1678-2305.2019.45.2.426}, ' ...
'author = {Thiago Jos\''{e} Balbi and Carmem L\''{u}cia Del Bianco Rossi-Wongtschowski and Cesar Santificetur}, ' ... 
'year = {2019}, ' ...
'title = {GROWTH OF THE {B}RAZILIAN CODLING, \emph{Urophycis mystacea}, ({P}HYCIDAE-{G}ADIFORMES) OF SOUTHEASTERN {B}RAZIL}, ' ...
'journal = {Bol. Inst. Pesca}, ' ...
'volume = {45(2)}, ' ...
'pages = {e.426}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.se/summary/Urophycis-mystacea.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NAFO'; type = 'Misc'; bib = [ ...
'title = {Early Stages of Fishes in the Western North Atlantic Ocean}, ' ...
'howpublished = {\url{https://www.nafo.int/Library/Fahay}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
