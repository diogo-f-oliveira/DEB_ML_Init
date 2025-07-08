function [data, auxData, metaData, txtData, weights] = mydata_Dentex_macrophthalmus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Dentex_macrophthalmus'; 
metaData.species_en = 'Large-eye dentex'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 09];

%% set data
% zero-variate data

data.ab = 13;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(14.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(14.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Dentex dentex';

data.Lp  = 15.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 65;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 46.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01148*Lp^3.03, see F1';
data.Wwi = 3573;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01148*Li^3.03, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(14.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
7.117	15.759
7.972	16.517
8.043	19.828
9.038	20.931
9.039	17.759
10.036	22.379
10.107	20.931
10.961	21.966
11.031	18.724
11.032	21.000
11.957	19.069
11.958	17.966
12.028	19.483
12.100	22.103
12.101	20.034
12.883	23.897
12.954	19.966
13.096	20.862
13.238	23.000
13.950	17.207
13.951	22.448
13.952	23.483
13.953	23.759
13.954	24.655
14.021	22.862
14.022	25.069
14.093	20.034
14.164	21.276
14.165	24.241
14.947	25.552
14.948	25.207
15.015	28.034
15.016	26.310
15.017	24.793
15.018	23.690
15.019	22.517
15.020	21.828
15.021	20.448
15.086	24.310
15.087	23.138
15.088	21.069
15.089	19.690
15.801	23.414
15.943	21.000
15.944	24.724
15.945	26.034
16.012	20.448
16.013	23.000
16.014	25.138
16.015	25.552
16.016	28.586
16.082	21.690
16.083	22.517
16.084	23.759
16.085	24.241
16.086	26.586
16.940	23.897
16.941	21.966
17.010	27.276
17.011	26.517
17.012	25.345
17.013	24.586
17.014	21.069
17.015	20.517
17.082	22.655
17.153	23.138
17.862	21.138
17.863	21.897
17.864	25.207
17.934	22.448
17.935	22.793
17.936	23.552
17.937	24.586
18.007	26.862
18.078	27.828
18.079	28.655
19.004	27.276
19.005	23.966
19.072	26.310
19.073	23.000
19.074	22.379
19.075	21.621
19.076	21.207
19.077	20.379
19.146	25.000
19.929	26.586
20.000	21.759
20.001	22.448
20.002	22.931
20.003	24.310
20.854	22.103
20.925	23.621
20.926	24.241
20.996	23.000
21.851	22.862
21.922	29.138
21.993	22.310
22.064	23.552
22.918	30.172
22.989	27.483
23.132	23.000
23.915	28.724
23.986	24.310
24.128	29.345
24.129	25.000
24.199	30.517
24.840	30.379
25.907	23.759
25.979	28.034
26.050	29.207
27.900	25.966
28.897	32.793
28.898	29.207
28.899	27.897
35.943	29.690];
data.tL_f(:,1) = 365*(1.5+ data.tL_f(:,1)); % set origin at birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(14.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PottInac2010';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
7.029	19.827
8.253	15.813
9.030	17.682
9.868	22.042
10.016	20.519
10.023	18.512
10.029	16.920
10.097	17.612
11.011	20.796
11.075	22.941
11.150	21.834
11.236	17.751
11.929	23.010
12.015	18.789
12.075	21.903
12.082	19.896
12.084	19.481
12.138	24.187
12.159	18.304
12.936	20.035
12.995	23.495
13.009	19.343
13.069	22.457
13.075	21.003
13.133	24.533
13.915	24.948
13.918	24.118
13.987	24.533
13.991	23.564
13.994	22.734
14.066	22.457
14.071	21.142
14.075	19.827
14.135	23.149
14.912	24.602
14.918	22.941
14.981	25.294
14.985	24.256
15.051	25.640
15.058	23.633
15.064	22.042
15.137	21.488
15.140	20.727
15.141	20.242
15.145	19.343
15.895	28.547
15.914	23.287
15.979	24.948
15.980	24.602
15.981	24.325
15.983	23.841
15.995	20.450
15.997	19.827
16.057	22.872
16.119	25.502
16.201	22.457
16.275	21.834
16.907	24.256
16.908	23.910
16.912	22.595
17.063	20.311
17.195	23.218
17.912	21.626
17.973	24.464
18.049	23.080
18.050	22.803
18.052	22.388
18.128	20.934
18.911	21.073
18.914	20.035
18.976	22.595
19.037	25.502
19.043	23.910
19.174	27.163
19.963	25.433
20.038	24.325
20.051	20.657
20.821	24.256
20.950	27.993
21.026	26.678
21.037	23.564
21.039	23.080
21.114	22.042
21.901	20.796
21.962	23.772
21.965	22.941
22.038	22.388
22.947	26.955
23.019	26.609
23.181	21.211
24.093	24.810
25.228	25.779
26.019	23.702
26.079	26.886
26.956	20.311
28.096	20.104
29.082	22.941
37.314	29.654];
data.tL_m(:,1) = 365*(0 + data.tL_m(:,1)); % set origin at birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(14.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PottInac2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01148*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34TTW'; % Cat of Life
metaData.links.id_ITIS = '169221'; % ITIS
metaData.links.id_EoL = '46579939'; % Ency of Life
metaData.links.id_Wiki = 'Dentex'; % Wikipedia
metaData.links.id_ADW = 'Dentex_macrophthalmus'; % ADW
metaData.links.id_Taxo = '172984'; % Taxonomicon
metaData.links.id_WoRMS = '273965'; % WoRMS
metaData.links.id_fishbase = 'Dentex-macrophthalmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentex}}';
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
bibkey = 'PottInac2010'; type = 'Article'; bib = [ ... 
'author = {Potts, W.M. and L.A. In\''{a}cio and C.V. Santos and T.J. Richardson and W.H. Sauer}, ' ... 
'year = {2010}, ' ...
'title = {Aspects of the biology and fisheries of an economically important sparid \emph{Dentex macrophthalmus} ({B}loch 1791) in the {N}amibe province, {A}ngola}, ' ...
'journal = {Afr. J. Mar. Sci.}, ' ...
'volume = {32(3)}, ' ...
'pages = {601-611}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Dentex-macrophthalmus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
