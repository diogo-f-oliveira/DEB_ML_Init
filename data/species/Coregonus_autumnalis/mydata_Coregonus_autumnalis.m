  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_autumnalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_autumnalis'; 
metaData.species_en = 'Arctic cisco'; 

metaData.ecoCode.climate = {'ME', 'ET'};
metaData.ecoCode.ecozone = {'MN','TH'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T';'t-Ww_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2019 02 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 25]; 

%% set data
% zero-variate data
data.am = 12*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(-0.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = '28 to 34 cm';
data.Li = 65;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Computed from egg diameter of 1.5 mm for Coregonus_albula: pi/6*0.15^3';
data.Wwp = 238;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.21, see F1';
data.Wwi = 2.7e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.21, see F1';
    
data.Ri = 9e4/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';          bibkey.Ri = 'fishbase';
  temp.Ri = C2K(-0.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time (d), total length (cm)
0.018	9.224
1.187	9.482
2.076	9.318
3.246	9.594
4.399	9.654
5.131	9.576
6.129	9.757
7.119	9.834
8.182	9.791
9.080	9.747
10.147	9.756
11.136	9.824
12.047	9.936
13.108	9.875
14.361	10.151
15.107	10.254
16.256	10.271
17.161	10.305
18.495	10.572
19.462	10.374
20.273	10.261
21.255	10.235
22.250	10.373
23.352	10.821
24.333	10.786
25.407	10.881
26.644	10.975
27.441	10.690
28.359	10.888
29.517	11.009
30.569	10.845
31.400	10.982
32.490	11.267
33.387	11.206
34.446	11.128
35.683	11.214
36.647	10.972
37.477	11.101
38.465	11.153
39.442	11.066
40.640	11.678
41.429	11.298
42.519	11.591
49.534	11.150
50.450	11.322
51.536	11.572
52.507	11.416
53.480	11.278
54.881	11.364
55.799	11.570
56.790	11.648
57.872	11.846
58.687	11.785
59.765	11.931
60.753	11.983
62.962	11.930
63.877	12.094
64.843	11.869
65.909	11.869
66.741	12.015
67.984	12.188
69.297	12.196
70.129	12.342];
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length', '9.5 C'};  
temp.tL = C2K(9.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FechFitz1993';
%
data.tL05 = [ ... % time (d), total length (cm)
 0.000	9.272
11.806	9.502
19.653	9.645
27.418	9.833
35.263	9.961
42.260	10.135];
units.tL05 = {'d', 'cm'}; label.tL05 = {'time', 'total length', '5 C'};  
temp.tL05 = C2K(5);  units.temp.tL05 = 'K'; label.temp.tL05 = 'temperature';
bibkey.tL05 = 'FechFitz1993';
%
data.tL10 = [ ... % time (d), total length (cm)
 0.000	9.166
11.749	9.941
19.615	10.387
27.482	10.848
35.177	11.280
42.276	11.711];
units.tL10 = {'d', 'cm'}; label.tL10 = {'time', 'total length', '10 C'};  
temp.tL10 = C2K(10);  units.temp.tL10 = 'K'; label.temp.tL10 = 'temperature';
bibkey.tL10 = 'FechFitz1993';

% time-weight
data.tW05 = [ ... % time (d), total length (cm)
 0.000	5.491
12.083	6.693
20.012	7.196
27.858	7.999
35.957	8.502
42.948	9.009];
units.tW05 = {'d', 'g'}; label.tW05 = {'time', 'wet weight', '5 C'};  
temp.tW05 = C2K(5);  units.temp.tW05 = 'K'; label.temp.tW05 = 'temperature';
bibkey.tW05 = 'FechFitz1993';
%
data.tW10 = [ ... % time (d), total length (cm)
 0.000	5.430
12.010	7.828
20.120	9.405
27.807	11.163
35.919	12.920
42.836	14.502];
units.tW10 = {'d', 'g'}; label.tW10 = {'time', 'wet weight', '10 C'};  
temp.tW10 = C2K(10);  units.temp.tW10 = 'K'; label.temp.tW10 = 'temperature';
bibkey.tW10 = 'FechFitz1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL10','tL','tL05'}; subtitle1 = {'Data for 10, 9.5, 5 C'};
set2 = {'tW10','tW05'}; subtitle2 = {'Data for 10, 5 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature is guessed at the preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'YD8D'; % Cat of Life
metaData.links.id_ITIS = '161933'; % ITIS
metaData.links.id_EoL = '46563165'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_autumnalis'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_autumnalis'; % ADW
metaData.links.id_Taxo = '192548'; % Taxonomicon
metaData.links.id_WoRMS = '127179'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-autumnalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_autumnalis}}';  
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
bibkey = 'FechFitz1993'; type = 'Article'; bib = [ ...  
'author = {R. G. Fechhelm and P. S. Fitzgerald and J. D. Bryan and B. J. Gallaway}, ' ...
'year = {1993}, ' ...
'title = {Effect of salinity and temperature on the growth of yearling {A}rctic cisco (\emph{Coregonus autumnalis}) of the {A}laskan {B}eaufort {S}ea}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'pages = {463-474}, ' ...
'volume = {43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coregonus-autumnalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

