function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_queenslandicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_queenslandicus'; 
metaData.species_en = 'Queensland school mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
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
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'BeggSell1998';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 48;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100; units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm of Scomberomorus maculatus: pi/6*0.1^3';
data.Wwp = 1e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.03, see F1';
data.Wwi = 9.55e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.03, see F1; max published weight 12.2 kg';

data.Ri = 1.5e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Scomberomorus_brasiliensis: 4e5*(100/65)^3';

% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), fork length (cm)
0.001	44.730
0.002	37.300
0.003	35.478
0.004	32.814
0.005	46.693
0.006	42.628
0.007	36.600
0.008	31.974
0.009	34.077
0.010	30.993
1.000	47.982
1.001	42.935
1.002	39.991
1.003	56.814
1.004	47.001
1.005	41.674
1.006	38.310
1.007	35.366
1.008	61.160
1.009	37.048
1.010	48.824
1.011	45.600
1.012	44.058
1.013	32.843
1.014	55.133
1.015	50.086
1.016	46.161
1.017	59.479
1.018	53.872
1.019	52.750
1.020	50.928
2.000	48.150
2.001	54.319
2.002	61.328
2.003	56.702
2.004	53.758
2.005	52.637
2.006	49.833
2.007	64.693
2.008	57.403
2.009	55.020
2.010	45.908
2.011	62.871
2.012	55.581
2.013	51.937
2.014	50.815
2.015	59.927
2.016	59.227
3.000	58.552
3.001	57.010
3.002	55.889
3.003	61.216
3.004	53.786
3.005	62.058
3.006	49.301
3.007	64.301
3.008	62.759
3.009	59.815
3.010	55.049
3.011	52.385
3.012	72.012
3.013	50.984
4.000	57.037
4.001	67.412
4.002	65.590
4.003	51.712
4.004	62.507
4.005	53.535
4.006	63.909
4.007	69.237
5.000	57.908
5.001	53.282
5.002	66.180
5.003	60.712
5.004	55.105
5.005	68.283
5.006	70.105
6.000	73.077
6.001	67.189
7.000	78.012]; 
data.tL_f(:,1) = (0.8 + data.tL_f(:,1)) * 365;   % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BeggSell1998'; 
%
data.tL_m = [ ... % yr class (yr), fork length (cm)
0.001	44.878
0.002	39.411
0.003	32.962
0.004	43.476
0.005	37.869
0.006	37.168
0.007	36.748
0.008	35.766
0.009	35.205
0.010	33.944
0.011	33.523
0.012	32.542
0.013	31.981
0.014	30.720
0.015	38.570
0.016	34.645
1.000	43.925
1.001	43.224
1.002	40.140
1.003	60.327
1.004	53.738
1.005	52.757
1.006	49.532
1.007	48.551
1.008	47.850
1.009	47.009
1.010	45.888
1.011	44.906
1.012	42.944
1.013	42.383
1.014	36.776
1.015	57.243
1.016	56.542
1.017	52.056
1.018	51.355
1.019	51.075
1.020	50.514
1.021	64.953
1.022	59.346
1.023	55.841
1.024	54.720
1.025	41.262
1.026	58.085
1.027	55.421
2.000	51.802
2.001	50.681
2.002	49.840
2.003	55.868
2.004	54.326
2.005	52.924
2.006	44.093
2.007	49.280
2.008	48.439
2.009	47.598
2.010	64.140
2.011	62.878
2.012	62.598
2.013	56.991
2.014	55.308
2.015	65.122
2.016	62.178
2.017	61.196
2.018	59.935
2.019	58.953
2.020	58.112
2.021	57.692
3.022	61.784
3.023	61.084
3.024	57.158
3.025	52.813
3.026	67.392
3.027	51.691
3.028	63.327
3.029	56.038
3.030	53.795
3.031	64.028
3.032	59.963
3.033	59.542
3.034	55.477
3.035	58.141
3.036	59.123
4.000	59.289
4.001	58.869
4.002	66.579
4.003	63.635
4.004	62.935
4.005	62.514
4.006	60.972
4.007	58.308
4.008	56.346
4.009	55.645
4.010	69.103
4.011	65.038
4.012	62.094
4.013	60.271
5.000	68.009
5.001	66.046
5.002	64.505
5.003	62.963
5.004	62.682
5.005	61.842
5.006	55.393
6.000	62.990
6.001	67.757
10.00	69.131]; 
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
metaData.links.id_CoL = '4VTXN'; % Cat of Life
metaData.links.id_ITIS = '172447'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_queenslandicus'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_queenslandicus'; % ADW
metaData.links.id_Taxo = '187065'; % Taxonomicon
metaData.links.id_WoRMS = '273811'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-queenslandicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_queenslandicus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-queenslandicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
