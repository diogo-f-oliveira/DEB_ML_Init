function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_erythropterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_carponotatus'; 
metaData.species_en = 'Spanish flag snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NewmCapp2000';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'fishbase';
data.Lim  = 36;  units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males'; bibkey.Lim  = {'fishbase','NewmCapp2000'};
  comment.Lim = 'based on tL data and Li';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 859; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^2.98, see F3';

data.Ri  = 749e3/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
2.023	18.998
2.024	17.893
3.044	19.827
3.998	21.831
4.994	25.354
5.997	22.867
5.997	22.314
5.998	21.831
5.998	21.485
6.080	26.528
7.013	27.841
7.055	29.706
7.974	24.180
7.974	23.696
8.012	29.223
8.015	26.459
8.970	27.841
8.990	29.292
8.990	28.946
9.013	28.325
9.971	26.805
10.012	28.670
10.014	27.565
10.987	31.572
11.991	27.910
11.993	26.183
14.030	32.608
14.106	22.591
14.968	29.085
14.972	25.492
17.098	29.430];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NewmCapp2000';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.044	19.136
2.046	17.824
2.933	21.416
2.951	24.732
2.973	25.147
2.975	23.351
2.997	22.867
3.930	23.972
3.972	25.769
3.993	26.598
3.993	26.183
4.013	27.841
4.014	27.219
4.951	24.732
4.965	32.401
4.991	28.117
4.994	25.769
5.011	29.499
5.012	29.085
5.029	33.437
5.031	31.779
5.031	31.088
5.036	26.459
5.970	27.841
5.990	29.361
5.990	29.154
6.030	32.055
6.031	31.572
6.050	33.921
6.962	35.233
6.985	33.437
7.004	36.408
7.010	30.466
7.083	23.282
7.994	25.907
8.033	29.914
8.051	33.161
8.134	36.477
9.033	29.775
9.053	31.157
9.985	33.644
10.003	37.168
10.005	34.957
10.009	31.917
10.939	35.924
10.942	33.092
10.958	38.342
11.919	34.128
13.966	31.295
16.026	35.855
18.004	36.477
18.027	35.371
20.007	33.368];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NewmCapp2000';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'weight-length relationship: W = 0.01445(FL in cm )^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WG8M'; % Cat of Life
metaData.links.id_ITIS = '168875'; % ITIS
metaData.links.id_EoL = '46580763'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_carponotatus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_carponotatus'; % ADW
metaData.links.id_Taxo = '179212'; % Taxonomicon
metaData.links.id_WoRMS = '276528'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-carponotatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_carponotatus}}';
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
bibkey = 'NewmCapp2000'; type = 'Article'; bib = [ ... 
'author = {Stephen J. Newman and Michael Cappo and David Williams}, ' ... 
'year = {2000}, ' ...
'title = {Age, growth and mortality of the stripey, \emph{Lutjanus carponotatus} ({R}ichardson) and the brown-stripe snapper, \emph{L. vitta} ({Q}uoy and {G}aimard) from the central {G}reat {B}arrier {R}eef, Australia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {48}, ' ...
'pages = {263-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-carponotatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
