function [data, auxData, metaData, txtData, weights] = mydata_Plectropomus_maculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Plectropomus_maculatus'; 
metaData.species_en = 'Spotted coralgrouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 01];

%% set data
% zero-variate data

data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'Ferr1993'; 
data.Li  = 125;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 359;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Ferr1993','fishbase'};
  comment.Wwp = 'based on 0.01122*Li^3.05, see F1';
data.Wwi = 27.9e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.05, see F1; max published weight 25 kg';
 
data.Ri = 3e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(17.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.017	12.282
0.018	10.905
0.019	8.840
0.954	22.041
0.973	20.090
0.974	26.859
1.011	15.043
1.012	15.961
1.030	22.615
1.031	23.074
1.048	24.680
1.049	25.483
1.945	24.572
1.964	30.996
1.965	29.734
1.966	28.702
1.967	27.096
1.968	23.998
1.969	23.654
1.983	32.832
2.001	35.241
2.002	31.914
2.003	26.178
2.004	22.278
2.021	25.719
2.041	36.045
2.042	28.014
2.918	38.116
2.937	29.512
2.938	40.296
2.956	27.676
2.957	31.692
2.958	34.445
2.975	36.166
2.976	39.263
2.977	41.328
2.994	43.508
3.013	28.250
3.032	42.361
3.986	30.322
4.005	48.219
4.022	44.089
4.023	33.535
4.024	29.175
4.025	28.487
4.026	26.996
4.043	45.925
4.044	36.174
4.045	35.371
4.081	42.943
4.082	39.157
4.083	27.914
4.958	36.295
4.977	38.245
4.978	41.802
4.979	44.670
4.994	30.215
4.995	43.293
4.996	47.194
4.997	48.685
5.015	34.460
5.016	51.095
5.968	38.252
5.969	36.417
5.988	33.205
6.006	53.855
6.007	43.874
6.026	50.184
6.027	39.859
6.045	42.498
6.999	46.864
7.952	52.148
11.976	58.028];
data.tL(:,1) = (0.6+data.tL(:,1)) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FerrRuss1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VQLC'; % Cat of Life
metaData.links.id_ITIS = '167935'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Plectropomus_maculatus'; % Wikipedia
metaData.links.id_ADW = 'Plectropomus_maculatus'; % ADW
metaData.links.id_Taxo = '105921'; % Taxonomicon
metaData.links.id_WoRMS = '218267'; % WoRMS
metaData.links.id_fishbase = 'Plectropomus-maculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectropomus_maculatus}}';
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
bibkey = 'FerrRuss1992'; type = 'article'; bib = [ ... 
'author = {Ferreira, B.P. and G.R. Russ}, ' ... 
'year = {1992}, ' ...
'title = {Age, growth and mortality of the inshore coral trout \emph{Plectropomus maculatus} ({P}isces: {S}erranidae) from the central {G}reat {B}arrier {R}eef, {A}ustralia}, ' ...
'journal = {Aust. J. Mar. Freshwat. Res.}, ' ...
'volume = {43(5)}, '...
'pages = {1301-1312}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ferr1993'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1993.tb00393.x}, ' ...
'author = {Ferreira, B.P.}, ' ... 
'year = {1993}, ' ...
'title = {Reproduction of the inshore coral trout \emph{Plectropomus maculates} ({P}erciformes: {S}erranidae) from the Central {G}reat {B}arrier {R}eef, {A}ustralia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {42(6)}, '...
'pages = {831–844}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Plectropomus-maculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

