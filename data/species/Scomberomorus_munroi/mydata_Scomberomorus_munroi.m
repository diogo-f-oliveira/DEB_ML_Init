function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_munroi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_munroi'; 
metaData.species_en = 'Australian spotted mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 13];

%% set data
% zero-variate data

data.ab = 5.5;   units.ab = 'd';   label.ab = 'age at birth';                 bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'BeggSell1998';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 61;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 104; units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of Scomberomorus maculatus: pi/6*0.1^3';
data.Wwp = 2.1e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.03, see F1';
data.Wwi = 10758;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.03, see F1; max published weight 12.2 kg';

data.Ri = 1.5e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Scomberomorus_brasiliensis: 4e5*(100/65)^3';

% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), fork length (cm)
0.944	55.933
0.964	54.170
0.966	51.523
0.973	70.053
0.992	71.378
1.116	57.933
1.191	60.146
1.195	54.632
1.209	62.795
1.215	53.089
1.217	50.001
1.225	67.869
1.230	59.708
1.247	63.680
1.250	57.504
1.269	58.829
1.280	71.404
1.284	64.786
1.325	61.481
1.859	67.484
1.931	76.535
1.932	74.329
1.933	72.564
1.934	71.020
1.935	70.579
1.936	69.697
1.937	68.153
1.938	65.506
1.959	61.537
1.977	63.745
2.073	65.077
2.093	62.873
2.126	72.361
2.129	66.846
2.151	61.995
2.153	59.790
2.154	58.025
2.160	78.099
2.162	74.790
2.167	67.732
2.175	56.042
2.185	70.381
2.186	68.837
2.187	67.954
2.210	60.898
2.840	68.233
2.853	77.057
2.863	62.720
2.871	79.044
2.874	75.074
2.889	81.913
2.894	73.531
2.895	71.767
2.900	64.708
2.902	61.841
2.909	80.812
3.085	75.092
3.108	70.021
3.110	67.153
3.121	78.846
3.122	77.743
3.126	71.125
3.138	53.700
3.144	73.554
3.145	72.671
3.148	68.039
3.158	81.055
3.813	80.451
3.830	82.879
3.833	78.688
3.894	73.399
3.900	64.135
3.905	85.753
3.918	66.122
4.081	82.239
4.117	86.433
4.926	84.299]; 
data.tL_f(:,1) = (0.8 + data.tL_f(:,1)) * 365;   % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BeggSell1998'; 
%
data.tL_m = [ ... % yr class (yr), fork length (cm)
0.880	45.755
1.124	57.683
1.125	56.359
1.128	51.286
1.144	55.699
1.145	54.596
1.146	54.375
1.147	53.493
1.148	53.272
1.149	53.272
1.169	48.641
1.862	55.084
1.871	71.409
1.876	64.129
1.877	60.600
1.878	59.718
1.879	58.836
1.880	58.836
1.897	61.704
1.899	57.293
2.077	52.893
2.130	60.176
2.131	58.632
2.132	57.970
2.149	61.280
2.151	57.089
2.152	56.868
2.153	55.986
2.187	62.606
2.792	54.925
2.825	62.869
2.826	62.428
2.827	61.545
2.828	60.884
2.844	64.635
2.848	59.120
2.849	57.576
2.863	66.401
2.881	68.387
2.884	63.755
2.885	63.755
3.057	65.531
3.065	52.958
3.097	63.769
3.100	58.475
3.102	55.608
3.119	60.021
3.133	67.301
3.136	62.448
3.137	62.007
3.156	61.788
3.157	60.905
3.158	60.905
3.794	64.918
3.795	64.036
3.829	69.332
3.830	68.671
3.831	67.126
3.832	65.803
3.833	65.803
3.834	62.935
3.848	70.657
3.855	60.510
3.858	56.099
3.886	71.762
4.081	69.570
4.083	66.702
4.085	64.055
4.087	61.188
4.105	62.953
4.107	59.424
4.119	71.116
4.142	66.485
4.182	64.503
4.825	58.810
4.837	69.620
4.854	73.591
4.855	72.047
4.856	69.400
4.857	68.297
4.858	67.194
4.859	65.209
4.862	60.798
4.918	63.890
5.071	67.209
5.092	65.886
5.151	64.346
5.786	71.006
5.847	66.598
5.879	76.527
6.115	72.131
6.831	73.501
6.871	71.519]; 
data.tL_m(:,1) = (0.8 + data.tL_m(:,1)) * 365;   % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BeggSell1998'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTXJ'; % Cat of Life
metaData.links.id_ITIS = '202047'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_munroi'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_munroi'; % ADW
metaData.links.id_Taxo = '187073'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-munroi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_munroi}}';
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
bibkey = 'BeggSell1998'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF97057}, ' ...
'author = {Gavin A. Begg and Michelle J. Sellin}, ' ... 
'year = {1998}, ' ...
'title = {Age and growth of school mackerel (\emph{Scomberomorus queenslandicus}) and spotted mackerel (\emph{S. munroi}) in {Q}ueensland east-coast waters with implications for stock structure}, ' ...
'journal = {Mar. Freshwater Res.}, ' ...
'volume = {49}, ' ...
'pages = {109–120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Begg1998'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf97187}, ' ...
'author = {Gavin A. Begg}, ' ... 
'year = {1998}, ' ...
'title = {Reproductive biology of school mackerel (\emph{Scomberomorus queenslandicus}) and spotted mackerel (\emph{S. munroi}) in {Q}ueensland east-coast waters}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {49(3)}, ' ...
'pages = {261-–270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-munroi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
