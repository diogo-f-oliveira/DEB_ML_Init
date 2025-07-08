function [data, auxData, metaData, txtData, weights] = mydata_Heterodon_platirhinos
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Heterodon_platirhinos'; 
metaData.species_en = 'Eastern hognose snake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTg', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 50;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(24.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '49-63 d';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 18;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Wiki';
  comment.Lb = '16.5-21 cm';
data.Li  = 116;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 2.3;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'guess';
  comment.Wwi = 'based on (Lb/Li)^3*Wwi=(18/116)^3*601';
data.Wwi = 601;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'AnAge';
  
data.Ri  = 25/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-40 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% length-weight
data.LW_f = [ ... % time lengthh (cm), wet weight (g)
28.998	12.167
29.209	10.375
29.683	11.929
33.062	20.032
34.177	20.439
34.873	19.255
35.330	20.750
37.115	24.340
39.033	21.178
40.820	33.996
41.240	31.867
41.362	35.204
41.671	28.420
42.912	33.169
43.916	34.521
47.190	47.970
53.182	50.199
57.865	86.848
58.800	101.859
59.419	89.050
61.022	88.619
61.601	101.883
63.283	93.161
63.449	112.568
63.698	95.989
63.899	100.391
64.308	108.180
64.530	104.476
64.757	99.403
64.897	136.033
65.837	101.917
66.241	117.169
67.586	112.605
71.665	157.245
75.583	155.729
77.802	202.791
80.397	228.572
82.213	293.224
84.210	241.497
88.416	327.293];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight'};  
bibkey.LW_f = 'Plat1969'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % time lengthh (cm), wet weight (g)
26.402	14.768
28.256	10.169
29.202	11.124
29.495	26.992
29.792	10.906
30.130	18.675
30.171	12.983
30.946	18.218
30.993	12.051
31.663	20.028
32.524	18.869
32.558	14.277
33.494	21.695
34.483	11.134
34.790	15.011
35.345	18.597
35.726	15.239
36.016	25.075
37.725	26.493
38.477	27.987
38.781	20.149
39.026	22.149
40.340	22.938
40.805	37.556
41.921	34.001
42.225	29.138
42.492	31.872
43.044	35.387
44.470	42.342
44.784	38.139
45.512	43.631
46.143	38.336
46.235	54.867
47.817	49.428
48.082	27.330
48.474	44.969
48.969	42.787
49.043	69.702
49.103	50.178
49.310	39.511
49.767	48.463
49.902	57.119
50.516	75.870
50.559	60.640
51.746	61.560
52.225	75.506
52.283	56.006
52.473	51.718
52.620	59.456
53.115	70.078
53.144	60.655
54.880	81.382
55.095	69.743
55.290	66.027
55.308	60.366
56.025	67.696
56.389	70.801
56.753	74.790
57.878	81.811
57.901	73.322
59.032	86.426
59.605	94.065
59.992	98.379
60.635	81.830
61.378	110.330
61.386	106.551
61.437	85.586
61.973	120.682
63.876	110.903
64.494	121.308
65.153	115.422
66.451	122.541
66.639	140.177
67.146	109.286
67.542	134.043
68.890	140.901
68.956	109.301
69.203	101.943
70.294	132.742
70.508	143.038
71.961	126.939
71.969	123.203
72.872	154.157
72.906	136.113
73.625	141.652
73.860	147.411
73.913	121.392
74.800	175.488
75.851	147.431
80.634	252.511];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight'};  
bibkey.LW_m = 'Plat1969'; 
comment.LW_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since birth (mnth), SVL (cm)
    0 18.8
    9 30.9
   21 48.8
   33 54.6
   45 59.2];
data.tL_f(:,1) = data.tL_f(:,1)* 30.5; % convert mnth to d
data.tL_f(:,2) = data.tL_f(:,2)* 1.18; % convert SVL to total length
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Plat1969'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (mnth), SVL (cm)
    0 19.9
    9 32.1
   21 56.0
   33 63.0
   45 68.5];
data.tL_m(:,1) = data.tL_m(:,1)* 30.5; % convert mnth to d
data.tL_m(:,2) = data.tL_m(:,2)* 1.22; % convert SVL to total length
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Plat1969'; 
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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3L99B'; % Cat of Life
metaData.links.id_ITIS = '563935'; % ITIS
metaData.links.id_EoL = '1056290'; % Ency of Life
metaData.links.id_Wiki = 'Heterodon_platirhinos'; % Wikipedia
metaData.links.id_ADW = 'Heterodon_platirhinos'; % ADW
metaData.links.id_Taxo = '49944'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Heterodon&species=platirhinos'; % ReptileDB
metaData.links.id_AnAge = 'Heterodon_platirhinos'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterodon_platirhinos}}';
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
bibkey = 'Plat1969'; type = 'Article'; bib = [ ... 
'author = {Dwight R. Platt}, ' ... 
'year = {1969}, ' ...
'title = {Natural History of the Hognose Snakes \emph{Heterodon platyrhinos} and \emph{Heterodon nasicus}}, ' ...
'journal = {University of Kansas Publications, Museum of Natural History}, ' ...
'volume = {18(4)}, ' ...
'pages = {253-420}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Heterodon_platirhinos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Heterodon_platirhinos/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];