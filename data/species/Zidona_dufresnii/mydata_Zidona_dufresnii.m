function [data, auxData, metaData, txtData, weights] = mydata_Zidona_dufresnii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Volutidae';
metaData.species    = 'Zidona_dufresnii'; 
metaData.species_en = 'Dufresni''s volute'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 18*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'GimeBrey2004';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.73; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'ArriPenc2018';
  comment.Lb = 'based on same relative length compared to Adelomelon_beckii: 1.72*21/49.5';
data.Lp  = 12.5; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty for female'; bibkey.Lp  = 'GimeBrey2004';
data.Li  = 21;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'GimeBrey2004';

data.Wwi = 350;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'GimeBrey2004';
  comment.Wwi = 'based on 10^(-1.482+1.733*log10(10*Li)), see F1';

data.Ri  = 1.6e3/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.8';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.983	1.055
0.984	1.318
1.031	1.959
1.033	2.712
1.947	3.653
1.968	2.787
2.015	3.051
2.977	4.821
3.021	4.105
3.021	4.256
3.022	4.444
4.004	5.235
4.007	6.554
4.032	7.156
4.992	7.947
4.993	8.588
5.009	5.612
5.009	5.800
5.010	6.177
5.016	8.776
5.034	6.441
5.950	8.136
5.953	9.341
5.953	9.605
5.993	7.043
5.994	7.420
6.063	7.721
6.935	10.056
6.961	11.036
6.979	9.040
7.031	11.902
7.051	10.584
7.054	12.128
7.068	8.023
7.965	11.299
7.988	11.601
7.991	12.768
8.010	11.073
8.032	10.659
8.032	10.885
8.035	12.166
8.083	13.107
8.130	13.522
9.063	12.731
9.064	13.070
9.065	13.371
9.065	13.672
9.066	14.049
9.067	14.426
10.001	13.748
10.002	14.350
10.003	14.463
10.003	14.576
10.049	14.991
10.051	15.518
10.070	13.974
11.010	15.970
11.031	15.104
11.032	15.556
11.054	15.330
12.060	16.083
12.060	16.460
12.061	16.723
13.018	16.422
13.043	17.100
13.088	16.761
14.024	17.100
14.025	17.514
14.071	17.966
15.009	18.757
15.053	18.041
15.053	18.380
15.989	18.493
16.012	18.757
16.013	19.171
17.017	19.247
17.018	19.510
17.041	19.736];
units.tL   = {'yr', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GimeBrey2004';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: log10(g SFWM) = -1.482+1.733*log10(mm SL)';
metaData.bibkey.F1 = 'GimeBrey2004';
F2 = 'Feeds mostly on Mytilus edulis platensis and Aequipecten tehuelchus, but also other molluscs';
metaData.bibkey.F2 = 'GimeBrey2004';
F3 = 'egg capsules 20 mm in basal diameter';
metaData.bibkey.F3 = 'GimeBrey2004';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '5D4TR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '59184473'; % Ency of Life
metaData.links.id_Wiki = 'Zidona'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5741729'; % Taxonomicon
metaData.links.id_WoRMS = '382412'; % WoRMS
metaData.links.id_molluscabase = '382412'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Zidona_dufresnei}}';
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
bibkey = 'GimeBrey2004'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-004-1364-0}, ' ...
'author = {J. Gim\''{e}nez and T. Breyand A. Mackensen and P. E. Penchaszadeh}, ' ... 
'year = {2004}, ' ...
'title = {Age, growth, and mortality of the prosobranch \emph{Zidona dufresnei} ({D}onovan, 1823) in the {M}ar del {P}lata area, south-western {A}tlantic {O}cean}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {145}, ' ...
'pages = {707-712}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArriPenc2018'; type = 'Article'; bib = [ ... 
'author = {Florencia Arrighetti and Pablo E. Penchaszadeh}, ' ... 
'year = {2018}, ' ...
'title = {Biology and conservation of the giant marine snail \emph{Adelomelon beckii} in {A}rgentina}, ' ...
'journal = {Tentacle}, ' ...
'volume = {26}, ' ...
'pages = {19-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
