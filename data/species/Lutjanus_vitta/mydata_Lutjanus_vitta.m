function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_vitta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_vitta'; 
metaData.species_en = 'Brownstripe red snapper';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 21]; 
metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 26/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NewmCapp2000';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase: max reprod age is 12 yr';
  
data.Lp  = 15.4; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'fishbase';
data.Lim  = 40;  units.Lim  = 'cm';  label.Lim  = 'ultimate fork length for males'; bibkey.Lim  = {'fishbase','NewmCapp2000'};
  comment.Lim = 'based on tL data and Li';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwi = 840; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01413*Li^2.98, see F1';

data.Ri  = 749e3/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_carponotatus';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.027	18.499
1.027	18.116
2.002	23.751
2.004	20.192
2.005	18.276
2.005	17.400
2.018	20.959
3.022	25.991
3.025	20.024
4.016	22.811
4.074	23.413
5.051	23.519
6.043	24.555
9.005	23.885
9.006	23.009
11.046	26.833
12.039	25.405];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NewmCapp2000';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.983	18.828
1.012	19.923
1.975	18.660
1.988	21.889
2.002	22.765
2.003	21.616
2.003	21.287
2.003	21.068
2.004	19.754
2.031	24.955
2.032	22.327
2.048	19.152
2.062	20.520
2.088	26.104
2.981	21.338
2.995	22.049
2.996	20.462
2.996	20.133
2.996	19.367
3.009	23.637
3.009	23.308
3.023	24.513
3.024	23.144
3.038	22.925
3.038	22.597
3.039	21.611
4.002	21.060
4.028	27.246
4.029	26.644
4.029	26.370
4.029	25.275
4.029	25.001
4.030	24.673
4.030	24.399
4.030	23.742
4.031	22.209
4.031	21.826
4.031	21.443
4.032	19.910
4.044	26.041
4.045	23.304
4.045	23.195
4.045	22.866
4.045	22.538
4.059	24.070
5.006	26.694
5.021	26.420
5.022	24.942
5.023	21.822
5.036	26.037
5.036	25.380
5.036	24.723
5.036	24.450
5.037	22.917
5.051	24.176
5.067	22.260
6.000	23.077
6.013	27.292
6.014	23.898
6.014	23.405
6.029	24.226
6.044	22.310
7.005	27.014
7.007	22.854
8.012	27.119
8.012	26.682
8.012	25.970
8.014	22.849
9.062	26.239];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NewmCapp2000';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

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
F1 = 'weight-length relationship: W in g = 0.01413 * (FL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WGDJ'; % Cat of Life
metaData.links.id_ITIS = '168896'; % ITIS
metaData.links.id_EoL = '46580740'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_vitta'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_vitta'; % ADW
metaData.links.id_Taxo = '106211'; % Taxonomicon
metaData.links.id_WoRMS = '218483'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-vitta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_vitta}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-vitta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
