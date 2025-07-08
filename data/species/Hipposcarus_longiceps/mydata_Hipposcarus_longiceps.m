function [data, auxData, metaData, txtData, weights] = mydata_Hipposcarus_longiceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Hipposcarus_longiceps'; 
metaData.species_en = 'Pacific longnose parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 11];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32.9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'TaylCruz2017'; 
data.Lim  = 60;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 449; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','TaylCruz2017'};
  comment.Wwp = 'based on 0.01175*Lp^3.02, see F1';
data.Wwi = 2755; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.02, see F1';

data.GSI = 3*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'TaylCruz2017';
  temp.GSI = C2K(27.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'assumed: 3 spawnings per year';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.962	24.670
0.963	25.727
0.974	20.441
0.987	24.141
0.988	27.665
0.989	31.366
0.990	35.507
0.998	19.559
0.999	21.145
1.000	22.907
1.001	30.220
1.002	32.247
1.012	22.115
1.015	32.952
1.077	26.784
1.958	34.009
1.959	36.916
1.961	43.524
1.970	28.282
1.983	28.899
1.995	25.903
2.011	37.621
2.021	27.665
2.033	23.172
2.047	30.661
2.048	35.242
2.966	30.661
2.968	39.119
2.979	33.304
3.016	31.542
3.017	32.511
3.018	34.449
3.045	42.731
3.056	34.802
3.949	35.066
3.975	39.119
3.987	36.035
4.014	43.260
4.026	40.352
4.027	45.198
4.969	35.419
4.982	37.004
4.983	41.674
5.022	43.172
5.047	40.705
5.058	32.863
6.003	37.533
6.004	41.674
6.017	42.379
7.024	39.119
7.025	44.141
7.038	46.696
7.050	42.026
8.006	42.026
8.007	47.048
8.019	40.881
9.001	41.762
9.027	43.965];
data.tL_f(:,1) = 365*(0.2+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylCruz2017';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.039	28.987
1.982	24.317
1.996	28.899
2.008	26.696
2.011	40.617
2.022	32.863
2.035	31.630
2.036	35.859
2.050	42.291
2.062	38.767
2.967	38.150
2.994	41.938
3.006	39.824
3.007	44.053
3.018	36.035
3.019	37.181
3.032	40.969
3.058	45.903
3.964	47.930
3.975	36.740
4.000	37.797
4.002	44.317
4.003	45.903
4.012	33.921
4.027	41.233
4.028	46.784
4.041	48.899
4.052	42.203
4.971	44.053
4.985	49.427
5.007	36.564
5.008	37.797
5.009	39.031
5.011	50.220
5.022	45.639
5.036	47.577
6.003	38.590
6.005	48.899
6.017	43.700
6.018	50.308
6.030	46.784
6.042	39.824
6.043	45.727
6.044	47.930
7.000	47.225
7.012	43.436
7.013	50.396
8.008	48.194
8.046	46.344
9.016	50.308
10.024	51.454
10.036	48.722];
data.tL_m(:,1) = 365*(0.2+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylCruz2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 15 * weights.tL_f;
weights.tL_m = 15 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01175*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Sleeps in a mucus cocoon';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4V3NW'; % Cat of Life
metaData.links.id_ITIS = '170815'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scarus_taeniopterus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_taeniopterus'; % ADW
metaData.links.id_Taxo = '46376'; % Taxonomicon
metaData.links.id_WoRMS = '276062'; % WoRMS
metaData.links.id_fishbase = 'Scarus-taeniopterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scarus_taeniopterus}}';
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
bibkey = 'TaylCruz2017'; type = 'Article'; bib = [ ... 
'doi = {10.7717/peerj.4079}, ' ...
'author = {Brett M. Taylor1 and Eric Cruz}, ' ... 
'year = {2017}, ' ...
'title = {Age-based and reproductive biology of the {P}acific Longnose Parrotfish \emph{Hipposcarus longiceps} from {G}uam}, ' ...
'journal = {PeerJ}, ' ...
'volume = {5}, ' ...
'pages = {e4079}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-taeniopterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

