function [data, auxData, metaData, txtData, weights] = mydata_Labrus_bergylta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Labrus_bergylta'; 
metaData.species_en = 'Ballan wrasse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 06];

%% set data
% zero-variate data

data.am = 29*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25.6;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based onLabrus_merula: 20.6*65.9/53';
data.Li  = 65.9;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'guess';

data.Wwb = 1.95e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MuncAnde2010';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 201;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','GordMoli2000'};
  comment.Wwp = 'based on 0.00955*Lp^3.07, see F1';
data.Wwi = 3.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'fishbase','GordMoli2000'};
  comment.Wwi = 'based on 0.00955*Li^3.07, see F1';

data.GSI  = 0.012;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'MuncAnde2010';   
  temp.GSI = C2K(16);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.908	16.795
1.996	22.228
1.997	21.263
1.997	20.176
1.999	18.727
2.087	23.195
2.813	30.925
2.855	35.754
2.904	32.736
2.904	31.649
2.910	24.406
2.913	19.818
2.952	29.114
2.953	28.028
2.953	27.545
2.957	22.957
2.957	22.112
2.961	18.008
2.961	17.404
3.005	20.422
3.138	25.252
3.778	26.704
3.821	30.205
3.827	22.962
3.866	31.775
3.914	28.757
3.954	36.846
3.962	25.498
4.736	31.537
4.867	39.385
4.868	38.661
4.876	28.279
4.876	27.434
4.916	36.247
4.919	32.263
4.920	30.573
4.923	26.468
5.790	30.577
5.835	31.422
5.929	28.042
6.020	29.612
6.890	28.530
6.890	28.288
7.900	24.792
7.942	30.829
7.943	29.380
8.032	31.916
8.948	32.403
8.950	29.988
8.988	40.009
8.990	36.991
9.724	35.666
10.916	33.740
12.704	30.731
12.882	37.130
13.843	37.859
13.984	32.910];
data.tL_f(:,1) = 365 * (.75 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(19.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'VillAlon2013';
comment.tL_f = 'plain colour variant';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
3.955	34.793
3.955	34.431
3.957	32.982
3.960	28.033
4.000	35.759
4.095	31.172
4.872	33.832
4.960	37.695
4.961	37.092
4.964	32.987
5.008	35.161
5.012	29.366
5.919	40.839
5.929	28.163
5.968	36.855
6.013	37.580
6.014	36.252
6.016	34.320
6.058	39.391
6.061	35.045
6.063	32.993
6.064	31.906
6.104	38.546
6.886	34.807
6.888	31.306
6.925	42.775
6.927	40.723
6.929	38.429
6.931	35.653
6.932	34.083
6.932	33.721
6.936	29.254
6.973	39.758
6.975	37.584
6.979	32.876
6.981	30.341
7.025	32.394
7.805	29.983
7.935	38.917
7.936	38.193
7.937	37.468
7.937	36.986
7.941	31.311
7.984	35.658
7.984	34.933
7.985	34.088
7.986	32.881
8.025	41.453
8.898	37.956
8.946	34.817
8.948	32.644
8.988	39.526
8.991	36.025
8.991	35.542
8.992	33.973
8.995	31.196
9.082	37.112
9.085	33.249
9.907	35.305
9.948	42.186
9.956	30.838
9.995	39.772
10.040	41.100
10.043	37.720
10.046	33.736
10.048	30.235
10.089	36.996
10.092	32.650
10.093	31.926
10.135	36.634
10.821	37.724
10.827	29.997
10.867	37.000
10.915	34.585
10.917	32.533
10.960	35.672
10.963	32.171
11.052	34.828
11.785	33.986
11.914	45.335
11.916	42.317
11.967	36.401
11.967	35.436
12.007	43.404
12.011	37.730
12.787	42.079
12.883	35.561
12.884	34.112
12.926	39.183
12.927	37.855
12.973	38.217
13.068	33.509
13.112	36.165
13.888	38.222
13.927	47.759
13.936	35.566
13.975	44.500
14.941	38.830
14.944	34.484
15.026	47.040
15.903	38.835
15.947	40.646
16.957	36.546
17.000	40.530
19.019	34.745
21.991	40.796];
data.tL_m(:,1) = 365 * (.75 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(19.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'VillAlon2013';
comment.tL_m = 'plain colour variant';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00955*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3RKYF'; % Cat of Life
metaData.links.id_ITIS = '170737'; % ITIS
metaData.links.id_EoL = '46571663'; % Ency of Life
metaData.links.id_Wiki = 'Labrus_bergylta'; % Wikipedia
metaData.links.id_ADW = 'Labrus_bergylta'; % ADW
metaData.links.id_Taxo = '46352'; % Taxonomicon
metaData.links.id_WoRMS = '126965'; % WoRMS
metaData.links.id_fishbase = 'Labrus-bergylta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labrus_bergylta}}';
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
bibkey = 'VillAlon2013'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0071591}, ' ...
'author = {David Villegas-R\''{i}os and Alexandre Alonso-Fern\''{a}ndez and Mari\~{n}a Fabeiro and Rafael Ba\~{n}\''{o}n and Fran Saborido-Rey}, ' ... 
'year = {2013}, ' ...
'title = {Demographic Variation between Colour Patterns in a Temperate Protogynous Hermaphrodite, the Ballan Wrasse \emph{Labrus bergylta}}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {8(8)}, ' ...
'pages = {e71591}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuncAnde2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02691.x}, ' ...
'author = {S. Muncaster and E. Andersson and O. S. Kjesbu and G. L. Taranger and A. B. Skiftesvik and B. Norberg}, ' ... 
'year = {2010}, ' ...
'title = {The reproductive cycle of female {B}allan wrasse \emph{Labrus bergylta} in high latitude, temperate waters}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {77(3)}, ' ...
'pages = {494–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Labrus-bergylta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

